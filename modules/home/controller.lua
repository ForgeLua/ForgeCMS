--[[
    Copyright (C) 2024 - ForgeCMS
    This program is free software licensed under the GNU General Public License v3.0 (GPL-3.0)
    Please see the included LICENSE file for more information
    
    @Authors : iThorgrim
    @Contributors : M4v3r1ck0, alexis-piquet
]]--

local view          = require("modules.home.view")
local controller    = { }

function controller.index(self)
    self.page_description = "Bienvenue sur notre site !"
    self.page_keywords = "wow, world of warcraft, private server, wow private server, world of warcraft private server"
    return { render = view }
end

return controller