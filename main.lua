local sti = require "lib/sti"

local player = require "src/player"
map = {}

function love.load(arg)
    map = sti("maps/room1.lua")
end

function love.update(dt)
    player.addTime(dt)
    player.move(key,dt)
    
end

function love.draw()
    map:draw(0, 0, 2, 2)
    player.draw(player.act_x,player.act_y)
end

