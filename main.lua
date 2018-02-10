local sti = require "lib/sti"

local player = require "src/player"
local map = {}

function love.load(arg)
    map = sti("maps/room1.lua")
end

function love.update(dt)
    player.addTime(dt)
end

function love.draw()
    map:draw(0, 0, 2, 2)
    player.draw(0, 0)
--    love.graphics.print("Hello World", 400, 300)
end