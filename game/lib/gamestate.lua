local Gamestate = {}

-- The Gamestate holds the map and player in one object. It takes
-- firstmap: Map
-- firstplayer: Player
function Gamestate:new(firstmap, firstplayer)
    local map = firstmap or {}
    local player = firstplayer or {}

    local obj = {
        -- returns Map
        get_map = function()
            return map
        end,
        -- takes Map
        -- returns nil
        set_map = function(setMap)
            map = setMap
        end,
        -- returns Player
        get_player = function()
            return player
        end,
        -- takes Player
        -- returns nil
        set_player = function(setPlayer)
            player = setPlayer
        end,
        -- takes nothing
        -- returns { Player, Map }
        dump = function()
            return { player = player, map = map }
        end
    }
    setmetatable(obj, self)
    self.__index = self

    return obj
end

return Gamestate
