local sti = require "lib/sti"

local map = {}

function love.load(arg)
    map = sti("maps/room1.lua")
end

function love.update(dt)
end

function love.draw(dt)
    map:draw(0, 0, 2, 2)
--    love.graphics.print("Hello World", 400, 300)
end