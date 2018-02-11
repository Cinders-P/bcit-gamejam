local graphics_util = require "src/graphics-util"

local drink = {pos_x = 9,pos_y = 256, down = true}
proximity_x = 90; proximity_y = 64
image = love.graphics.newImage("sprites/items/SI-Ffood01.png")
drink.img = love.graphics.newQuad(0,0,24,24,image:getDimensions())

function draw_drink(other_x,other_y)
  if drink.down then
    love.graphics.draw(image,drink.img,drink.pos_x,drink.pos_y,0,1.5,1.5)
  end
  
  if proximity(other_x,other_y) then
    if drink.down then
      sayHello()
    end
  -- "Pickup" object by pressing e
  -- Object disappears from map
    if love.keyboard.isDown('e') then
      drink.down = false
      inv_insert(drink,image,drink.img)
    end
  end  
end

function proximity(other_x,other_y)
  if (other_x < drink.pos_x + proximity_x) and (other_x > drink.pos_x - proximity_x) and (other_y < drink.pos_y + proximity_y) and (other_y > drink.pos_y - proximity_y)  then
    return true
  end
  --love.graphics.print("drink.pos_y + prox_y =" .. drink.pos_y + proximity_y, 90,90)
  return false
end

function sayHello()
      love.graphics.print("HELLO",15,200)
end

return drink