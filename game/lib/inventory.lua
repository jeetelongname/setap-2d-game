require "lib.item"

Inventory = {}
-- the inventory class stores information on what is currently in the player's inventory, and functions to manipulate itself
function Inventory:new()

    local inventory = {}
    -- creates a table (the players' inventory) with 20 slots with the value -1, to mark that the slot is empty
    for i = 1, 20 do
        inventory[i] = -1
    end

    local obj = {
        -- returns the item at a certain position in the inventory, and how many of that item are in that slot
        get_inventory = function(inventoryPosition) 
            if inventory[inventoryPosition] ~= -1 then
                return inventory[inventoryPosition][1], inventory[inventoryPosition][2]
            else
                return inventory[inventoryPosition]
            end
        end,
        -- returns a list of all items currently in the player's inventory, and all empty spaces
        get_inventory_all = function()
            return inventory
        end,
        --checks for empty spaces in the inventory, and puts the item in the first space it finds
        set_inventory = function(item) 

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
        -- removes a certain item from the inventory
        remove_inventory = function(item)

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
