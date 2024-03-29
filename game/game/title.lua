local M = {}

local Types = require("lib.types")
local Button = require("lib.button")
local Save = require("lib.savefile")

local black = { 0, 0, 0 }
-- when clicked, return true to start the game
local startButton = Button:new { text = { black, "Start Game" }, x = 300, y = 250 }

local loadButton = Button:new { text = { black, "Load last game" }, x = 300, y = 320 }

local quitButton = Button:new { text = { black, "Exit" }, x = 300, y = 390 }

-- this is a function that checks the state of the titlescreen. It has two valid states either empty table or start = true.
M.update = function(state)
  local start = state.start or startButton:check()
  local load = loadButton:check()
  local quit = quitButton:check()

  if start then
    -- generate a new map
    return Types.modules.map, {}
  elseif load then
    -- load a game
    local gstate, error = Save.LoadGame()

    -- handle an error by just starting a new game
    if error then
      love.window.showMessageBox(
        "Error when loading save",
        tostring(error) .. " Starting new game",
        "info",
        true
      )

      return Types.modules.title, { start = true }
    end
    -- jump into the game module with the loaded state if all is well
    return Types.modules.game, { gamestate = gstate }
  elseif quit then
    return Types.modules.quit, {}
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
  quitButton:draw()
end

return M
