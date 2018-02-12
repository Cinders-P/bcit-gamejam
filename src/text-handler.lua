local text_handler = {}
local states = {
    FREE = 1,
    READ = 2,
    MENU = 3
}
local state, p, curr, textTable

local x = 20
local y = 370
local w = 700
local h = 90
local padding = 20

local gray = { 15, 15, 15, 200 }
local black = { 0, 0, 0, 130 }
local white = { 255, 255, 255 }

local function drawBox()
    love.graphics.setColor(unpack(gray))
    love.graphics.rectangle('fill', x, y, w, h)

    love.graphics.setColor(unpack(black))
    love.graphics.setLineWidth(10)
    love.graphics.rectangle('line', x, y, w, h)

    love.graphics.setColor(unpack(white))
    local triangle_x = x + w - 36
    local triangle_y = y + h - 36
    love.graphics.polygon('fill',
        triangle_x, triangle_y,
        triangle_x + 14, triangle_y,
        triangle_x + 7, triangle_y + 14)
end

function text_handler.init(player)
    state = states.FREE
    p = player
end

love.handlers.text = function(eventType, payload)
    p.setStop(true)
    curr = 1
    textTable = payload

    if eventType == "read" then
        state = states.READ
    elseif eventType == "menu" then
        state = states.MENU
    end
end

function text_handler.draw()
    if state == states.READ then
        drawBox()
        love.graphics.printf(textTable[curr], x + padding, y + padding, w - 100)
    elseif state == states.MENU then
    end
end

function text_handler.onKey(key)
    if state == states.READ and key == "space" then
        curr = curr + 1
        if not textTable[curr] then
            state = states.FREE
            p.setStop(false)
        end
    elseif state == states.MENU then
    end
end

function text_handler.isActive()
    return state ~= states.FREE
end

return text_handler