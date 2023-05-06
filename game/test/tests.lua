local lu = require("deps.luaunit")
local Maptools = require("lib.map")

MapTest = {}
function MapTest:setup()
  self.map = Maptools.Map:new()
end

function MapTest:testLength()
  lu.assertEquals(#self.map.tiles, 100)
end

function MapTest:toString()
  local dummyObj = {
    tiles = {},
    size  = 100
  }

  for i = 1, 100 do
    dummyObj.tiles[i] = {}
    for j = 1, 100 do
      dummyObj.tiles[i][j] = Tiles:new()
    end
  end



  lu.assertEquals(self.map:toString(),)
end

os.exit(lu.LuaUnit.run())
