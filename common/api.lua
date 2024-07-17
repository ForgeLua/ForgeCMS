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
    ["Authorization"] = "Bearer " .. config.WEB_API_SECRET
}

local api_urls = {
    web = config.WEB_API_URL,
    auth = config.AUTH_API_URL,
    chars = config.CHARS_API_URL,
    world = config.WORLD_API_URL
}

local function make_request(method, type_api, endpoint, data)
    local url = api_urls[type_api]
    if not url then
        return nil, "Invalid API type"
    end

    local request_options = {
        url = url .. endpoint,
        method = method,
        headers = headers
    }

    if data then
        request_options.body = cjson.encode(data)
    end

    local response, status, headers = http.simple(request_options)
    return response and cjson.decode(response).results or nil, status
end

function api_helper.get(type_api, endpoint)
    return make_request("GET", type_api, endpoint)
end

function api_helper.post(type_api, endpoint, data)
    return make_request("POST", type_api, endpoint, data)
end

return api_helper
