local potion = {}

potion.name = "potion"
potion.sprite = love.graphics.newImage("sprites/items/SI-Card01.png")
potion.quad = love.graphics.newQuad(27,72,18,24,potion.sprite:getDimensions())
potion.scale = 1.2
--love.graphics.draw(potion.sprite,potion.quad,400,350,0,1.5,1.5)

return potion