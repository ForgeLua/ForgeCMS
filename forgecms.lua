--[[
    Copyright (C) 2024 - ForgeCMS
    This program is free software licensed under the GNU General Public License v3.0 (GPL-3.0)
    Please see the included LICENSE file for more information

    @Authors : iThorgrim
    @Contributors : M4v3r1ck0, alexis-piquet
]]--

return {
    modules = {
        -- Don't remove this modules
        "error",
        
        -- Remove this modules if you want
        "home",
        "news"
    },
    
    api = {
        web = {
            url     = "http://10.0.0.30:4444",
            secret  = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJuYmYiOjE2OTc2MzY0NDAsImlzcyI6InNYTjhmdjNNS1Fid2thdEhKRE1ic3dlV3FYOURzejNtIiwiZXhwIjoxNzI5MTcyNDQwfQ._XpSFU1sxd2xVIBHPQ9GfuCOJDLlVmGYKDmW6vCYgRI"
        }
    }
}