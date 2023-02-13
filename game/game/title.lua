M = {}

local message = "hello"

M.update = function()
  if love.keyboard.isDown("e") then
    message = "hi"
  end

  if love.keyboard.isDown("r") then
    message = "hello"
  end

  return love.keyboard.isDown("n")

end

M.draw = function()
  love.graphics.print(message, 100, 100)
end

return M
