--[[
    Copyright (C) 2024 - ForgeCMS
    This program is free software licensed under the GNU General Public License v3.0 (GPL-3.0)
    Please see the included LICENSE file for more information
    
    @Authors : iThorgrim
    @Contributors : M4v3r1ck0, alexis-piquet
]]--

local config = require("lapis.config")
-- local env    = require("dotenv"):load()

config("development", {
    server = "nginx",
    code_cache = "off",
    num_workers = "1",
    port = 8080,

    session_name = "forge_cms_cookies",
    secret = "random_123+456=789",

    sqlite = {
        database = "forgecms.config",
        -- open_flags = ...
    }
})
