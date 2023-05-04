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
    grass = 0,
    water = 1,
    beach = 2
}


function Map:tiles()
    return self.tiles
end

function Tiles:new()
    local obj = {
        item = nil,
        character = nil,
        type = TilesType.grass
    }


    setmetatable(obj, self)
    self.__index = self

    return obj
end

function Tiles:setType(type)
    self.type = type
end

return { Map = Map, Tiles = Tiles }
