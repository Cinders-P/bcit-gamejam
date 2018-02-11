local diary = {}

diary.sprite = love.graphics.newImage("sprites/environment/ST-Room-I02.png")
diary.quad = love.graphics.newQuad(67,554,26,26,diary.sprite:getDimensions())
diary.scale = 1.4
--love.graphics.draw(diary.sprite,diary.quad,400,350,0,1.5,1.5)

return diary