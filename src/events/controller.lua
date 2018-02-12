local event_map = require "src/events/event-map"
local cb_map = require "src/events/cb-map"
local layer_util = require "src/events/layer-util"

local event_controller = {}

function event_controller.init(m)
    -- store a reference to the global map
    layer_util.init(m)
end

function event_controller.trigger(name)
    local f = event_map[name]
    if f then f() end
end

function event_controller.doCallback(name)
    if name and cb_map[name] then
        cb_map[name]()
    end
end

return event_controller