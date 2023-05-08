local Map = {}
local Tiles = {}

local Json = require("deps.dkjson")

function Map:new()
    local obj = {
        tiles = {},
        size = 100,
        is_generated = false
    }

    for i = 1, obj.size do
        obj.tiles[i] = {}
        for j = 1, obj.size do
            obj.tiles[i][j] = Tiles:new()
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
    return "stub"
end

function Tiles:new()
    local obj = {
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
    return Json.encode(self)
end

return { TilesType = TilesType, Map = Map, Tiles = Tiles, TileColour = TileColour }
