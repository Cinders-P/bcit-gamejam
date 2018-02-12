local lu = require "src/events/layer-util"
local i = require "src/inventory/controller"

return {
    plant = function()
        print("triggered")
        lu.deleteLayer("plant")
    end,
    gloves = function()
        print("triggered")
        lu.deleteLayer("gloves")
    end,
    citrus = function()
        print("triggered")
        lu.deleteLayer("citrus")
    end,
    flashlight = function()
        i.add("flashlight")
        print("triggered")
        lu.deleteLayer("flashlight")
    end,
    bluebook = function()
        print("triggered")
        lu.deleteLayer("bluebook")
    end,
    rabbit = function()
        print("triggered")
        lu.deleteLayer("rabbit")
    end,
    diary = function()
        print("triggered")
        love.event.push("text",
            "read",
            {
                "There's a lock preventing any morally ambiguous decisions.",
                "Plus, we're good people, right?"
            })
        lu.deleteLayer("diary")
    end,
    girlchair = function()
        --        diag("If only I could sit...")
    end,
    locker = function()
        --      diag("No, I don't need these.. yet..")
    end,
    umbrella1 = function()

        --      diag("Rain rain go away")
        love.event.push("text",
            "read",
            { "Steal an umbrella?" },
            { "umbrellaMenu" })
    end
}