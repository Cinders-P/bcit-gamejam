local flagMap = {
    door = 1
}

love.handlers.flag = function(name, state)
    flagMap[name] = state
end

return function(name)
    return flagMap[name]
end