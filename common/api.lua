--[[
    Copyright (C) 2024 - ForgeCMS
    This program is free software licensed under the GNU General Public License v3.0 (GPL-3.0)
    Please see the included LICENSE file for more information
    
    @Authors : iThorgrim
    @Contributors : M4v3r1ck0, alexis-piquet
]]--

local http   = require("lapis.nginx.http")
local cjson  = require("cjson")
local config = require("modules.admin.config.controller").loadConfig()

local api_helper = {}

local headers  = {
    ["Content-Type"] = "application/json",
    ["Authorization"] = 
        "Bearer " .. config.WEB_API_SECRET
}

function api_helper.get(endpoint)
    local response, status, headers = http.simple({
        url     = config.WEB_API_URL .. endpoint,
        method  = "GET",
        headers = headers
    })

    return response and cjson.decode(response).results or nil
end

return api_helper