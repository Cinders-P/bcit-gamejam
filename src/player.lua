local graphics_util = require "src/graphics-util"
local dirs = require "src/constants/directions"
local states = require "src/constants/states"

local player = {}
player.animation = graphics_util.createAnimation(love.graphics.newImage("sprites/characters/tori_gaku_01b.png"), 32, 48)
player.dir = dirs.SOUTH
player.state = states.IDLE

function player.getPlayerFrame()
    return graphics_util.getCurrentFrame(player.animation, player.dir)
end

function player.draw(x, y)
    love.graphics.draw(player.animation.spriteSheet,
        player.getPlayerFrame(),
        x,
        y,
        0,
        2,
        2)
end

function player.addTime(dt)
    player.animation.currentTime = player.animation.currentTime + dt
end

return player