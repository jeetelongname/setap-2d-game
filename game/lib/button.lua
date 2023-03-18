Button = {}

function Button:new(o, width, height, x, y, callback)
  -- Magic setup for our objects
  o = o or {}
  setmetatable(o,self)
  self.__index = self

  o.width = width or 100
  o.height = height or 50
  o.x = x or 250
  o.y = y or 250
  o.text = "button text"
  o.callback = callback or function()
    return true
  end

  return o
end

function Button:position()
  return self.x, self.y
end

function Button:check()
  x, y = love.mouse.getPosition()
  bx, by = self:position()

  if love.mouse.isDown(1) and true then
    return self.callback()
  end
end

function Button:call()
  return self.callback()
end

function Button:draw()
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

return Button
