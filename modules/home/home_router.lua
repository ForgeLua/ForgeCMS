--[[
    Copyright (C) 2024 ForgeCMS Authors and Contributors
    This program is free software licensed under the GNU General Public License v3.0 (GPL-3.0)
    Please see the included LICENSE file for more information
    
    @Authors : iThorgrim
    @Contributors : M4v3r1ck0, alexis-piquet
]]--

local controller   = require("modules.home.controllers.home_controller")
local respond_to   = require("lapis.application").respond_to

return function(app)
    app:match( "/", respond_to({
        GET = controller.index,
    }))
end