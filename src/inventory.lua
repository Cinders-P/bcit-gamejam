local inventory = {}
inventory.list = {}
--maxsize = 5
nextinsert = 0

--[[
function init()
  
end
]]

function inv_insert(name,sprite,quad)
  inventory.list[nextinsert] = {name,sprite}
  nextinsert = nextinsert + 1
  love.graphics.draw(sprite,quad,350,350,0,1.5,1.5)
end
  
return inventory