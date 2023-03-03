M = {}

Types = require("lib.types")

local message = "hello"

M.update = function()
  if love.keyboard.isDown("e") then
    message = "hi"
  end

  if love.keyboard.isDown("r") then
    message = "hello"
  end

  -- stub until a proper predicate is run
  local pred = love.keyboard.isDown("n")

  if pred then
    return Types.modules.quit
  else
    return Types.modules.title
  end

end

M.draw = function()
  love.graphics.print(message, 100, 100)
end

return M
