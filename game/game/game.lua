local M = {}

local Types = require("lib.types")
local Gamestate = require("lib.gamestate")
local Player = require("lib.player")
local Maptools = require("lib.map")

local gamestate = Gamestate:new(Maptools.Map:new(), Player:new("stub", 1, nil))

-- constants
local mapTiles = 21
local halfMapTiles = math.floor(mapTiles / 2)
local wwidth, wlength = love.graphics.getDimensions()
local tileWidth = wwidth / mapTiles
local tileLength = wlength / mapTiles
local tileBorder = 1

-- defaults
local xMin = 50
local yMin = 50

local function outOfBound(pos)
  local x = pos.x
  local y = pos.y
  local mapSize = gamestate:get_map().size

  local inX = 0 <= x and x <= mapSize - 1
  local inY = 0 <= y and y <= mapSize - 1

  local tile = gamestate.get_map():get(y + 1, x + 1)
  local onWater = false
  if tile then
    onWater = tile.type == Maptools.TilesType.water
  end

  return not (inX and inY and not onWater)
end

M.update = function(state)
  if not gamestate then
    return
  end

  local pred = true -- quit predicate, yet to be sorted

  -- init gamestate for this loop
  if state.gamestate then
    gamestate = Gamestate:new(state.gamestate.map, state.gamestate.player)
  else
    local map = state.map
    local player = Player:new("stub", nil, { 1, 0.5, 0.5 })
    gamestate = Gamestate:new(map, player)
  end

  -- handle movement
  local isDown = love.keyboard.isDown

  local posPointer = gamestate:get_player():get_position()
  local oldPos = { x = posPointer.x, y = posPointer.y }

  if isDown("up") then
    gamestate:get_player().change_position_by_amount(0, -1)
  elseif isDown("down") then
    gamestate:get_player().change_position_by_amount(0, 1)
  elseif isDown("left") then
    gamestate:get_player().change_position_by_amount(-1, 0)
  elseif isDown("right") then
    gamestate:get_player().change_position_by_amount(1, 0)
  end

  if outOfBound(gamestate:get_player():get_position()) then
    gamestate:get_player().set_position(oldPos.x, oldPos.y)
  end

  -- print("curr")
  -- print(require("deps.dkjson").encode(gamestate:get_player():get_position()))

  -- calculate grid
  local pPos = gamestate:get_player():get_position()

  gamestate:get_map():get(pPos.y + 1, pPos.x + 1).character = true

  xMin = pPos.x - halfMapTiles
  yMin = pPos.y - halfMapTiles

  -- get ready for next loop
  if pred then
    return Types.modules.game, { gamestate = gamestate:dump() }
  else
    return Types.modules.quit, {}
  end
end

M.draw = function()
  -- sometimes this will be called before update, exit fast if this is the case
  if not gamestate then
    return
  end

  for y = 0, mapTiles do
    for x = 0, mapTiles do
      local coords = { y = yMin + y, x = xMin + x }

      local tile = gamestate:get_map():get(coords.y + 1, coords.x + 1)

      -- set the current tile colour
      if tile then
        if tile.character then
          love.graphics.setColor(gamestate:get_player():get_sprite())
          tile.character = false
        else
          love.graphics.setColor(Maptools.TileColour[tile.type])
        end
      else
        love.graphics.setColor({ 0, 0, 0 })
      end

      love.graphics.rectangle("fill",
        x * tileWidth,
        y * tileLength,
        tileWidth - tileBorder,
        tileLength - tileBorder
      )
    end
  end
end

return M
