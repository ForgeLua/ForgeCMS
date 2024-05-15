--[[
    Copyright (C) 2024 - ForgeCMS
    This program is free software licensed under the GNU General Public License v3.0 (GPL-3.0)
    Please see the included LICENSE file for more information
    
    @Authors : iThorgrim
    @Contributors : M4v3r1ck0, alexis-piquet
]]--

local model      = require("modules.admin.config.model")
local controller = {}

function controller.loadConfig()
    local result = model.loadConfig()
    local config = {}
    for _, data in pairs(result) do
        config[data.name] = data.value
    end
    
    return config
end

return controller