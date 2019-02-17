local com = require("component")

for key, value in pairs(com.me_controller.getItemsInNetwork()) do
  if type(value) == "table" then
    print(value.name)
    for key2, value2 in pairs(value) do
      print(key2, value2)
    end
    if value.label == "Stone" then
      print(value.name)
      
    end
  end
end