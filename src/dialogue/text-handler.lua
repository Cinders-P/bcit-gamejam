local ec = require "src/events/controller"
local ui = require "src/dialogue/ui"
local states = require "src/dialogue/states"

local text_handler = {}
local state, p, curr, textTable
local fTable

local function freeState()
    state = states.FREE
    p.setStop(false)
end

local function doCallback(index)
    ec.doCallback(fTable[index])
end

local function readNextLine()
    curr = curr + 1
    ui.time = 0
    if not textTable[curr] then
        freeState()
        doCallback(1)
    end
end

love.handlers.text = function(eventType, payload, callbacks)
    p.setStop(true)
    curr = 1
    textTable = payload
    fTable = callbacks or {}
    ui.time = 0

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
     ui.draw(state, textTable, curr)
end

function text_handler.onKey(key)
    if state == states.READ and key == "space" then

        local currentLineLength = string.len(textTable[curr])
        if not ui.isLineDone(currentLineLength) then
            ui.time = currentLineLength
        else
            readNextLine()
        end

    elseif state == states.MENU then

        if key == "s" then
            curr = math.min(curr + 1, #textTable)
        elseif key == "w" then
            curr = math.max(curr - 1, 1)
        elseif key == "space" then
            freeState()
            ui.clearView()
            doCallback(curr)
        end

    end
end

function text_handler.isActive()
    return state ~= states.FREE
end

function text_handler.update(dt)
     if text_handler.isActive() then
        ui.time = ui.time + dt
     end
end

return text_handler