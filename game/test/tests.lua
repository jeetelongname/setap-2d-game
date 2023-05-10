local lu = require("deps.luaunit")
local json = require("deps.dkjson")
local Maptools = require("lib.map")
local Player = require("lib.player")
local Button = require("lib.button")

-- a hack to get tests to run
love = {
  graphics = {
    getDimensions = function()
      return 100, 100
    end
  },
  mouse = {
    getPosition = function()
      return 50, 50
    end
  }
}

MapTest = {}
function MapTest:setup()
  self.map = Maptools.Map:new()
end

function MapTest:testLength()
  lu.assertEquals(#self.map.tiles, 100)
end

-- Visually inspect this one.
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
  lu.assertEquals(outOfBound { x = 101, y = 0 }, true)
  lu.assertEquals(outOfBound { x = 50, y = 50 }, false)
end

Playertest = {}
function Playertest:setup()
  self.player = Player:new("test", 5, { 0, 244, 65 })
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
  lu.assertEquals(self.player.get_sprite(), { 0, 244, 65 })
end

function Playertest:testHealth()
  lu.assertEquals(self.player.get_health(), 100)
  self.player.set_health(50)
  lu.assertEquals(self.player.get_health(), 50)
  self.player.change_health(-20)
  lu.assertEquals(self.player.get_health(), 30)
end

function Playertest:testPosition()
  lu.assertEquals({ self.player.get_position().x, self.player.get_position().y }, { 50, 50 })
  self.player.set_position(25, 34)
  lu.assertEquals({ self.player.get_position().x, self.player.get_position().y }, { 25, 34 })
  self.player.change_position_by_amount(-25, -34)
  lu.assertEquals({ self.player.get_position().x, self.player.get_position().y }, { 0, 0 })
end

function Playertest:testInventory()
  testList = {}
  for i = 1, 20 do
    testList[i] = -1
  end
  lu.assertEquals(self.player.inventory.get_inventory_all(), testList)
end
  
-- visually inspect this one
function Playertest:testParsePlayer()
  lu.assertEquals(self.player.parsePlayer(self.player.toString()), self.player)
end

os.exit(lu.LuaUnit.run())
