-- api_helper.lua

local http  = require("lapis.nginx.http")
local cjson = require("cjson")

local api_helper = {}

local api_base = "http://10.0.0.30:4444"
local headers  = {
    ["Content-Type"] = "application/json",
    ["Authorization"] = 
        "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJuYmYiOjE2OTc2MzY0NDAsImlzcyI6InNYTjhmdjNNS1Fid2thdEhKRE1ic3dlV3FYOURzejNtIiwiZXhwIjoxNzI5MTcyNDQwfQ._XpSFU1sxd2xVIBHPQ9GfuCOJDLlVmGYKDmW6vCYgRI"
}

function api_helper.get(endpoint)
    local response, status, headers = http.simple({
        url     = api_base .. endpoint,
        method  = "GET",
        headers = headers
    })

    return response and cjson.decode(response).results or nil
end

return api_helper