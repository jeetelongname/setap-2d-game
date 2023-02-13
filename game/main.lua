local steps = {
    -- this works as require essentually resolves
    -- to the modules return value
    require "game.title",
}

local current = 1
-- Increase the size of the rectangle every frame.
function love.update()
    if love.keyboard.isDown('q') then
        love.event.push('quit')
    end

    local isDone = steps[current].update()
    if isDone then
        current = current + 1
    end
end

-- Draw a coloured rectangle.
function love.draw()
    steps[current].draw()
end
