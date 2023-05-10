local lu = require("deps.luaunit")
local Maptools = require("lib.map")

MapTest = {}
function MapTest:setup()
  self.map = Maptools.Map:new()
end

function MapTest:testLength()
  lu.assertEquals(#self.map.tiles, 100)
end

function MapTest:testTileStr()
  local tile = self.map:get(1, 1)
  lu.assertEquals(tile:toString(),
    [[{
  "character":false,
  "is_noised":false,
  "type":1
}]])
  -- code
end

Gametest = {}
function Gametest:testBound()
  local outOfBound = require("game.game").private.outOfBound

  lu.assertEquals(outOfBound { x = 101, y = 101 }, true)
  lu.assertEquals(outOfBound { x = 0, y = 0 }, false)
end

Savetest = {}
function Savetest:testsave()
end

function Savetest:loadfile()
end

os.exit(lu.LuaUnit.run())
