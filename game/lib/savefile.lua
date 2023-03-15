M = {}
Serialize = require("lib/ser")
function M.Savefile()
    local save = {} -- created a table to store variables
    local progress = {}
    local worldmap ={}
    local currentinventory = {}
    local chests = {}
    --local usersposition = {}
    local spawnedNPC ={}
    local items = {}
    local currentpoints = {}
    local stats = {}
    save.Savefile = Savefile
    save.progress = progress
    save.worldmap = worldmap
    save.currentinventory = currentinventory
    save.chests = chests
    --save.usersposition= usersposition
    save.spawnedNPC = spawnedNPC
    save.items = items
    save.currentpoints = currentpoints
    save.stats = stats
    Savefile.filesystem.write ("savegame.txt", Serialize(save))-- saves the table in the savegame
end
return M