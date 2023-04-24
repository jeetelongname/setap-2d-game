require "player"
require "map"

Gamestate = {}

function Gamestate:new(map, player)

    local map = {}
    local player = {}
    
    local obj = {

        get_map = function()
            return map
        end,

        set_map = function(setMap)
            map = setMap
        end,

        get_player = function()
            return player
        end,

        set_player = function(setPlayer)
            player = setPlayer
        end

    }
    setmetatable(obj, self)
    self.__index = self

end

return Gamestate