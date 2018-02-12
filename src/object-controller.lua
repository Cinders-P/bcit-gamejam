local ec = require "src/event-controller"
local object_controller = {}
local objects = {}

local function testPoint(x, y, rect)
    return x >= rect[1].x and
            x <= rect[2].x and
            y >= rect[1].y and
            y <= rect[3].y
end

function object_controller.init(m, i)
    ec.init(m, object_controller, i)
    for _, o in pairs(m.objects) do
        objects[o.name] = {
            enabled = true,
            rectangle = o.rectangle
        }
    end
    objects["player"] = nil
end

function object_controller.disable(name)
    objects[name].enabled = false
end

function object_controller.enable(name)
    objects[name].enabled = true
end

function object_controller.checkInteraction(x1, y1, x2, y2)
    for name, o in pairs(objects) do
        if (testPoint(x1, y1, o.rectangle) or testPoint(x2, y2, o.rectangle)) then
            if (o.enabled) then
                ec.trigger(name)
                break
            end
        end
    end
end

return object_controller