local graphics_util = require "src/graphics-util"

local drink = {pos_x = 9,pos_y = 256, down = true}

drink.name = drink
drink.sprite = love.graphics.newImage("sprites/items/SI-Ffood01.png")
drink.quad = love.graphics.newQuad(0,0,24,24,drink.sprite:getDimensions())
drink.scale = 1.5

function draw_drink()
  if drink.down then
    love.graphics.draw(drink.sprite,drink.quad,drink.pos_x,drink.pos_y,0,drink.scale,drink.scale)
  end 
end

function proximity(other_x,other_y)
  if (other_x < 70) and (other_y < 205) and (other_y > 166) then
    
    love.graphics.setColor(0,0,0)
    love.graphics.print("Press e to pick up drink..",0,0)
    love.graphics.setColor(255,255,255)
    
    if love.keyboard.isDown('e') then
      drink.down = false
      item_get(6)
    end
    
    return true
  end
  
end

return drink