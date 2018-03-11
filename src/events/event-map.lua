local lu = require "src/events/layer-util"
local i = require "src/inventory/controller"
local get = require "src/event-flags"

local doorLines = {
    "The door is securely locked.",
    "The door is still securely locked.",
    "You confirm the door is still securely locked.",
    "Depsite your best intentions, the door is still securely locked."
}

local function getDoorLine()
    local i = get("door")
    love.event.push("flag", "door", i + 1)
    return doorLines[math.min(i, #doorLines)]
end

return {
    flashlight = function()
        local item = "flashlight"
        love.event.push("text",
            "read",
            { "(You pick up a " .. item .. ".)" })
        i.add(item)
        lu.deleteLayer(item)
    end,
    gloves = function()
        local item = "gloves"
        love.event.push("text",
            "read",
            { "(These could come in HAND-y.)" })
        i.add(item)
        lu.deleteLayer(item)
    end,
    stool = function()
        local item = "stool"
        love.event.push("text",
            "read",
            {
                "You stand on the stool.",
                "",
                "Just the right height to vandalize the top of the chalkboard."
            })
        --        i.add(item)
        --        lu.deleteLayer(item)
    end,
    ["red-chair"] = function()
        love.event.push("text",
            "read",
            {
                "The pleather is worn and cracks mar the surface.",
                "This chair has definitely been at this school longer than you have."
            })
    end,
    bookshelf1 = function()
    end,
    bookshelf2 = function()
        love.event.push("text",
            "read",
            {
                "You pick up a few titles.",
                "KONOHA: HIDDEN SCARS (Naruto x Sasuke)",
                "Johnlock Reborn [LEMON] (part 3)",
                "my harry potter rp ~~The Great Hall~~",
                "",
                "You put down a few titles."
            })
    end,
    switch = function()
        love.event.push("text",
            "read",
            {
                "CLICK!",
                "..."
            })
    end,
    plant = function()
        love.event.push("text",
            "read",
            { "You don't remember this plant being here, but it wouldn't be the first time you let something slip by." })
    end,
    door = function()
        love.event.push("text",
            "read",
            { getDoorLine() })
    end,
    note = function()
        love.event.push("text",
            "read",
            {
                '"HOMEWORK FOR MONDAY"',
                'Webwork problem set 9',
                'wave interference lab report',
                'solve world hunger',
                'preread pages 123-154'
            })
    end,
    calendar = function()
        love.event.push("text",
            "read",
            {
                "Today appears to be Feburary 14th.",
                "Or at least that's the date circled in red."
            })
    end,

    chart = function()
        love.event.push("text",
            "read",
            {
                "A tracker for Good Boy Points (GBP).",
                "You won't be getting tendies anytime soon."
            })
    end,

    citrus = function()
        love.event.push("text",
            "read",
            {
                "At least you won't die by scurvy."
            })
    end,
    ["gray-book"] = function()
        love.event.push("text",
            "read",
            {
                "Gross!",
                "There's nothing but notes in here!"
            })
    end,
    bookbag = function()
        love.event.push("text",
            "read",
            {
                "Uh oh.",
                "Robert's got a quick hand...",
                "(You got a gun.)"
            })
    end,
    ["girl-chair"] = function()
        love.event.push("text",
            "read",
            {
                "This is not the time to take a break!"
            })
    end,
    ["tissue-box"] = function()

    end,
    ["blue-book"] = function()
        love.event.push("text",
            "read",
            {
                '"The Hitchhiker\'s Guide to the Galaxy"'
            })
    end,
    nameplate = function()
        love.event.push("text",
            "read",
            {
                '"TheLegend27"'
            })
    end,
    fishbowl = function()
        love.event.push("text",
            "read",
            {
                "You stammer out a greeting.",
                '"Did this cretin just say hello to me?"'
            })
    end,

    locker = function()
        love.event.push("text",
            "read",
            {
                "Tempting, but you are not sure how schoolgirl panties will help you escape."
            })
    end,
    umbrella2 = function()
        love.event.push("text",
            "read",
            {
                "OwO, what's this?",
                "You fish out a hammer."
            })
    end,

    phone = function()
        love.event.push("text",
            "read",
            {
                "I'm sorry. The old Sarah can't come to the phone right now..."
            })
    end,
    newspaper = function()

    end,
    flowers = function()
        love.event.push("text",
            "read",
            {
                "These look fresh. Were they placed recently?"
            })
    end,
    rabbit = function() end,
    printer = function() end,
    ["shelf-notice"] = function()

    end,
    cd = function()
        love.event.push("text",
            "read",
            {
                "The mound of CDs grows ever larger.",
                "You don't know which to pick up."
            })
    end,
    trashcan = function()
        love.event.push("text",
            "read",
            {
                "You look inside, into a black void of nothingness.",
                "...",
                "There is probably a metaphor somewhere."
            })
    end,
    alien = function()
        love.event.push("text",
            "read",
            {
                "This locker is... locked."
            })
    end,
    diary = function()
        love.event.push("text",
            "read",
            {
                "There's a lock preventing any morally ambiguous decisions."
            })
    end,
    umbrella1 = function()
        love.event.push("text",
            "read",
            { "Steal an umbrella?" },
            { "umbrellaMenu" })
    end
}