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


Sword = {}

function Sword:new()

    local obj = Item:new('sword', False, 150)
    local damage = 30

    
    function Sword:get_damage()
        return damage
    end
 
    self.__index = self
    return setmetatable(obj, self)
end



