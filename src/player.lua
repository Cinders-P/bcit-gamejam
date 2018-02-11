local graphics_util = require "src/graphics-util"
local dirs = require "src/constants/directions"
local states = require "src/constants/states"

local player = {
    dir = dirs.SOUTH,
    state = states.IDLE,
    height = 48,
    width = 32,
    speed = 100
}
player.animation = graphics_util.createAnimation(love.graphics.newImage("sprites/characters/tori_gaku_01b.png"), player.width, player.height)

function player.getPlayerFrame()
    return graphics_util.getCurrentFrame(player.animation, player.dir, player.state)
end

function player.draw(scale)
    local b = player.body
    love.graphics.draw(player.animation.spriteSheet, player.getPlayerFrame(),
        b:getX() - 16,
        b:getY() - 40,
        0,
        scale)
end

function player.addTime(dt)
    player.animation.currentTime = player.animation.currentTime + dt
end

function player.initPhysics(world)
    player.body = love.physics.newBody(world, 100, 140, "dynamic")
    player.body:setFixedRotation(true)
    player.shape = love.physics.newRectangleShape(20, 20)
    player.fixture = love.physics.newFixture(player.body, player.shape)
end

function player.setWalking() player.state = states.WALKING end

function player.move(key, dt)

    if love.keyboard.isDown('d') then
        player.setWalking()
        player.dir = dirs.EAST
        player.body:setLinearVelocity(player.speed, 0)

    elseif love.keyboard.isDown('a') then
        player.setWalking()
        player.dir = dirs.WEST
        player.body:setLinearVelocity(-player.speed, 0)

    elseif love.keyboard.isDown('w') then
        player.setWalking()
        player.dir = dirs.NORTH
        player.body:setLinearVelocity(0, -player.speed)

    elseif love.keyboard.isDown('s') then
        player.setWalking()
        player.dir = dirs.SOUTH
        player.body:setLinearVelocity(0, player.speed)

    else
        player.state = states.IDLE
        player.body:setLinearVelocity(0, 0)
    end
    --[[
    --Lets use this when he's scared ;)
    --Violently shakes and controls are reversed
    player.act_y = (player.act_y - player.grid_y)  * player.speed * dt
    player.act_x = (player.act_x - player.grid_x)  * player.speed * dt
    --]]
end

return player