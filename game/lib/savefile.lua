M = {}
local Player = require("lib.player")
local Maptools = require("lib.map")
local Gamestate = require("lib.gamestate")
-- Serialize = require("lib/ser")
function M.Savefile(gameState)
    local map = gameState.get_map()
    local player = gameState.get_player()

    local mapString = map:toString()
    local playerString = player:toString()

    local saveString = { map = mapString, player = playerString }

    love.filesystem.write("savegame.txt", saveString) -- saves the table in the savegame
end

function M.LoadGame()
    -- read in savefile.txt
    local data, error = love.filesystem.read("savefile.txt")

    -- if there is no error, just let the caller handle it
    if data == nil then
        return data, error
    end
    -- decode data into a table using json.decode
    local json = require("deps.dkjson")
    --decode json string into a lua table
    local jsonDecode = json.decode(data)

    -- extract out map and player information using the new table
    local mapstr = jsonDecode.map
    local playerstr = jsonDecode.player
    -- use parse functions from map and player to turn the strings into a Map and Player Object
    local map = Maptools.parseMap(mapstr)
    local player = Player.parsePlayer(playerstr)

    -- return a new gamestate with these map and player objects
    return Gamestate:new(map, player):dump(), nil
end

return M
