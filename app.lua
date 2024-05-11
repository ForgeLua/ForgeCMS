local lapis         = require("lapis")
local modules       = require("config_modules")
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