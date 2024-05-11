--[[
    Copyright (C) 2024 ForgeCMS Authors and Contributors
    This program is free software licensed under the GNU General Public License v3.0 (GPL-3.0)
    Please see the included LICENSE file for more information
    
    @Authors : iThorgrim
    @Contributors : M4v3r1ck0, alexis-piquet
]]--

local controller   = require("modules.error.controllers.error_controller")
local view         = require('modules.error.views.error_view')
local respond_to   = require("lapis.application").respond_to

return function(app)
    app:match( "/error", respond_to({
        GET = controller.index,
    }))
    
    app.handle_404 = function (self)
        self.data = { code = 404 }
        return { render = view }
    end
    
    app.handle_500 = function (self)
        self.data = { code = 500 }
        return { render = view }
    end
end