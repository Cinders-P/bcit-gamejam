local plush = {}

--plush
plush.sprite = love.graphics.newImage("sprites/environment/ST-Room-I02.png")
plush.quad = love.graphics.newQuad(69,736,23,32,plush.sprite:getDimensions())
plush.scale = 1.4

return plush