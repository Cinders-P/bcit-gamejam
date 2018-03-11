local item_event_map = require "src/events/item-event-map"
local inventory = require "src/inventory/controller"
local event_map = require "src/events/event-map"
local cb_map = require "src/events/cb-map"
local layer_util = require "src/events/layer-util"

local event_controller = {}

function event_controller.init(map)
    layer_util.init(map)
end

function event_controller.trigger(name)
    if inventory.getHeld() then
        local f = item_event_map[name]
        if f then
            f(inventory.getHeld())
        else
            love.event.push("text",
            "read",
                {"You put the two together, but nothing happens."})
        end
        inventory.clearHeld()
    else
        local f = event_map[name]
        if f then f() end
    end
end

function event_controller.doCallback(name)
    if name and cb_map[name] then
        cb_map[name]()
    end
end

return event_controller