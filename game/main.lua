local steps = {
    -- this works as require essentually resolves
    -- to the modules return value
    require "game.title",
}

Types = require("lib.types")

local current = Types.modules.title
function love.load()
    local GameState = require("gamestate")
    local Map = require("lib.map")
    local Player = require("lib.player")
    local SaveFile = require("lib.savefile")
    local gameState = GameState:new(Map.Map:new(), Player:new())

    SaveFile.Savefile(gameState)
    print("done")
end
function love.update()
    if love.keyboard.isDown('q') then
        love.event.push('quit')
    end

    local nextModule = steps[current].update()
    if nextModule == Types.modules.quit then
        love.event.push("quit")
    else
        current = nextModule
    end
    print ("savefile.lua")
end

-- Draw a coloured rectangle.
function love.draw()
    steps[current].draw()
end
