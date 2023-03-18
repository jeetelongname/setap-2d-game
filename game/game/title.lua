M = {}

Types = require("lib.types")
Button = require("lib.button")
local message = "hello"

M.update = function()

  startButton = Button:new()

  local pred = startButton:check()

  if pred then
    return Types.modules.quit
  else
    return Types.modules.title
  end
end

M.draw = function()
  love.graphics.print("hello", 100, 100)
  startButton:draw()
end

return M
