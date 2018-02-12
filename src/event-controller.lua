local event_controller = {}
local i, map, oc

local function deleteLayer(name)
    for i, layer in pairs(map.layers) do
        if layer.name == name then
            map:box2d_removeLayer(i)
            map:removeLayer(i)
            break
        end
    end
end

function event_controller.init(m, object_controller, inventory)
    -- store a reference to the global map
    map = m
    oc = object_controller
    i = inventory
end

function event_controller.trigger(name)
    local f = event_controller.eventMap[name]
    if f then f() end
end

-- TODO: make item files for things you want to display in inventory

event_controller.eventMap = {
    plant = function()
        print("triggered")
        deleteLayer("plant")
    end
  ,
    gloves = function()
        print("triggered")
        deleteLayer("gloves")
    end
  ,  
    citrus = function()
        print("triggered")
        deleteLayer("citrus")
    end
  ,
    flashlight = function()
        i.add("flashlight")
        print("triggered")
        deleteLayer("flashlight")
    end
  ,
    bluebook = function()
        print("triggered")
        deleteLayer("bluebook")
    end
  ,
    rabbit = function()
        print("triggered")
        deleteLayer("rabbit")
    end
  ,
    diary = function()
        print("triggered")
        love.event.push(
            "text",
            "read",
            {"There's a lock preventing any morally ambiguous decisions.",
            "Plus, we're good people, right?"}
        )
        deleteLayer("diary")
    end
  ,
    girlchair = function()
--        diag("If only I could sit...")
    end
  ,
    locker = function()
--      diag("No, I don't need these.. yet..")
    end
  ,
    umbrella1 = function()
--      diag("Rain rain go away")
    end
 
}

return event_controller