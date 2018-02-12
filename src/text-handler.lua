local text_handler = {}
local states = {
    FREE = 1,
    READ = 2,
    MENU = 3
}
local state, p, curr, textTable
local time = 0

local x = 20
local y = 370
local w = 700
local h = 90
local padding = 20

local gray = { 15, 15, 15, 200 }
local black = { 0, 0, 0, 130 }
local white = { 255, 255, 255 }

local function getNumCharacters()
    -- print at 24 characters per second
    return time * 24
end

local function getTriangleOffset()
    return math.abs(((time * 8) % 6) - 3)
end

local function getTextSubstr(text)
    return string.sub(text, 1, getNumCharacters())
end

local function drawBox()
    love.graphics.setColor(unpack(gray))
    love.graphics.rectangle('fill', x, y, w, h)

    love.graphics.setColor(unpack(black))
    love.graphics.setLineWidth(10)
    love.graphics.rectangle('line', x, y, w, h)

    love.graphics.setColor(unpack(white))
    local triangle_x = x + w - 36
    local triangle_y = y + h - 36 + getTriangleOffset()
    love.graphics.polygon('fill',
        triangle_x, triangle_y,
        triangle_x + 14, triangle_y,
        triangle_x + 7, triangle_y + 14)
end

local function readNextLine()
    curr = curr + 1
    time = 0
    if not textTable[curr] then
        state = states.FREE
        p.setStop(false)
    end
end

love.handlers.text = function(eventType, payload)
    p.setStop(true)
    curr = 1
    textTable = payload
    time = 0

    if eventType == "read" then
        state = states.READ
    elseif eventType == "menu" then
        state = states.MENU
    end
end

function text_handler.init(player)
    state = states.FREE
    p = player
end

function text_handler.draw()
    if state == states.READ then
        drawBox()
        love.graphics.printf(
            getTextSubstr(textTable[curr]),
            x + padding,
            y + padding,
            w - 100
        )
    elseif state == states.MENU then
    end
end

function text_handler.onKey(key)
    if state == states.READ and key == "space" then
        local currentLineLength = string.len(textTable[curr])
        if getNumCharacters() < currentLineLength then
            time = currentLineLength
        else
            readNextLine()
        end
    elseif state == states.MENU then
    end
end

function text_handler.isActive()
    return state ~= states.FREE
end

function text_handler.update(dt)
     if states ~= states.FREE then
        time = time + dt
     end
end

return text_handler