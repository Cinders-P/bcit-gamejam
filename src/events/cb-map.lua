return {
    umbrellaMenu = function()
        love.event.push("text",
            "menu",
            {
                "Do it.",
                "Don't do it."
            },
            { "stoleUmbrella", "_stoleUmbrella" })
    end,
    stoleUmbrella = function()
        print("stole it!")
    end,
    _stoleUmbrella = function()
        print("good boi")
    end
}