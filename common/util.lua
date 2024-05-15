local lfs    = require('lfs')
local util   = {}
local sf     = string.format

function util.require_module(module_name)
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

return util