M = {} -- this file returns functions to sue for crafting, no classes.

function listContainsAll(items, recipe) -- checks if all items in the recipe have been put into the function

  for i=2, #recipe do -- starts at the second position in the list, as the first position is the name of the item trying to be crafted

    local found = false
    
    for _, item in ipairs(items) do

      if item == recipe[i] then
        found = true
        break
      end
    end
    
    
    if not found then
      return false
    end

  end
  return true
end

-- below are all of the crafting recipes for each item in the game
-- each value in the list represents what is required to craft an item

function swordRecipe()
  return {"metal", "metal", "stick"}
end

function shieldRecipe()
  return {"metal", "wood","wood", "stick","stick"}
end

function bedRecipe()
  return {"leaf", "leaf", "leaf", "wood", "wood"}
end

function armourRecipe()
  return {"metal", "metal", "metal", "metal", "leaf", "leaf"}
end

return M