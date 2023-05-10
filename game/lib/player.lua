require("lib.inventory")
local json = require("deps.dkjson")

local Player = {}
-- Creates a new instance of a Player and manages their position and health.
-- Returns a table of the Player class
-- iname : String (the player's name)
-- imovementSpeed : Integer (The speed at which the player moves)
-- isprite : {Integer} (RGB value which will visually represent the player)
function Player:new(iname, imovementSpeed, isprite)
    local name = iname
    local position = { x = 50, y = 50 }
    local health = 100
    local movementSpeed = imovementSpeed
    local sprite = isprite

    local obj = {
        -- inherits from the inventory class
        inventory = Inventory:new(),
        -- encodes the data inside of the Player class and returns its as a string
        -- this can then be written to a file, which then can be loaded from
        encode_player = function()
            return json.encode({ name, movementSpeed, sprite })
        end,
        -- returns the player's name
        get_name = function()
            return name
        end,
        -- returns what the player looks like
        get_sprite = function()
            return sprite
        end,
        --returns the player's health
        get_health = function()
            return health
        end,
        --changes the player's heath based on the integer which is passed into it
        change_health = function(changeHealthBy)
            health = health + changeHealthBy
        end,
        -- sets the player's health to the value of 'setHealthTo'
        set_health = function(setHealthTo)
            health = setHealthTo
        end,
        -- returns a list containing the x and y position of the player
        get_position = function()
            return position
        end,
        -- changes the x and y position of the player based on which value is passed int this function
        change_position_by_amount = function(x, y)
            position.x = position.x + x
            position.y = position.y + y
        end,
        -- sets the position of the player to the values being passed in
        set_position = function(x, y)
            position.x = x
            position.y = y
        end,
        -- returns the player's movement speed
        get_movementSpeed = function()
            return movementSpeed
        end,
        -- changes the player's movement speed
        change_movementSpeed = function(value)
            movementSpeed = movementSpeed + value
        end,
        -- sets the player's movement speed to the value being passed in
        set_movementSpeed = function(value)
            movementSpeed = value
        end,
        -- encodes the data inside of the Player class and returns its as a string
        -- this can then be written to a file, which then can be loaded from
        toString = function()
            return json.encode {
                name = name,
                position = position,
                health = health,
                movementSpeed = movementSpeed,
                sprite = sprite,
            }
        end
    }
    self.__index = self
    return setmetatable(obj, self)
end
-- decodes the contents of a file initializes a new instance of the Player class from it
function Player.parsePlayer(playerstr)
    local playert = json.decode(playerstr)
    local player = Player:new(playert.name, playert.movementSpeed, playert.sprite)
    player.set_health(playert.health)
    local pos = playert.position
    player.set_position(pos.x, pos.y)

    return player
end

return Player
