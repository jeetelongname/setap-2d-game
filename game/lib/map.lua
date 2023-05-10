local Map = {}
local Tiles = {}

local Json = require("deps.dkjson")

function Map:new(iobj)
    local obj = iobj or {
        tiles = {},
        size = 100,
        is_generated = false
    }

    if not iobj then
        for i = 1, obj.size do
            obj.tiles[i] = {}
            for j = 1, obj.size do
                obj.tiles[i][j] = Tiles:new()
            end
        end
    end

    setmetatable(obj, self)
    self.__index = self

    return obj
end

TilesType = {
    grass = 1,
    water = 2,
    beach = 3,
    snow  = 4
}

-- As tiles types resolve to a number, we use that fact to associate the type to the position in TileColour
TileColour = {
    { 0, 1, 0 },
    { 0, 1, 1 },
    { 1, 1, 0 },
    { 1, 1, 1 }
}

function Map:get(row, column)
    local thisRow = self.tiles[row]
    if thisRow == nil then
        return
    else
        return thisRow[column]
    end
end

function Map:set(row, column, tile)
    self.tiles[row][column] = tile
end

function Map:toString()
    local tilestrs = {}
    for y, row in ipairs(self.tiles) do
        tilestrs[y] = {}
        for x, tile in ipairs(row) do
            tilestrs[y][x] = tile:toString()
        end
    end

    return Json.encode({ tilestrs = tilestrs, size = self.size, is_generated = self.is_generated }, { indent = true })
end

function Tiles:new(iobj)
    local obj = iobj or {
        item = nil,
        character = false,
        type = TilesType.grass,
        noise = nil,
        is_noised = false
    }

    setmetatable(obj, self)
    self.__index = self

    return obj
end

function Tiles:toString()
    return Json.encode(self, { indent = true })
end

local function parseTile(tilestr)
    return Tiles:new(Json.decode(tilestr))
end

local function parseMap(mapstr)
    local mapobj = Json.decode(mapstr)
    local tiles = {}
    for y, row in ipairs(mapobj.tilestrs) do
        tiles[y] = {}
        for x, tile in ipairs(row) do
            tiles[y][x] = parseTile(tile)
        end
    end

    return Map:new { tiles = tiles, size = mapobj.size, is_generated = mapobj.is_generated }
end

return { TilesType = TilesType, Map = Map, Tiles = Tiles, TileColour = TileColour, parseMap = parseMap }
