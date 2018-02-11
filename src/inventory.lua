--local items = require "src/items"
local diary = require "src/items/diary"
local knife = require "src/items/knife"
local watermelon = require "src/items/watermelon"
local book = require "src/items/book"
local flashlight = require "src/items/flashlight"
local plush = require "src/items/plush"


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
  print_item(diary,715,312)
  
  love.graphics.setColor(255,255,255,inventory.alphas[2])
  print_item(knife,760,310)
  
  love.graphics.setColor(255,255,255,inventory.alphas[3])
  print_item(watermelon,715,375)
  
  love.graphics.setColor(255,255,255,inventory.alphas[4])
  print_item(book,760,372)
  
  love.graphics.setColor(255,255,255,inventory.alphas[5])
  --love.graphics.draw(flashlight.sprite,flashlight.quad,715,470,55,.9,.9)
  print_item(flashlight,715,435)
  
  love.graphics.setColor(255,255,255,inventory.alphas[6])
  print_item(plush,762,427)
  
  love.graphics.setColor(255,255,255)
end

function print_item(inp,pos_x,pos_y)
  love.graphics.draw(inp.sprite,inp.quad,pos_x,pos_y,0,inp.scale,inp.scale)
end

init()
return inventory