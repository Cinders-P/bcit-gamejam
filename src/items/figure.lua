local figure = {}

--figure
figure.sprite = love.graphics.newImage("sprites/items/bldalpha.png")
figure.quad = love.graphics.newQuad(290,400,37,55,figure.sprite:getDimensions())
figure.scale = 1
--love.graphics.draw(figure.sprite,figure.quad,400,350,0)

return figure