require "lib.item"

Inventory = {}

function Inventory:new()

    local inventory = {}

    for i = 1, 20 do -- creates a table (the players' inventory) with 20 slots with the value -1, to mark that the slot is empty
        inventory[i] = -1
    end

    local obj = {

        get_inventory = function(inventoryPosition) -- returns the item at a certain position in the inventory, and how many of that item are in that slot
            if inventory[inventoryPosition] ~= -1 then
                return inventory[inventoryPosition][1], inventory[inventoryPosition][2]
            else
                return inventory[inventoryPosition]
            end
        end,

        get_inventory_all = function()
            return inventory
        end,

        set_inventory = function(item) --checks for empty spaces in the inventory, and puts the item in the first space it finds

            for i = 1, #inventory do

                if inventory[i] == -1 then
                    inventory[i] = {1, item}
                    return
                elseif (inventory[i][2].get_name() == item.get_name()) and (item.get_isStackable()) then
                    inventory[i] = {inventory[i][1] + 1, item}
                    return
                end
            end

            return 'no space in inventory'

        end,

        remove_inventory = function(item) -- removes a certain item from the inventory

            for i = 1, #inventory do
                if inventory[i] == -1 then
                    goto continue
                end
                if inventory[i][2].get_name() == item.get_name() then
                    if inventory[i][1] > 1 then
                        inventory[i][1] = inventory[i][1] - 1
                        return
                    else
                        inventory[i] = -1
                        return
                    end
                end
                ::continue::
            end

            return 'couldnt find item'

        end



    }

    self.__index = self
    return setmetatable(obj, self)

end
