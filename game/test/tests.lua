local lu = require("deps.luaunit")
local Maptools = require("lib.map")

MapTest = {}
function MapTest:setup()
  self.map = Maptools.Map:new()
end

function MapTest:testLength()
  lu.assertEquals(#self.map.tiles, 100)
end

os.exit(lu.LuaUnit.run())
