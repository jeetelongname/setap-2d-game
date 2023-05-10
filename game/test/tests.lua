local lu = require("deps.luaunit")
local Maptools = require("lib.map")
local Playertools = require("lib.player")

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

Playertest = {}
function Playertest:setup()
  self.player = Playertools.Player:new("test", 5, {0, 244, 65})
end

function Playertest:testName()
  lu.assertEquals(self.player.get_name(), "test")
end

function Playertest:testMovementSpeed()
  lu.assertEquals(self.player.get_movementSpeed(), 5)
  self.player.set_movementSpeed(2)
  lu.assertEquals(self.player.get_movementSpeed(), 2)
  self.player.change_movementSpeed(-1)
  lu.assertEquals(self.player.get_movementSpeed(), 1)
end

function Playertest:testSprite()
  lu.assertEquals(self.player.get_sprite(), {0, 244, 65})
end

function Playertest:testHealth()
  lu.assertEquals(self.player.get_health(), 100)
  self.player.set_health(50)
  lu.assertEquals(self.player.get_health(), 50)
  self.player.change_health(-20)
  lu.asserEquals(self.player.get_health(), 10)
end

function Playertest:testPosition()
  lu.assertEquals({self.player.get_position.x, self.player.get_position().y}, {50, 50})
  self.player.set_position(25, 34)
  lu.assertEquals({self.player.get_position.x, self.player.get_position().y}, {25, 34})
  self.player.change_position_by_amount(-25,-34)
  lu.assertEquals({self.player.get_position.x, self.player.get_position().y}, {0, 0})
end

function 

Savetest = {}
function Savetest:testsave()
end

function Savetest:loadfile()
end

os.exit(lu.LuaUnit.run())
