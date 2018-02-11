local knife = {}

knife.sprite = love.graphics.newImage("sprites/items/hinanset01.png")
knife.quad = love.graphics.newQuad(2,100,32,26,knife.sprite:getDimensions())
knife.scale = 1.5
--love.graphics.draw(knife.sprite,knife.quad,400,350,0,1.5,1.5)

return knife