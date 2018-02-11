local graphics_util = require "src/graphics-util"

local drink = {pos_x = 9,pos_y = 256, down = true}

image = love.graphics.newImage("sprites/items/SI-Ffood01.png")
drink.img = love.graphics.newQuad(0,0,24,24,image:getDimensions())

function draw_drink()
  if drink.down then
    love.graphics.draw(image,drink.img,drink.pos_x,drink.pos_y,0,1.5,1.5)
  end 
end

function proximity(other_x,other_y)
  if (other_x < drink.pos_x + 90) and (other_y < drink.pos_y + 32) and (other_y > drink.pos_y - 130) then
       
    if drink.down then
      sayHello()
    end
    
    if love.keyboard.isDown('e') then
      drink.down = false
      inv_insert(drink,image,drink.img)
    end
    
    return true
  end
  
end

function sayHello()
      love.graphics.print("HELLO",15,200)
end

return drink