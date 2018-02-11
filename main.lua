local sti = require "lib/sti"

local player = {}
local map = {}
local drink = require "src/drink"
local inventory = require "src/inventory"

function love.load(arg)
    love.graphics.setDefaultFilter("nearest", "nearest", 1)

    player = require "src/player"

    map = sti("maps/room1.lua", { "box2d" })
    world = love.physics.newWorld(0, 0)
    map:box2d_init(world)
end

function love.update(dt)
    player.addTime(dt)
    --player.move(key,dt)
    
    player.act_y = player.act_y - ((player.act_y - player.grid_y) * dt * player.speed)
    player.act_x = player.act_x - ((player.act_x - player.grid_x) * player.speed * dt)
    
end

function love.draw()
    map:draw(0, 0, 2, 2)
    --player.draw(player.act_x,player.act_y)
    player.draw(player.grid_x,player.grid_y)
    draw_drink(player.act_x,player.act_y)
    
    --comment out this chunk to enable/disable collision debug view
    love.graphics.setColor(255, 0, 0)
    map:box2d_draw(0, 0, 2, 2)
    love.graphics.setColor(255, 255, 255)
    
end
