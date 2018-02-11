local graphics_util = require "src/graphics-util"

local drink = {pos_x = 15,pos_y = 280 }
prox = 50
image = love.graphics.newImage("sprites/items/SI-Ffood01.png")
drink.img = love.graphics.newQuad(0,0,24,24,image:getDimensions())

function draw_drink()
  love.graphics.draw(image,drink.img,drink.pos_x,drink.pos_y,0,1.5,1.5)
end

function proximity(other_x,other_y)
  if (other_x < drink.pos_x + prox) and (other_x > drink.pos_x - prox)  then
    if (other_y < drink.pos_y + prox) and (other_y > drink.pos_y - prox)  then
      trip()
    end
  end
end

function trip()
  ff = love.graphics.newFont('HBfont.ttf',150)
      love.graphics.setColor(255,255,255)
      love.graphics.setFont(ff)
      love.graphics.print("Hello",15,200)
end