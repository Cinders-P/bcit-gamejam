local watermelon = {}

--watermelon
watermelon.sprite = love.graphics.newImage("sprites/items/nastu1.png")
watermelon.quad = love.graphics.newQuad(0,32,32,32,watermelon.sprite:getDimensions())
watermelon.scale = 1
--love.graphics.draw(watermelon.sprite,watermelon.quad,40,115,0,.5,.5)

return watermelon