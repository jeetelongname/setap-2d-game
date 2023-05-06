local M = {}
local Types = require("lib.types")

-- local json = require("deps.dkjson")
local Gamestate = require("lib.gamestate")
local Player = require("lib.player")
local Maptools = require("lib.map")

local gamestate = Gamestate:new(Maptools.Map:new(), Player:new("stub", 1, nil))

local mapTiles = 10
local wwidth, wlength = love.graphics.getDimensions()
local tileWidth = wwidth / mapTiles
local tileLength = wlength / mapTiles
local tileBorder = 1

local xMin = 50
local yMin = 50

M.update = function(state)
  if not gamestate then
    return
  end

  local pred = true
  local map = state.map
  local player = Player:new("stub", 1, { 1, 1, 1 })

  if state.gamestate then
    gamestate = Gamestate:new(state.gamestate.map, state.gamestate.player)
  else
    gamestate = Gamestate:new(map, player)
  end

  local pPos = gamestate:get_player():get_position()
  xMin = pPos.x - 2
  yMin = pPos.y - 2

  if pred then
    return Types.modules.game, { gamestate = gamestate:dump(), map = map }
  else
    return Types.modules.quit, {}
  end
end

M.draw = function()
  if not gamestate then
    return
  end

  for y = 0, mapTiles do
    for x = 0, mapTiles do
      local tile = gamestate:get_map():get(yMin + y, xMin + x)

      love.graphics.setColor(Maptools.TileColour[tile.type])
      love.graphics.rectangle("fill", x * tileWidth, y * tileLength, tileWidth - tileBorder, tileLength - tileBorder)
    end
  end
end

return M
