local sti = require "lib/sti"
-- print(inspect(foo)) to log an item
local inspect = require "lib/inspect"

local gu = require "src/graphics-util"
local oc = require "src/object-controller"
local th = require "src/text-handler"
local player, world, map, objects
local inventory = require "src/inventory/controller"
local viewInvToggle = true
require "src/constants/munro"


local text
local sum = 0.5
local cut_flag = false
local eraseDelay = 5
local trigger = false

function love.load(arg)
    love.graphics.setDefaultFilter("nearest", "nearest", 1)
    initMap()
    initPhysics()
    initPlayer()
    oc.init(map, inventory)
    th.init(player)
    inventory.init(love.graphics.getWidth(), love.graphics.getHeight())
end

function love.update(dt)
    map.updateViewport()
    player.addTime(dt)
    player.move()
    world:update(dt)
    if text then
        erasetext(dt, eraseDelay)
    end
end

function love.draw()
    gu.drawMap(map, player)
    th.draw()
    if viewInvToggle then
        inventory.draw()
    end

    if trigger then
        death()
    end
end

--better input handling if there is time
function love.keypressed(key)
    if th.isActive() then
        th.onKey(key)
    elseif key == "i" then
        viewInvToggle = not viewInvToggle
    elseif key == "space" then
        oc.checkInteraction(player.getLocs())
    elseif string.match(key, "%d") then
        inventory.toggleHold(tonumber(key))
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

function triggerdeath()
    trigger = true
end

function death()
    dedimage = love.graphics.newImage('deathScreen.png')
    love.graphics.draw(dedimage, 0, 0)
end