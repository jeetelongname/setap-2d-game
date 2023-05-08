require "lib.inventory"
json = require "deps.dkjson"

Player = {}

function Player:new(name, movementSpeed, sprite)

    local name = name
    local position = {x = 100, y = 100}
    local health = 100
    local movementSpeed = movementSpeed
    local sprite = sprite
    

    local obj = {

        inventory1 = Inventory:new(),

        encode_player = function()
            return json.encode({name, movementSpeed, position})
        end,

        get_name = function()
            return name
        end,

        get_sprite = function()
            return sprite
        end,

        get_health = function()
            return health
        end,

        change_health = function(changeHealthBy)
            health = health + changeHealthBy
        end,

        set_health = function(seHealthTo)
            health = setHealthTo
        end,

        get_position = function()
            return position
        end,

        change_position_by_amount = function(x, y)
            position.x = position.x + x
            position.y = position.y + y
        end,

        set_position = function(x, y)
            position.x = x
            position.y = y
        end,

        get_movementSpeed = function()
            return movementSpeed
        end,

        change_movementSpeed = function(value)
            movementSpeed = movementSpeed + value
        end,

        set_movementSpeed = function(value)
            movementSpeed = value
        end

    }
    self.__index = self
    return setmetatable(obj, self)

end