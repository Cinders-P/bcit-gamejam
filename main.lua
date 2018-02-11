local sti = require "lib/sti"
-- print(inspect(foo)) to log an item
local inspect = require "lib/inspect"

local player, world, playerObject, map
local drink = require "src/items/drink"

local inventory = require "src/inventory"
local viewInvToggle = true

function love.load(arg)
    love.graphics.setDefaultFilter("nearest", "nearest", 1)

    map = sti("maps/room1.lua", { "box2d" })
    map.scale = 2
    love.physics.setMeter(32)
    world = love.physics.newWorld(0, 0)
    map:box2d_init(world)

    player = require "src/player"
    player.obj = getPlayerObject()
    player.obj.layer.draw = function() player.draw() end
    player.initPhysics(world)
end

function love.update(dt)
    player.addTime(dt)
    player.move()
    world:update(dt)
    map:setObjectCoordinates(player.obj.layer)
end

function love.draw()
    map:draw(0, 0, map.scale)

--  comment out this chunk to enable/disable collision debug view
--    love.graphics.setColor(255, 0, 0)
--    map:box2d_draw(0, 0, map.scale)
--    love.graphics.setColor(255, 255, 255)
    
     
    drawIni()
    draw_drink()
    proximity(player.body:getX(), player.body:getY())
    
    if viewInvToggle then
      view_inv()
    end
    
end

function drawIni()
    --love.graphics.setColor(255,1,1) --uncomment for creepy red glow
    ff = love.graphics.newFont('odfont.otf', 70)
    love.graphics.setFont(ff)
end

function getPlayerObject()
    for k, object in pairs(map.objects) do
        if object.name == "player" then
            return object
        end
    end
end

function love.keypressed(key)
  if key == "i" then
    if viewInvToggle == true then
      viewInvToggle = false
    else
      viewInvToggle = true
    end
  end
end