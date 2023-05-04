M = {}

function listContainsAll(items, recipe)

  for i=2, #recipe do

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