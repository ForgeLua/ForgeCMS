--[[
    Copyright (C) 2024 - ForgeCMS
    This program is free software licensed under the GNU General Public License v3.0 (GPL-3.0)
    Please see the included LICENSE file for more information

    @Authors : iThorgrim
    @Contributors : M4v3r1ck0, alexis-piquet
]]--

local api = require("common.api")
local model = { }

function model.get_by_username(username)
    return api.get(2, string.format("/account/%s", username))
end

return model
