--[[
    Copyright (C) 2024 - ForgeCMS
    This program is free software licensed under the GNU General Public License v3.0 (GPL-3.0)
    Please see the included LICENSE file for more information
    
    @Authors : iThorgrim
    @Contributors : M4v3r1ck0, alexis-piquet
]]--

local controller   = require("modules.error.controller")
local view         = require('modules.error.view')
local respond_to   = require("lapis.application").respond_to

return function(app)
    app:match( "/error", respond_to({
        GET = controller.index,
    }))
    
--[[     app.handle_404 = function (self)
        self.data = { code = 404 }
        return { render = view }
    end

    app.handle_403 = function (self)
        self.data = { code = 403 }
        return { render = view }
    end
    
    app.handle_500 = function (self)
        self.data = { code = 500 }
        return { render = view }
    end ]]
end