 M = {}

local Player = require("lib.player")
local Maptools = require("lib.map")
local Gamestate = require("lib.gamestate")
local json = require("deps.dkjson")

local filename = "savegame.json"
-- savefile function takes in an argument which is the gameState and doesn't return anything.
function M.Savefile(gameState)

-- inside the savefile function, uses the map and player that contains the get function 
--which gets the map and player 
    local map = gameState.get_map()
    local player = gameState.get_player()

-- also the savefile uses mapString and playerString which turns the map and player to 
--strings
    local mapString = map:toString()
    local playerString = player:toString()
-- saveString contains a map and player table which has the mapStringand playerString
    local saveString = { map = mapString, player = playerString }
-- filesystem writes the filename which is savegame.json as a string then encodes the table 
    love.filesystem.write(filename, json.encode(saveString)) -- saves the table in the savegame
end

-- the LoadGame function doesnt take any parameter, so the function will load and read
--the filename but if there is no data it will display an error
function M.LoadGame()
    -- reading in savefile.txt
    local data, error = love.filesystem.read(filename)

    -- if there is an error, just let the caller handle it
    if data == nil then
        return data, error
    end
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
