--[[
    Copyright (C) 2024 - ForgeCMS
    This program is free software licensed under the GNU General Public License v3.0 (GPL-3.0)
    Please see the included LICENSE file for more information

    @Authors : iThorgrim
    @Contributors : M4v3r1ck0, alexis-piquet
]]--

local controller   = require("modules.login.controller")
local respond_to   = require("lapis.application").respond_to

return function(app)
    app:match( "/login", respond_to({
        GET = controller.index,
        POST = controller.login
    }))
end
