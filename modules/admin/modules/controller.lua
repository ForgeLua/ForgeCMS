--[[
    Copyright (C) 2024 - ForgeCMS
    This program is free software licensed under the GNU General Public License v3.0 (GPL-3.0)
    Please see the included LICENSE file for more information
    
    @Authors : iThorgrim
    @Contributors : M4v3r1ck0, alexis-piquet
]]--

local model      = require("modules.admin.modules.model")
local controller = {}

function controller.loadModules()
    local result = model.loadModules()
    local modules = {}
    for _, data in pairs(result) do
        if (data.active == 1) then
            modules[data.id] = data.name
        end
    end
    
    return modules
end

return controller