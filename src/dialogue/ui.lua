local states = require "src/dialogue/states"
local c = require "src/constants/colors"

local x = 20
local y = 370
local w = 700
local h = 90
local padding = 20

-- the choice that should show on the top half of the box
local view = 1
local ui = {
    time = 0
}

local function getNumCharacters()
    -- print at 24 characters per second
    return ui.time * 24
end

local function getTriangleOffset()
    return math.abs(((ui.time * 8) % 6) - 3)
end

local function getTextSubstr(text)
    return string.sub(text, 1, getNumCharacters())
end

local rectHeight = (h - padding) / 2

local function drawWhiteRectangle(top)
    love.graphics.setColor(unpack(c.yellow))
    local ly = y + 10
    if not top then
        ly = ly + rectHeight
    end

    love.graphics.rectangle('fill',
        x + 10,
        ly,
        w - 80,
        rectHeight)
end

local function printLine(text, isTop, isWhite)
    if isWhite then
        love.graphics.setColor(unpack(c.white))
    else
        love.graphics.setColor(180, 180, 180, 220)
    end

    local ly = y
    if not isTop then
        ly = ly + 33
    end

    love.graphics.printf(text,
        x + padding,
        ly + padding,
        w - 100)
end

local function drawBox()
    love.graphics.setColor(unpack(c.gray))
    love.graphics.rectangle('fill', x, y, w, h)

    love.graphics.setColor(unpack(c.black))
    love.graphics.setLineWidth(10)
    love.graphics.rectangle('line', x, y, w, h)

    love.graphics.setColor(unpack(c.white))
    local triangle_x = x + w - 36
    local triangle_y = y + h - 36 + getTriangleOffset()
    love.graphics.polygon('fill',
        triangle_x, triangle_y,
        triangle_x + 14, triangle_y,
        triangle_x + 7, triangle_y + 14)
end

function ui.draw(state, textTable, curr)
    if state == states.FREE then return end

    drawBox()
    if state == states.READ then
        printLine(getTextSubstr(textTable[curr]), true, true)
    else
        local top = curr == view
        drawWhiteRectangle(top)
        printLine(textTable[view], true, top)
        printLine(textTable[view + 1], false, not top)
    end
end

function ui.clearView()
    view = 1
end

function ui.isLineDone(length)
    return getNumCharacters() >= length
end

return ui