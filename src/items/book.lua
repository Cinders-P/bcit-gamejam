local book = {pos_x = 0, pos_y = 0, down = true}

--book
book.sprite = love.graphics.newImage("sprites/items/bldalpha.png")
book.quad = love.graphics.newQuad(480,520,48,38,book.sprite:getDimensions())
book. scale = 1

--love.graphics.draw(book.sprite,book.quad,400,350,0,1.5,1.5)
function draw_book()
  if book.down then
    love.graphics.draw(book.sprite,book.quad,book.pos_x,book.pos_y,0,book.scale,book.scale)
  end 
end

--[[
function proximity(other_x,other_y)
  if (other_x < 70) and (other_y < 205) and (other_y > 166) then
        
    if love.keyboard.isDown('e') then
      book.down = false
      item_get(6)
    end
    
    return true
  end
  
end
]]

return book