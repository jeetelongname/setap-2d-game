local M     = {}

Types       = require("lib.types")
Maptools    = require("lib.map")

-- Love has an implict loop, every frame will call both update and draw
-- this means we can generate a tile every frame and draw it in a sick looking animation:
-- NOTE: that a tile every frame might be a little slow, so i generate a row every frame.
local map   = Maptools.Map:new()

-- I wish lua had a const keyword.
-- row is the current row we are on
local row   = 1

-- tiles is the grid we are working on.
local tiles = map.tiles

-- this is the base random numbers that seed the noise.
local baseX = 10000 * love.math.random()
local baseY = 10000 * love.math.random()

-- play with these for smootheness. the larger the value the gritter the map
local gradX = .1
local gradY = .05

function M.update()
  local done = false

  if row ~= #tiles then
    row = row + 1
  else
    done = true
  end
  local y = row

  for x, tile in ipairs(tiles[row]) do
    tile.noise = love.math.noise(baseY + gradX * y, baseX + gradY * x)

    if tile.noise >= 0 and tile.noise < 0.3 then
      tile.type = Maptools.TilesType.water
    elseif tile.noise >= 0.3 and tile.noise < 0.45 then
      tile.type = Maptools.TilesType.beach
    elseif tile.noise >= 0.45 and tile.noise < 0.9 then
      tile.type = Maptools.TilesType.grass
    else
      tile.type = Maptools.TilesType.snow
    end
  end

  if done and love.mouse.isDown(1) then
    return Types.modules.quit
  else
    return Types.modules.map
  end
end

function M.draw()
  local tileSize = 8
  local tileBorder = 0.4
  for y = 1, row do
    for x, tile in ipairs(map.tiles[y]) do
      local tileType = tile.type
      local tileColour = Maptools.TileColour[tileType]
      love.graphics.setColor(tileColour)
      love.graphics.rectangle("fill", x * tileSize, y * tileSize, tileSize - tileBorder, tileSize - tileBorder)
    end
  end
end

return M
