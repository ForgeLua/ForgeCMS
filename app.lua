--[[
    Copyright (C) 2024 - ForgeCMS
    This program is free software licensed under the GNU General Public License v3.0 (GPL-3.0)
    Please see the included LICENSE file for more information
    
    @Authors : iThorgrim
    @Contributors : M4v3r1ck0, alexis-piquet
]]--

local lapis         = require("lapis")
local modules       = require("forgecms").modules
local app_helpers   = require("lapis.application")
local respond_to    = require("lapis.application").respond_to

local app = lapis.Application()
  app:enable("etlua")
  app.html   = require( "lapis.html" )
  app.layout = require( "views.base.layout" )
  
-- Declare and init modules / routers
for _, module_name in pairs(modules) do
    local forge_module = require( string.format( "modules.%s.%s_router", module_name, module_name))
    if ( forge_module ) then
      forge_module(app)
    end
end

return app