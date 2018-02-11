local sti = require "lib/sti"

local player = {}
local map = {}

function love.load(arg)
    love.graphics.setDefaultFilter("nearest", "nearest", 1)

    player = require "src/player"

    map = sti("maps/room1.lua", { "box2d" })
    world = love.physics.newWorld(0, 0)
    map:box2d_init(world)
end

function love.update(dt)
    player.addTime(dt)
end

function love.draw()
    map:draw(0, 0, 2, 2)
    player.draw(0, 0)

--  comment out this chunk to enable/disable collision debug view
    love.graphics.setColor(255, 0, 0)
    map:box2d_draw(0, 0, 2, 2)
    love.graphics.setColor(255, 255, 255)
--    love.graphics.print("Hello World", 400, 300)
end