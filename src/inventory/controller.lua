local ui = require "src/inventory/ui"
local im = require "src/inventory/item-map"
local inspect = require "lib/inspect"

local inventory = {}
local acquired = {}
local limit = 5
local held

function inventory.clearHeld()
    if held and im[held] then
        im[held].held = nil
    end
    held = nil
end

function inventory.add(name)
    if im[name] then
        table.insert(acquired, im[name])
    end
end

function inventory.toggleHold(index)
    local old = held
    inventory.clearHeld()
    if acquired[index] then
        held = acquired[index].name
        if old == held then
            held = nil
        else
            acquired[index].held = true
        end
    end
end

function inventory.remove(name)
    local obj = im[name]
    if not obj then return end

    local length = #acquired
    for i = 1, length, 1 do
        if acquired[i] == obj then
            table.remove(acquired, i)
            break
        end
    end
end

function inventory.init(lgw, lgh)
    ui.init(lgw, lgh)
end

function inventory.draw()
    ui.draw(acquired, limit)
end

function inventory.getHeld()
    return held
end

return inventory