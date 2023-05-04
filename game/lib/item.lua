Item = {}

function Item:new(name, isStackable, pointsValue)

    local name = name
    local isStackable = isStackable
    local pointsValue = pointsValue

    local obj = {

        get_name = function()
            return name
        end,

        get_isStackable = function()
            return isStackable
        end,

        get_pointsValue = function()
            return pointsValue
        end

    }

    self.__index = self
    return setmetatable(obj, self)

end


Metal = {}

function Metal:new()

    local obj = Item:new('metal', true, 20)
 
    self.__index = self
    return setmetatable(obj, self)
end


Wood = {}

function Wood:new()

    local obj = Item:new('wood', true, 10)
 
    self.__index = self
    return setmetatable(obj, self)
end


Stick = {}

function Stick:new()

    local obj = Item:new('stick', true, 5)
 
    self.__index = self
    return setmetatable(obj, self)
end


Leaf = {}

function Leaf:new()

    local obj = Item:new('leaf', true, 5)
 
    self.__index = self
    return setmetatable(obj, self)
end


Sword = {}

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

function Bed:new()

    local obj = Item:new('bed', false, 50)

    self.__index = self
    return setmetatable(obj, self)
end


Shield = {}

function Shield:new()

    local obj = Item:new('shield', false, 120)
 
    self.__index = self
    return setmetatable(obj, self)
end


Armour = {}

function Armour:new()

    local obj = Item:new('armour', false, 200)
 
    self.__index = self
    return setmetatable(obj, self)
end


