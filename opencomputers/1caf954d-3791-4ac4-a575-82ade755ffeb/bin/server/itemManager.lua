local com = require("component")
local itemManagerClass = {}

function printT (T) 
  for u,v in pairs(T) do
    print(u,v)
  end
end 

local function craftItem(label2, toCraft)
  local craftable = com.me_controller.getCraftables({label = label2})

  if (craftable.n > 0) then
    local craft = craftable[1]

    craft.request(toCraft)
  end
end

local function checkItemCount(label, minSize, toCraft)
  for key, value in pairs(com.me_controller.getItemsInNetwork()) do
    if type(value) == 'table' then
      if value.label == label then
        if (value.size < minSize) then
          print("Craft " .. toCraft .. " of " .. label)
        
          craftItem(label, toCraft)
        end

        return 0
      end
    end
  end
end

local timer = 0

function itemManagerClass.checkItems() 
  if timer <= 0 then  
    timer = 300

    print("Check Item Counts.")

    checkItemCount("Stone", 1000, 500)
    checkItemCount("Stone Bricks", 1000, 300)
    checkItemCount("Charged Quartz Fixture", 1000, 100)
    checkItemCount("Enriched Alloy", 500, 100)
    checkItemCount("Pure Certus Quartz Crystal", 1000, 100)
    checkItemCount("Pure Nether Quartz Crystal", 1000, 100)
    checkItemCount("Pure Fluix Crystal", 1000, 100)
    checkItemCount("Certus Quartz Dust", 1000, 100)
    checkItemCount("Black Wool", 500, 100)
    checkItemCount("Fluix Dust", 1000, 100)
    
  else
    if timer > 0 then    
      timer=timer-1
    end
  end
end

return itemManagerClass