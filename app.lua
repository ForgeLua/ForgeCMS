--[[
    Copyright (C) 2024 - ForgeCMS
    This program is free software licensed under the GNU General Public License v3.0 (GPL-3.0)
    Please see the included LICENSE file for more information
    
    @Authors : iThorgrim
    @Contributors : M4v3r1ck0, alexis-piquet
]]--

local lapis         = require("lapis")
-- local modules       = require("forgecms").modules
local app_helpers   = require("lapis.application")
local respond_to    = require("lapis.application").respond_to
local util          = require("common.util")

local app = lapis.Application()
  app:enable("etlua")
  app.html   = require( "lapis.html" )
  app.layout = require( "layout.global" )

-- Declare and load modules
app.modules = require("modules.admin.modules.controller").loadModules()

-- Init router for modules
for id, mod in pairs(app.modules) do
    local router = util.require_module(mod).router
    
    if router then
        router(app)
    end
end

return app