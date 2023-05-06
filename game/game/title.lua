local M = {}

Types = require("lib.types")
Button = require("lib.button")
Mapthings = require("lib.map")
Message = "hello"

-- when clicked, return true to start the game
local startButton = Button:new { text = { { 0, 0, 0 }, "Start Game" }, x = 300, y = 250 }

-- this button toggles a message, its means to be a bit more of a full represenation of how to use the buttons
local messageButton = Button:new { text = { { 0, 0, 0 }, "toggle greeting" }, x = 300, y = 310,
  callback = function()
    if Message == "hello" then
      Message = "hi"
    else
      Message = "hello"
    end
  end }


M.update = function(_state)
  local pred = startButton:check()
  messageButton:check()

  if pred then
    -- next module
    return Types.modules.map, {}
  else
    -- otherwise keep showing the title
    return Types.modules.title, {}
  end
end

M.draw = function()
  -- game title
  love.graphics.print("Survival Game", 300, 200, 0, 2, 2)
  -- greeting message
  love.graphics.print(Message, 100, 100)
  -- draw buttons
  startButton:draw()
  messageButton:draw()
end

return M
