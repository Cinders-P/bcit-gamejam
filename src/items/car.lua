local car = {}

--car
car.sprite = love.graphics.newImage("sprites/items/car.png")
car.quad = love.graphics.newQuad(193,8,158,90,car.sprite:getDimensions())
car.scale = .5
--love.graphics.draw(car.sprite,car.quad,40,115,0,.5,.5)

return car