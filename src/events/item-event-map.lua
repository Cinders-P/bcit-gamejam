return {
    diary = function(item)
        love.event.push(
            "text",
        "read",
            {"Well...",
            "I can't fault you for trying, but I don't think your "
                    .. string.upper(item) .. " is going to open it."}
        )
    end
}