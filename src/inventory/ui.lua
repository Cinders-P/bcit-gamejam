local sideLength = 45
local xNum = 1
local yNum = 6
local margin = 8
local between = 5

local w = (sideLength * xNum) + ((xNum - 1) * between) + (margin * 2)
local h = (sideLength * yNum) + ((yNum - 1) * between) + (margin * 2)
local xPos
local yPos

local function getDrawPosition(x, y)
    -- 0-indexed
    local ix = xPos + margin
    local iy = yPos + margin
    x = ix + ((sideLength + between) * x)
    y = iy + ((sideLength + between) * y)
    return x, y
end

local function draw(item, i)
    local x, y = math.floor(i / yNum), i % yNum
    local px, py = getDrawPosition(x, y)
    love.graphics.print(tostring(i + 1), px + 1, py - 1)
    if item then
        love.graphics.draw(item.sprite, item.quad, px + between, py + between, 0, 1.3)
        if item.held then
            love.graphics.setColor(255, 196, 48, 180)
            love.graphics.setLineWidth(2)
            love.graphics.rectangle('line', px - 2, py - 2, sideLength + 2, sideLength + 2)
            love.graphics.setColor(255, 255, 255, 255)
        end
    end
end

local function drawItems(acquired, limit)
    for i = 0, limit, 1 do
        draw(acquired[i + 1], i)
    end
end

local function drawBase()
    local x = xPos
    local y = yPos
    love.graphics.setColor(0, 0, 0, 220)
    love.graphics.rectangle('fill', x, y, w, h)

    love.graphics.setColor(150, 150, 150, 20)
    x = x + margin
    for j = 0, xNum - 1, 1 do
        y = yPos + margin
        for i = 0, yNum - 1, 1 do
            love.graphics.rectangle('fill', x, y + (i * (sideLength + between)), sideLength, sideLength)
        end
        x = x + sideLength + between
    end

    love.graphics.setColor(255, 255, 255, 255)
end

local inventory_ui = {}

function inventory_ui.init(lgw, lgh)
    xPos = lgw - w
    yPos = lgh - h
end

function inventory_ui.draw(acquired, limit)
    drawBase()
    drawItems(acquired, limit)
end

return inventory_ui