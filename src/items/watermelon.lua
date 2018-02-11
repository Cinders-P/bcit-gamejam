local watermelon = {state = 0}

--watermelon
watermelon.sprite = love.graphics.newImage("sprites/items/nastu1.png")
watermelon.quad = love.graphics.newQuad(0,32,32,32,watermelon.sprite:getDimensions())
watermelon.scale = 1
--love.graphics.draw(watermelon.sprite,watermelon.quad,40,115,0,.5,.5)

function cutQuad()
  watermelon.quad = love.graphics.newQuad(64,32,32,32,watermelon.sprite:getDimensions())
  watermelon.state = 1
end

function eatenQuad()
  watermelon.quad = love.graphics.newQuad(96,32,32,32,watermelon.sprite:getDimensions())
  watermelon.state = 2
end

function checkMelonState()
  return watermelon.state
end

return watermelon