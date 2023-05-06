local steps = {
    -- this works as require essentually resolves
    -- to the modules return value
    require("game.title"),
    require("game.map"),
    require("game.game")
}
local json = require("deps.dkjson")
local Types = require("lib.types")

local current = Types.modules.title
local nextModule = Types.modules.title

local state = {}
local nextState = {}

function love.update()
    if love.keyboard.isDown('q') then
        love.event.push('quit')
    end

    nextModule, nextState = steps[current].update(state)
    if nextModule == Types.modules.quit then
        love.event.push("quit")
    else
        current = nextModule
        state = nextState
    end
end

-- Draw a coloured rectangle.
function love.draw()
    steps[current].draw()
end
