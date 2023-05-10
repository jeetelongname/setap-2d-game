M = {}
local Player = require("lib.player")
local Maptools = require("lib.map")
local Gamestate = require("lib.gamestate")
-- Serialize = require("lib/ser")
function M.Savefile(gameState) --M.Savefile takes in the gameState as the parameter
  -- we get the map and player which is in the gamestate as map and also player
    local map = gameState.get_map()
    local player = gameState.get_player()

    -- mapStrings contains the map which are strings
    local mapString = map:toString()
    local playerString = player:toString()

  --saveString stores the table of map that contains mapString and player containing playerString
    local saveString = {map = mapString, player = playerString}

  -- saves the table which is the saveString in the savegame
    love.filesystem.write ("savegame.txt", saveString)
end

function M.LoadGame()
    -- read in savefile.txt
    local data = love.filesystem.read("savefile.txt")
  -- decode data into a table using json.decode
    local json = require("deps.dkjson")

    local jsonDecode = json.decode(data) --decode json string into a lua table

  -- we extract out map and player information using the new table
    local mapstr = jsonDecode.map
    local playerstr = jsonDecode.player

-- parse functions from map and player is used to turn the strings into a Map and Player Object
    local map = Maptools.parseMap(mapstr)
    local player = Player.parsePlayer(playerstr)

 -- return a new gamestate with  map and player objects
    return Gamestate:new(map, player)
end




return M
