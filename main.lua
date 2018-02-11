local sti = require "lib/sti"
-- print(inspect(foo)) to log an item
local inspect = require "lib/inspect"

local player, world, map
local inventory = require "src/inventory"
local viewInvToggle = true

local text = nil
local sum = 0
local cut_flag = false

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
    numflood(dt)  --floods room with ? .. returns true when done
    
    if text then 
      erasetext(dt)
    end
end

function love.draw()
    --    map:draw(map.tx, map.ty, map.scale)
    drawIni(100)
    drawMap()
    initMap()
    drawItemLayer()
    
    
    --[[
    comment out this chunk to enable/disable collision debug view
    love.graphics.setColor(255, 0, 0)
    map:box2d_draw(0, 0, map.scale)
    love.graphics.setColor(255, 255, 255)
    ]]
    
    love.graphics.setColor(25,255,25)
    --love.graphics.print("Player x =" .. player.body:getX() .."\nPlayer y ="..player.body:getY(),50,50)
    love.graphics.setColor(255,255,255)
    
    pickup(player.body:getX(), player.body:getY())
    if viewInvToggle then
      view_inv()
    end
  
    if text then
      diagBox(text)
    end
end


function drawIni(size)
    --love.graphics.setColor(255,1,1) --uncomment for creepy red glow
    ff = love.graphics.newFont('odfont.otf', size)
    love.graphics.setFont(ff)
end

--better input handling if there is time
function love.keypressed(key)
  if key == "i" then
        
    if viewInvToggle == true then
      viewInvToggle = false
      testvar = false
    else
      viewInvToggle = true
      testvar = true
    end
  end
  
  if key == "1" then
    if inventory.acquired[1] then
      drawIni(100)
      diag("How could I read someone's diary!?!?")
    end
  end
  
  if key == "2" then
    if inventory.acquired[2] then
      drawIni(100)
      diag("Oooo...shiny.")
    end
  end
  
  if key == "3" then
    if inventory.acquired[3] then
      drawIni(100)
      if checkMelonState() == 0 then
        diag("If only I could cut it open..")
        
        if inventory.acquired[2] then 
          diag("Should I cut it open with my knife? y/n")
          cut_flag = true
        end
      end
      
      if checkMelonState() == 1 then
        diag("OMNOMNOMNOMNOMNOM!")
        eatenQuad()
      elseif  checkMelonState() == 2 then
        diag("Was hungry.. Now just sad..")
      end
    end
  end
  
  if key == "4" then
    if inventory.acquired[4] then
      drawIni(100)
      diag("Free book! ")
    end
  end
  
  if key == "5" then
    if inventory.acquired[5] then
      drawIni(100)
      diag("It's out of batteries....")
    end
  end
  
  if key == "6" then 
    if inventory.acquired[6] then
      drawIni(100)
      diag("My preciousssss...")
    end
  end
  
  if key == "y" then
    if cut_flag then
      drawIni(100)
      diag("Deliciousness here I come...")
      cutQuad()
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

function drawItemLayer()  --function to draw item layer
    
    local lg = love.graphics
    local curr_canvas = lg.getCanvas()
    lg.setCanvas(map.canvas)
    lg.clear()

    lg.push()
    lg.origin()
    lg.translate(map.tx or 0, map.ty or 0)
    lg.scale(map.scale)

    for _, layer in ipairs(map.layers) do
        if layer.name == "items" and layer.name == "numberFlood" then
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

function diag(string)
  text = string
end
function erasetext(dt)
  sum = sum + dt
  if sum >= 5 then
    sum = 0
    text = nil
  end
end
function diagBox(text)
  
  love.graphics.setColor(180,180,180)
  love.graphics.rectangle('fill',20,400,650,65)
  love.graphics.setColor(255,255,255)
  love.graphics.setLineWidth(5)
  love.graphics.rectangle('line',20,400,650,65)
  love.graphics.setColor(255,255,255)
  love.graphics.print(text,25,400)
end