Button = {}

function Button:new(args)
  -- Magic setup for our objects
  local o = args.o or {}
  setmetatable(o, self)
  self.__index = self

  o.width = args.width or 150
  o.height = args.height or 50
  o.x = args.x or 250
  o.y = args.y or 250
  o.text = args.text or { { 0, 0, 0 }, "button text" }
  o.callback = args.callback or function()
    return true
  end

  return o
end

function Button:position()
  return self.x, self.y
end

function Button:setPosition(x, y)
  self.x = x
  self.y = y
end

-- check if a click is inside the mouse box
function Button:inBound()
  local px, py = love.mouse.getPosition()
  -- check that its between x and x + width
  local cx = px >= self.x and px <= self.x + self.width
  -- check that its between y and y + height
  local cy = py >= self.y and py <= self.y + self.height
  -- If both are true, we return true
  return cx and cy
end

function Button:check()
  if love.mouse.isDown(1) and self:inBound() then
    return self.callback()
  end
end

function Button:call()
  return self.callback()
end

function Button:draw()
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
  love.graphics.print(self.text,
    self.x + self.width / 5,
    self.y + self.height / 5)
end

return Button
