local graphics_util = require "src/graphics-util"
local dirs = require "src/constants/directions"
local states = require "src/constants/states"

local player = {act_x = 320, act_y = 320, grid_x = 320, grid_y = 320, speed = 1, scare = false}
player.animation = graphics_util.createAnimation(love.graphics.newImage("sprites/characters/tori_gaku_01b.png"), 32, 48)
player.dir = dirs.SOUTH
player.state = states.IDLE

gridval = 64

function player.getPlayerFrame()
    return graphics_util.getCurrentFrame(player.animation, player.dir)
end

function player.draw(x, y)
    love.graphics.draw(player.animation.spriteSheet,player.getPlayerFrame(),x,y,0,2,2,0,-16)
end

function player.addTime(dt)
    player.animation.currentTime = player.animation.currentTime + dt
  
end
--[[
function player.move(key,dt)
  
  if love.keyboard.isDown('d') then
    player.grid_x = player.grid_x + gridval
    player.dir = dirs.EAST
  end
    
	if love.keyboard.isDown('a') then
		player.grid_x = player.grid_x - gridval
    player.dir = dirs.WEST
  end
  
	if love.keyboard.isDown('w') then
      player.grid_y = player.grid_y - gridval
    player.dir = dirs.NORTH
  end
	if love.keyboard.isDown('s') then
    player.grid_y = player.grid_y + gridval 
    player.dir = dirs.SOUTH
	end
  if love.keyboard.isDown('p') then
    player.scare = true
  end
  
  player.act_y = player.act_y - ((player.act_y - player.grid_y) * dt * player.speed)
  player.act_x = player.act_x - ((player.act_x - player.grid_x) * player.speed * dt)
  
  if player.scare then
    player.act_y = (player.act_y - player.grid_y)  * player.speed * dt  --Ok, it looks more like his soul is being ripped out or smthing..
    player.act_x = (player.act_x - player.grid_x)  * player.speed * dt
  else
    player.act_y = player.act_y - ((player.act_y - player.grid_y) * dt * player.speed)
    player.act_x = player.act_x - ((player.act_x - player.grid_x) * player.speed * dt)
  end
  
end
--]]
function love.keypressed(key)
  
  if key == 'd' then
    player.grid_x = player.grid_x + gridval
    player.dir = dirs.EAST
  end
    
	if key == 'a' then
		player.grid_x = player.grid_x - gridval
    player.dir = dirs.WEST
  end
  
	if key == 'w' then
      player.grid_y = player.grid_y - gridval
    player.dir = dirs.NORTH
  end
	if key == 's' then
    player.grid_y = player.grid_y + gridval 
    player.dir = dirs.SOUTH
	end
  if love.keyboard.isDown('p') then
    player.scare = true
  end
  
end

return player