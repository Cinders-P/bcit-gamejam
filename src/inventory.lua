--local items = require "src/items"
local diary = require "src/items/diary"
local knife = require "src/items/knife"
local watermelon = require "src/items/watermelon"
local book = require "src/items/book"
local flashlight = require "src/items/flashlight"
local plush = require "src/items/plush"


local inventory = {
  acquired = {},
  alphas = {},
  pos_x = 710,
  pos_y = 280
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
  love.graphics.rectangle('fill',inventory.pos_x,inventory.pos_y,100,250,5,5,50)
  
  love.graphics.setColor(215,200,150,200)
  if love.keyboard.isDown('p') then
    love.graphics.setColor(215,240,0)
  end
  
  love.graphics.rectangle('fill',inventory.pos_x + 5,inventory.pos_y + 5,35,40,5,5)
  
  love.graphics.rectangle('fill',inventory.pos_x + 50,inventory.pos_y + 5,35,40,5,5)
  
  love.graphics.rectangle('fill',inventory.pos_x + 5,inventory.pos_y + 70,35,40,5,5)
  
  love.graphics.rectangle('fill',inventory.pos_x + 50,inventory.pos_y + 70,35,40,5,5)
  
  love.graphics.rectangle('fill',inventory.pos_x + 5,inventory.pos_y + 135,35,40,5,5)
  
  love.graphics.rectangle('fill',inventory.pos_x + 50,inventory.pos_y + 135,35,40,5,5)
  
  drawIni('odfont.otf',35)
  love.graphics.setColor(255,255,255,inventory.alphas[1])
  print_item(diary,inventory.pos_x + 5,inventory.pos_y + 7)
  love.graphics.print("1",inventory.pos_x + 15,inventory.pos_y  + 30)
  
  love.graphics.setColor(255,255,255,inventory.alphas[2])
  print_item(knife,inventory.pos_x + 50,inventory.pos_y + 5)
  love.graphics.print("2",inventory.pos_x + 60,inventory.pos_y  + 30)
  
  love.graphics.setColor(255,255,255,inventory.alphas[3])
  print_item(watermelon,inventory.pos_x + 6,inventory.pos_y  + 75)
  love.graphics.print("3",inventory.pos_x + 15,inventory.pos_y  + 92)
  
  love.graphics.setColor(255,255,255,inventory.alphas[4])
  print_item(book,inventory.pos_x + 50,inventory.pos_y  + 72)
  love.graphics.print("4",inventory.pos_x + 60,inventory.pos_y + 92)
  
  love.graphics.setColor(255,255,255,inventory.alphas[5])
  print_item(flashlight,inventory.pos_x + 5,inventory.pos_y  + 140)
  love.graphics.print("5",inventory.pos_x + 15,inventory.pos_y  + 155)
  
  love.graphics.setColor(255,255,255,inventory.alphas[6])
  print_item(plush,inventory.pos_x + 53,inventory.pos_y  + 135)
  love.graphics.print("6",inventory.pos_x + 60,inventory.pos_y  + 160)
  
  love.graphics.setColor(255,255,255)
end


--Function to pick items up
--also change input handling 
function pickup(x,y)
  
  if (x > 126) and (x < 151) and (y < 364) then
    --love.graphics.print("test",400,50)
    if love.keyboard.isDown('e') then
      get_diary()
      item_get(1)
    end
  end
    
  if (x > 420) and (x < 665) and (y > 139) and (y < 145) then
    --love.graphics.print("test",400,50)
    if love.keyboard.isDown('e') then
      get_watermelon()
      item_get(3)
    end
  end
  
  if (x > 430) and (y > 208) and (y < 250) then
    if love.keyboard.isDown('e') then
      get_book()
      item_get(4)
    end
  end
  
  if (x > 370) and (x < 420) and (y > 375) then
    if love.keyboard.isDown('e') then
      get_flashlight()
      item_get(5)
    end
  end
  
  if (x > 89) and (x < 117) and (y > 310) and (y < 351) then
    --love.graphics.print("test",400,50)
    if love.keyboard.isDown('e') then
      get_plush()
      item_get(6)
    end
  end
end

function print_item(inp,pos_x,pos_y)
  love.graphics.draw(inp.sprite,inp.quad,pos_x,pos_y,0,inp.scale,inp.scale)
end

init()
return inventory