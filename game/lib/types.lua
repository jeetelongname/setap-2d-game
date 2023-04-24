M = {}

M.modules = {
  quit = -1,
  title = 1
}

M.Point = {}

function M.Point:new(obj, x, y)
  obj = obj or {}
  setmetatable(obj, self)
  self.__index = self

  obj.x = x
  obj.y = y

  return obj
end

function M.Point:getPosition()
  return self.x, self.y
end

return M
