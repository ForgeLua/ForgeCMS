--[[
    Copyright (C) 2024 - ForgeCMS
    This program is free software licensed under the GNU General Public License v3.0 (GPL-3.0)
    Please see the included LICENSE file for more information
    
    @Authors : iThorgrim
    @Contributors : M4v3r1ck0, alexis-piquet
]]--

local config = require("lapis.config")

config("development", {
  server = "nginx",
  code_cache = "on",
  num_workers = "1",
  port = 8080
})