require "lib.player"
require "lib.map"

Gamestate = {}

function Gamestate:new(initmap, initplayer)

    local map = initmap
    local player = initplayer
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
    return obj
end

return Gamestate