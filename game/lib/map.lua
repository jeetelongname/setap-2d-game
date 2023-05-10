local Map = {}
local Tiles = {}

local Json = require("deps.dkjson")

-- Map is a 2d grid of tiles.
-- Takes iobj: {tiles: { Tiles }, size: number, is_generated: boolean} | nil
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

-- Tiletypes is an enum that contains all the Tile Types
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

-- get returns a specfic tile based on the row (y) and column (x)
-- take
-- row: number
-- column: number
-- returns Tile
function Map:get(row, column)
    local thisRow = self.tiles[row]
    if thisRow == nil then
        return
    else
        return thisRow[column]
    end
end

-- sets a tile value at position, row, column
-- takes
-- row: number
-- column: number
-- tile: Tiles
function Map:set(row, column, tile)
    self.tiles[row][column] = tile
end

-- returns a string representation of a map, used for saving the map
-- takes nothing
-- returns String
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

-- A tile is a single position in the grid
-- takes iobj: { item: Item | nil, character: boolean, type: TilesType, noise: number | nil, is_noised: boolean } | nil
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

-- Turns a tile into a string
-- takes nothing
-- returns a string
function Tiles:toString()
    return Json.encode(self, { indent = true })
end

-- a raise function that turns a string into a tile,
-- takes a string
-- returns a tile
local function parseTile(tilestr)
    return Tiles:new(Json.decode(tilestr))
end

-- a raise function that turns a string into a map,
-- takes a string
-- returns a map
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
