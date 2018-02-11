--local items = require "src/items"
local potion = require "src/items/potion"
local knife = require "src/items/knife"
local car = require "src/items/car"
local figure = require "src/items/figure"
local book = require "src/items/book"
local drink = require "src/items/drink"


local inventory = {
  acquired = {},
  alphas = {}
}

function init()
  for i = 1,6 do
    inventory.alphas[i] = 100
    inventory.acquired[i] = false
  end
  
end

function item_get(index)
  inventory.alphas[index] = 255
  inventory.acquired[index] = true
end

function view_inv()
  love.graphics.setColor(0,0,0,150)
  love.graphics.rectangle('fill',710,300,100,190,5,5,50)
  
  love.graphics.setColor(215,200,150,200)
  if love.keyboard.isDown('p') then
    love.graphics.setColor(215,240,0)
  end
  
  love.graphics.rectangle('fill',715,305,35,50,5,5)
  
  love.graphics.rectangle('fill',760,305,35,50,5,5)
  
  love.graphics.rectangle('fill',715,365,35,50,5,5)
  
  love.graphics.rectangle('fill',760,365,35,50,5,5)
  
  love.graphics.rectangle('fill',715,425,35,50,5,5)
  
  love.graphics.rectangle('fill',760,425,35,50,5,5)
  
  
  love.graphics.setColor(255,255,255,inventory.alphas[1])
  print_item(potion,722,315)
  
  love.graphics.setColor(255,255,255,inventory.alphas[2])
  print_item(knife,760,310)
  
  love.graphics.setColor(255,255,255,inventory.alphas[3])
  love.graphics.draw(car.sprite,car.quad,715,413,55,.3,.3)
  
  love.graphics.setColor(255,255,255,inventory.alphas[4])
  print_item(figure,757,360)
  
  love.graphics.setColor(255,255,255,inventory.alphas[5])
  love.graphics.draw(book.sprite,book.quad,715,470,55,.9,.9)
  
  love.graphics.setColor(255,255,255,inventory.alphas[6])
  print_item(drink,760,430)
  
  love.graphics.setColor(255,255,255)
end

function print_item(inp,pos_x,pos_y)
  love.graphics.draw(inp.sprite,inp.quad,pos_x,pos_y,0,inp.scale,inp.scale)
end

init()
return inventory