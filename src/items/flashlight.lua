local flashlight = {pos_x = 0, pos_y = 0, down = true}

--flashlight
flashlight.name = "flashlight"
flashlight.sprite = love.graphics.newImage("sprites/items/hinanset01.png")
flashlight.quad = love.graphics.newQuad(99,103,27,23,flashlight.sprite:getDimensions())
flashlight. scale = 1.35

--love.graphics.draw(flashlight.sprite,flashlight.quad,400,350,0,1.5,1.5)


return flashlight