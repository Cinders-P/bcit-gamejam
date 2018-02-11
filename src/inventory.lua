local inventory = {}
inventory.list = {}
inventory.view = false
--maxsize = 5
nextinsert = 0

--[[
function init()
  
end
]]

function insert_inv(name,sprite,quad)
  inventory.list[nextinsert] = {name,sprite}
  nextinsert = nextinsert + 1
  love.graphics.draw(sprite,quad,350,350,0,1.5,1.5)
end

function view_inv()
  love.graphics.rectangle('fill',50,50,50,50)
end

return inventory