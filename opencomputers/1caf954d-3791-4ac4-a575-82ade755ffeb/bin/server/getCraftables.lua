local com = require("component")

com.me_controller.getCraftables({label = "Pure Certus Quartz Crystal"})[1].request(10)


--[[for key, value in pairs(com.me_controller.getCraftables()) do
  if type(value) == "table" then
    print(key, value)
    for key2, value2 in pairs(value.getItemStack()) do 
      print(key2, value2)
    end
  end
end--]]

print(com.me_controller.getCraftables({label = "Stone"}))