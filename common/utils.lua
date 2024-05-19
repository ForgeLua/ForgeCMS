local lfs     = require('lfs')
local utils   = {}
local sf      = string.format

function utils.require_module(module_name)
    local path = "modules/" .. module_name
    local module = {model = nil, controller = nil, router = nil, views = {}}

    -- load modules files
    for file in lfs.dir(path) do
        if file:match("%.lua") then
            local component = file:gsub(".lua", "")
            module[component] = require(string.gsub(path .. sf(".%s", component), "/", "."))
        elseif file:match("%.etlua") then
            local view = file:gsub(".etlua", "")
            module.views[view] = require(path .. sf(".%s", view))
        end
    end

    return module
end

function utils.HexToRgba(hex, opacity)
    hex = hex:gsub("#","")
    local r,g,b = tonumber("0x"..hex:sub(1,2)), tonumber("0x"..hex:sub(3,4)), tonumber("0x"..hex:sub(5,6))
    return string.format('rgba(%d, %d, %d, %.2f)', r, g, b, opacity)
end

return utils