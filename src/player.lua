local graphics_util = require "src/graphics-util"
local dirs = require "src/constants/directions"
local states = require "src/constants/states"

local player = {
    dir = dirs.SOUTH,
    state = states.IDLE,
    height = 48,
    width = 32,
    speed = 100,
    stop = false
}
local animation = graphics_util.createAnimation(love.graphics.newImage("sprites/characters/tori_gaku_01b.png"), player.width, player.height)

function player.getPlayerFrame()
    return graphics_util.getCurrentFrame(animation, player.dir, player.state)
end

function player.draw()
    local b = player.body
    love.graphics.draw(
        animation.spriteSheet,
        player.getPlayerFrame(),
        b:getX() - 16,
        b:getY() - 40
    )
end

function player.setStop(bool)
    player.stop = bool
    player.state = states.IDLE
end

function player.addTime(dt)
    animation.currentTime = animation.currentTime + dt
end

function player.initPhysics(world)
    player.body = love.physics.newBody(world, 100, 140, "dynamic")
    player.body:setFixedRotation(true)
    player.shape = love.physics.newCircleShape(11)
    player.fixture = love.physics.newFixture(player.body, player.shape)
end

function player.setWalking() player.state = states.WALKING end

function player.move()
    if player.stop then return end

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
end

function player.getLocs()
    local forwardX, forwardY = player.body:getPosition()
    -- some compensation so the interaction hitboxes can be better centered
    forwardY = forwardY - 12
    local dist = 20
    if (player.dir == dirs.NORTH) then
        forwardY = forwardY - dist
    elseif (player.dir == dirs.SOUTH) then
        forwardY = forwardY + dist
    elseif (player.dir == dirs.WEST) then
        forwardX = forwardX - dist
    else
        forwardX = forwardX + dist
    end
    return forwardX, forwardY, player.body:getPosition()
end

return player