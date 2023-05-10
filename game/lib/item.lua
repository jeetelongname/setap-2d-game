Item = {}
-- this class creates the structure for all items in the game
-- name : String (the name of the item)
-- isStackable : Boolean (indicates if there can be multipe of that item in one slot)
-- pointsValue : Integer (how many points a certain item is worth)
function Item:new(name, isStackable, pointsValue)

    local name = name
    local isStackable = isStackable
    local pointsValue = pointsValue

    local obj = {
        -- returns the name of the item
        get_name = function()
            return name
        end,
        -- returns if the item can be stacked or not
        get_isStackable = function()
            return isStackable
        end,
        -- returns how many points the item is worth
        get_pointsValue = function()
            return pointsValue
        end

    }

    self.__index = self
    return setmetatable(obj, self)

end

-- below are all the objects in the game and their attributes. They all inherit from the item class

Metal = {}
-- this class creates the structure for the Metal item, which inherits from the item class
function Metal:new()

    local obj = Item:new('metal', true, 20)
 
    self.__index = self
    return setmetatable(obj, self)
end


Wood = {}
-- this class creates the structure for the Wood item, which inherits from the item class
function Wood:new()

    local obj = Item:new('wood', true, 10)
 
    self.__index = self
    return setmetatable(obj, self)
end


Stick = {}
-- this class creates the structure for the Stick item, which inherits from the item class
function Stick:new()

    local obj = Item:new('stick', true, 5)
 
    self.__index = self
    return setmetatable(obj, self)
end


Leaf = {}
-- this class creates the structure for the Leaf item, which inherits from the item class
function Leaf:new()

    local obj = Item:new('leaf', true, 5)
 
    self.__index = self
    return setmetatable(obj, self)
end


Sword = {}
-- this class creates the structure for the Sword item, which inherits from the item class
function Sword:new()

    local obj = Item:new('sword', false, 150)
    local damage = 30

    
    function Sword:get_damage()
        return damage
    end
 
    self.__index = self
    return setmetatable(obj, self)
end


Bed = {}
-- this class creates the structure for the Bed item, which inherits from the item class
function Bed:new()

    local obj = Item:new('bed', false, 50)

    self.__index = self
    return setmetatable(obj, self)
end


Shield = {}
-- this class creates the structure for the Shield item, which inherits from the item class
function Shield:new()

    local obj = Item:new('shield', false, 120)
 
    self.__index = self
    return setmetatable(obj, self)
end


Armour = {}
-- this class creates the structure for the Armour item, which inherits from the item class
function Armour:new()

    local obj = Item:new('armour', false, 200)
 
    self.__index = self
    return setmetatable(obj, self)
end


