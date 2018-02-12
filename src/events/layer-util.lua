local layer_util = {}
local map

function layer_util.init(m)
    map = m
end

function layer_util.deleteLayer(name)
    for i, layer in pairs(map.layers) do
        if layer.name == name then
            map:box2d_removeLayer(i)
            map:removeLayer(i)
            break
        end
    end
end

return layer_util