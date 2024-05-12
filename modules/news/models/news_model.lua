--[[
    Copyright (C) 2024 - ForgeCMS
    This program is free software licensed under the GNU General Public License v3.0 (GPL-3.0)
    Please see the included LICENSE file for more information
    
    @Authors : iThorgrim
    @Contributors : M4v3r1ck0, alexis-piquet
]]--

local http  = require("lapis.nginx.http")
local cjson = require("cjson")
local model = { }

function model.get_all()
    local response, status, headers = http.simple({
        url = "http://10.0.0.30:4444/news",
        method = "GET",
        headers = {
            ["Content-Type"] = "application/json",
            ["Authorization"] = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJuYmYiOjE2OTc2MzY0NDAsImlzcyI6InNYTjhmdjNNS1Fid2thdEhKRE1ic3dlV3FYOURzejNtIiwiZXhwIjoxNzI5MTcyNDQwfQ._XpSFU1sxd2xVIBHPQ9GfuCOJDLlVmGYKDmW6vCYgRI"
        }
    })
    
    return response and cjson.decode(response).results or nil
end

function model.get(id)
    local response, status, headers = http.simple({
        url = string.format("http://10.0.0.30:4444/news/%s", id),
        method = "GET",
        headers = {
            ["Content-Type"] = "application/json",
            ["Authorization"] = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJuYmYiOjE2OTc2MzY0NDAsImlzcyI6InNYTjhmdjNNS1Fid2thdEhKRE1ic3dlV3FYOURzejNtIiwiZXhwIjoxNzI5MTcyNDQwfQ._XpSFU1sxd2xVIBHPQ9GfuCOJDLlVmGYKDmW6vCYgRI"
        }
    })

    return response and cjson.decode(response).results or nil
end

return model