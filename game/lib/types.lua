local M = {}

-- Modules is an enum which holds the index of all of the modules we use
M.modules = {
  quit  = -1,
  title = 1,
  map   = 2,
  game  = 3
}

M.Point = {}

-- A convenice wrapper around a point, takes in
-- obj: { number, number } | nil
-- x: number
-- y: number
function M.Point:new(obj, x, y)
  obj = obj or {}
  setmetatable(obj, self)
  self.__index = self

  obj.x = x
  obj.y = y

  return obj
end

-- returns number, number
function M.Point:getPosition()
  return self.x, self.y
end

-- turns point to string,
--   returns string
function M.Point:toString()
  return "x: " .. tostring(self.x) .. " y: " .. tostring(self.y)
end

return M
