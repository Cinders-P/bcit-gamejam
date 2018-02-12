local book = {}

--book
book.name = "book"
book.sprite = love.graphics.newImage("sprites/environment/ST-Libry-I01.png")
book.quad = love.graphics.newQuad(132,902,27,24,book.sprite:getDimensions())
book.scale = 1.5
--love.graphics.draw(book.sprite,book.quad,400,350,0)

return book