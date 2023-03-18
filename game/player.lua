Player = {}

function Player:new(name)

    local name = name
    local position = {x = 10, y = 10}
    local health = 100
    local inventory = {}

    for i = 1, 20 do --this isn't setting up the inventory properly
        inventory.i = -1
    end

    local obj = {

        get_name = function()
            return name
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

        get_inventory = function(inventoryPosition)
            return inventory.inventoryPosition
        end,

        get_inventory_all = function()
            return inventory
        end,

        set_inventory = function(item)--checks for empty spaces in the inventory, and puts the item in the first space it finds
            for i = 1, #inventory do
                if inventory.i == -1 then
                    inventory.i = item
                    return
                end
            end

            return 'no space in inventory'

        end

    }
    self.__index = self
    return setmetatable(obj, self)

end


-- Player1 = Player:new('Jude')
-- print(Player1.get_name())
-- print(Player1.get_health())
-- Player1.set_position(30, 30)
-- print(Player1.get_position().x)
-- print(Player1.set_inventory('sword'))
-- print(Player1.get_inventory(6))