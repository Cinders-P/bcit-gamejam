local graphics_util = require "src/graphics-util"
local dirs = require "src/constants/directions"
local states = require "src/constants/states"

local player = {act_x = 200, act_y = 200, grid_x = 232, grid_y = 232, speed = 5}
player.animation = graphics_util.createAnimation(love.graphics.newImage("sprites/characters/tori_gaku_01b.png"), 32, 48)
player.dir = dirs.SOUTH
player.state = states.IDLE

function player.getPlayerFrame()
    return graphics_util.getCurrentFrame(player.animation, player.dir)
end

function player.draw(x, y)
    love.graphics.draw(player.animation.spriteSheet,player.getPlayerFrame(),x,y,0,2,2)
end

function player.addTime(dt)
    player.animation.currentTime = player.animation.currentTime + dt
  
end

function player.move(key,dt)
  
  if love.keyboard.isDown('d') then
    player.grid_x = player.grid_x + 32 
    player.dir = dirs.EAST
  end
    
	if love.keyboard.isDown('a') then
		player.grid_x = player.grid_x - 32
    player.dir = dirs.WEST
  end
  
	if love.keyboard.isDown('w') then
      player.grid_y = player.grid_y - 32
    player.dir = dirs.NORTH
  end
	if love.keyboard.isDown('s') then
    player.grid_y = player.grid_y + 32 
    player.dir = dirs.SOUTH
	end
  
  player.act_y = player.act_y - ((player.act_y - player.grid_y) * dt * player.speed)
  player.act_x = player.act_x - ((player.act_x - player.grid_x) * player.speed * dt)
  --[[
  --Lets use this when he's scared ;)
  --Violently shakes and controls are reversed 
  player.act_y = (player.act_y - player.grid_y)  * player.speed * dt
  player.act_x = (player.act_x - player.grid_x)  * player.speed * dt
  --]]
end

return player