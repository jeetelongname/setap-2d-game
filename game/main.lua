local steps = {
    -- this works as require essentually resolves
    -- to the modules return value
    require "game.title",
    require "game.map"
}

Types = require("lib.types")

local current = Types.modules.title

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
end

-- Draw a coloured rectangle.
function love.draw()
    steps[current].draw()
end
