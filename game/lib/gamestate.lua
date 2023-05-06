local Gamestate = {}

function Gamestate:new(firstmap, firstplayer)
    local map = firstmap or {}
    local player = firstplayer or {}

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
        end,
        dump = function()
            return { player = player, map = map }
        end
    }
    setmetatable(obj, self)
    self.__index = self

    return obj
end

return Gamestate
