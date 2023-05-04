Map = {}
Tiles = {}

function Map:new()
    local obj = {
        tiles = {},
        size = 100
    }

    for i = 1, 100 do
        obj.tiles[i] = {}
        for j = 1, 100 do
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
    if column == nil then
        return self.tiles[row]
    else
        return self.tiles[row][column]
    end
end

function Map:set(row, column, tile)
    self.tiles[row][column] = tile
end

function Tiles:new()
    local obj = {
        item = nil,
        character = false,
        type = TilesType.grass,
        noise = nil
    }

    setmetatable(obj, self)
    self.__index = self

    return obj
end

function Tiles:setType(type)
    self.type = type
end

return { TilesType = TilesType, Map = Map, Tiles = Tiles, TileColour = TileColour }
