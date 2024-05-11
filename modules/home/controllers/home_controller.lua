--[[
    Copyright (C) 2024 ForgeCMS Authors and Contributors
    This program is free software licensed under the GNU General Public License v3.0 (GPL-3.0)
    Please see the included LICENSE file for more information
    
    @Authors : iThorgrim
    @Contributors : M4v3r1ck0, alexis-piquet
]]--

local view          = require("modules.home.views.home_view")
local controller    = { }

function controller.index(self)
    return { render = view }
end

return controller