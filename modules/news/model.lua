--[[
    Copyright (C) 2024 - ForgeCMS
    This program is free software licensed under the GNU General Public License v3.0 (GPL-3.0)
    Please see the included LICENSE file for more information
    
    @Authors : iThorgrim
    @Contributors : M4v3r1ck0, alexis-piquet
]]--

local api = require("common.api")
local model = { }

function model.get_all()
    return api.get("/news")
end

function model.get(id)
    return api.get("/news/" .. id)
end

return model