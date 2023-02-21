Serialize = require("lib/ser")
function Savefile()
    local save = {} -- created a table to store variables
    save.progress = progress
    save.worldmap = worldmap
    save.currentinventory = currentinventory
    save.chests = chests
    save.usersposition= usersposition
    save.spawnedNPC = spawnedNPC
    save.items = items
    save.currentpoints = currentpoints
    save.stats = stats
    Savefile.filesystem.write ("savegame.txt", Serialize(save))-- saves the table in the savegame
end

function