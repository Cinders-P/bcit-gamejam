local graphics_util = require "src/graphics-util"

local drink = {pos_x = 15,pos_y = 280, down = true}
prox = 50
image = love.graphics.newImage("sprites/items/SI-Ffood01.png")
drink.img = love.graphics.newQuad(0,0,24,24,image:getDimensions())

function draw_drink(other_x,other_y)
  if drink.down then
    love.graphics.draw(image,drink.img,drink.pos_x,drink.pos_y,0,1.5,1.5)
  end
  --If some other object is within prox
  if (other_x < drink.pos_x + prox) and (other_x > drink.pos_x - prox) and (other_y < drink.pos_y + prox) and (other_y > drink.pos_y - prox)  then
      
      --Then say hello
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

function sayHello()
  ff = love.graphics.newFont('odfont.otf',150)
      love.graphics.setColor(255,255,255)
      love.graphics.setFont(ff)
      love.graphics.print("HELLO",15,200)
end