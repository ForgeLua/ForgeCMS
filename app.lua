local lapis         = require("lapis")
local app_helpers   = require("lapis.application")
local respond_to    = require("lapis.application").respond_to

local app = lapis.Application()
  app:enable("etlua")
  app.html   = require( "lapis.html" )
  app.layout = require( "views.base.layout" )
  
-- Declare modules
local home_router = require("modules.home.home_router")

-- Init route for modules
home_router( app )

return app