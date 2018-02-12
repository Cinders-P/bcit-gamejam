local knife = { pos_x = love.graphics.getWidth()/2,pos_y = -100, speed = 200}

knife.name = "knife"
knife.sprite = love.graphics.newImage("sprites/items/hinanset01.png")
knife.quad = love.graphics.newQuad(2,100,32,26,knife.sprite:getDimensions())
knife.scale = 1.5

return knife