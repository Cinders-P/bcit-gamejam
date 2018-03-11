return {
    diary = function(item)
        love.event.push(
            "text",
        "read",
            {"Well...",
            "I can't fault you for trying, but I don't think your "
                    .. string.upper(item) .. " is going to open it."}
        )
    end,
    flashlight = function()
        local item = "flashlight"
        love.event.push("text",
            "read",
            { "You pick up a "..item..". Finder's keepers." })
        i.add(item)
        lu.deleteLayer(item)
    end,

    gloves = function() end,
    stool = function() end,
    ["red-chair"] = function() end,
    bookshelf1 = function() end,
    bookshelf2 = function() end,
    switch = function() end,
    plant = function() end,
    door = function() end,
    note = function() end,
    calendar = function() end,
    chart = function() end,
    citrus = function() end,
    ["gray-book"] = function() end,
    bookbag = function() end,
    ["girl-chair"] = function() end,
    ["tissue-box"] = function() end,
    ["blue-book"] = function() end,
    nameplate = function() end,
    fishbowl = function() end,
    locker = function() end,
    umbrella2 = function() end,
    phone = function() end,
    newspaper = function() end,
    flowers = function() end,
    rabbit = function() end,
    printer = function() end,
    ["shelf-notice"] = function() end,
    cd = function() end,
    trashcan = function() end,
    alien = function() end,
    umbrella1 = function()
        love.event.push("text",
            "read",
            { "Steal an umbrella?" },
            { "umbrellaMenu" })
    end

}