local M = {}

local Types = require("lib.types")
local Button = require("lib.button")
local Save = require("lib.savefile")


local black = { 0, 0, 0 }
-- when clicked, return true to start the game
local startButton = Button:new { text = { black, "Start Game" }, x = 300, y = 250 }

-- this button toggles a message, its means to be a bit more of a full represenation of how to use the buttons
local loadButton = Button:new { text = { black, "Load last game" }, x = 300, y = 320 }

M.update = function(state)
  local start = state.start or startButton:check()
  local load = loadButton:check()

  if start then
    -- generate a new map
    return Types.modules.map, {}
  elseif load then
    -- load a game
    local gstate, error = Save.LoadGame()
    -- handle an error by just starting a new game
    if error then
      love.window.showMessageBox("Error when loading save",
        tostring(error) .. " Starting new game",
        "info",
        true)

      return Types.modules.title, { start = true }
    end
    -- jump into the game module with the loaded state if all is well
    return Types.modules.game { gamestate = gstate }
  else
    -- otherwise keep showing the title
    return Types.modules.title, {}
  end
end

M.draw = function()
  -- game title
  love.graphics.print("Survival Game", 300, 200, 0, 2, 2)
  -- draw buttons
  startButton:draw()
  loadButton:draw()
end

return M
