Inventory = {}

function Inventory:new()

    local inventory = {}

    for i = 1, 20 do
        inventory[i] = -1
    end

    local obj = {

        get_inventory = function(inventoryPosition)
            return inventory[inventoryPosition]
        end,

        get_inventory_all = function()
            return inventory
        end,

        set_inventory = function(item) --checks for empty spaces in the inventory, and puts the item in the first space it finds

            for i = 1, #inventory do

                if inventory[i] == -1 then
                    inventory[i] = item
                    return
                end
            end

            return 'no space in inventory'

        end,

        remove_inventory = function(item)

            for i = 1, #inventory do
                if inventory[i] == item then
                    inventory[i] = -1
                    return
                end
            end

            return 'couldnt find item'

        end



    }

    self.__index = self
    return setmetatable(obj, self)

end

Inventory1 = Inventory:new()

-- Inventory1.set_inventory('sword')
-- print(Inventory1.get_inventory(1))
-- Inventory1.remove_inventory('sword')
-- print(Inventory1.get_inventory(1))