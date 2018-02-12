local states = require "src/constants/states"
local graphics_util = {}

function graphics_util.createAnimation(image, width, height, duration)
    local animation = {}
    animation.spriteSheet = image;
    animation.quads = {};

    local yTiles = (image:getHeight() - height) / height
    local xTiles = (image:getWidth() - width) / width

    for y = 0, yTiles, 1 do
        for x = 0, xTiles, 1 do
            animation.quads[y+1] = animation.quads[y+1] or {}
            animation.quads[y+1][x+1] = love.graphics.newQuad(x * width, y * height, width, height, image:getDimensions())
        end
    end

    animation.duration = duration or 0.3
    animation.currentTime = 0

    return animation
end

function graphics_util.getCurrentFrame(animation, dir, state)
    local seq = animation.quads[dir]
    if (state == states.IDLE) then
        return seq[1]
    end

    local seqLength = #animation.quads[dir]
    local frameNum = math.floor(animation.currentTime / animation.duration)
-- frameNum + 1 because it looks laggy if first frame duration is same as idle
    return seq[((frameNum + 1) % seqLength) + 1]
end

-- modified version of Map:draw() from STI
function graphics_util.drawMap(map, player)
    local lg = love.graphics
    local curr_canvas = lg.getCanvas()
    lg.setCanvas(map.canvas)
    lg.clear()

    lg.push()
    lg.origin()
    lg.translate(map.tx or 0, map.ty or 0)
    lg.scale(map.scale)

    for _, layer in ipairs(map.layers) do
        if layer.name == "pl" then
            player.draw()
        elseif layer.visible and layer.opacity > 0 then
            map:drawLayer(layer)
        end
    end

    lg.pop()

    -- Draw canvas at 0,0; this fixes scissoring issues
    -- Map is scaled to correct scale so the right section is shown
    lg.push()
    lg.origin()
    lg.setCanvas(curr_canvas)
    lg.draw(map.canvas)
    lg.pop()
end

return graphics_util