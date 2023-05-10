Button = {}

-- Create a button object.
-- Arguments are taken inside a table
-- args.width, args.height: number, the width and height of the button.
-- args.x, args.y: number, the x and y coordinate of the *top left* corner of the button
-- args.text: { { number, number, number }, string}, the text the button will display.
-- The first value is a table that represents a tri colour value, the second is the string that will be used
-- args.callback: function() returns a, where a is by default a boolean. This is the callback that is called when the button is clicked.
-- It can be used for side effects as well as just checking if the button has been clicked
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

-- returns the position of the top left corner of the button
-- return number, number
function Button:position()
  return self.x, self.y
end

-- sets the position of the top left corner of the button
-- x: number
-- y: number
-- return nil
function Button:setPosition(x, y)
  self.x = x
  self.y = y
end

-- check if the bouse is inside the mouse box
-- takes no arguments
-- returns boolean
function Button:inBound()
  local px, py = love.mouse.getPosition()
  -- check that its between x and x + width
  local cx = px >= self.x and px <= self.x + self.width
  -- check that its between y and y + height
  local cy = py >= self.y and py <= self.y + self.height
  -- If both are true, we return true
  return cx and cy
end

-- check if the mouse is, inBound and if the mouse has been clicked. if so call the callback and return the result
-- takes no arguments
-- returns a where a is the return type of the callback
function Button:check()
  if love.mouse.isDown(1) and self:inBound() then
    return self.callback()
  end
end

-- call the callback,
-- takes no arguments
-- returns a, where a is the return type of the callback
function Button:call()
  return self.callback()
end

-- draw the button. this is only functional in `love.draw`.
-- takes not arguments
-- returns nil
function Button:draw()
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
  love.graphics.print(self.text,
    self.x + self.width / 5,
    self.y + self.height / 5)
end

return Button
