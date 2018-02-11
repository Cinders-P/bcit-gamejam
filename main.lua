local sti = require "lib/sti"
-- print(inspect(foo)) to log an item
local inspect = require "lib/inspect"

local player, world, map
local inventory = require "src/inventory"
local viewInvToggle = true

function love.load(arg)
    love.graphics.setDefaultFilter("nearest", "nearest", 1)
    initMap()
    initPhysics()
    initPlayer()
end

function love.update(dt)
    map.updateViewport()
    player.addTime(dt)
    player.move()
    world:update(dt)
end

function love.draw()
    --    map:draw(map.tx, map.ty, map.scale)
    drawMap()

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

function love.keypressed(key)
  if key == "i" then
    if viewInvToggle == true then
      viewInvToggle = false
    else
      viewInvToggle = true
    end
  end
end

function initMap()
    map = sti("maps/room1.lua", { "box2d" })
    map.scale = 2
    map.updateViewport = function()
        map.tx = -player.body:getX() * map.scale + love.graphics.getWidth() / 2
        map.ty = -player.body:getY() * map.scale + love.graphics.getHeight() / 2
    end
end

function initPhysics()
    love.physics.setMeter(32)
    world = love.physics.newWorld(0, 0)
    map:box2d_init(world)
end

function initPlayer()
    player = require "src/player"
    player.initPhysics(world)
end

-- modified version of Map:draw() from STI
function drawMap()
    local lg = love.graphics
    local curr_canvas = lg.getCanvas()
    lg.setCanvas(map.canvas)
    lg.clear()

    lg.push()
    lg.origin()
    lg.translate(map.tx or 0, map.ty or 0)
    lg.scale(map.scale)

    for _, layer in ipairs(map.layers) do
        if layer.name == "pl" then
            player.draw()
        elseif layer.visible and layer.opacity > 0 then
            map:drawLayer(layer)
        end
    end

    lg.pop()

    -- Draw canvas at 0,0; this fixes scissoring issues
    -- Map is scaled to correct scale so the right section is shown
    lg.push()
    lg.origin()
    lg.setCanvas(curr_canvas)
    lg.draw(map.canvas)

    lg.pop()
end