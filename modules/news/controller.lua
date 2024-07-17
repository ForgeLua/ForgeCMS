--[[
    Copyright (C) 2024 - ForgeCMS
    This program is free software licensed under the GNU General Public License v3.0 (GPL-3.0)
    Please see the included LICENSE file for more information
    
    @Authors : iThorgrim
    @Contributors : M4v3r1ck0, alexis-piquet
]]--

local list          = require("modules.news.list")
local index         = require("modules.news.index")
local model         = require("modules.news.model")
local controller    = { }

function controller.index(self)
    self.page_title = "Home"
    self.news_list = model.get_all()
    return { render = list }
end

function controller.view(self)
    local news_id = tonumber(self.params.news_id)
    if (not news_id) then
        return { render = list }
    end
    
    local news = model.get(news_id)
    if ( not news ) then
       -- error 
    end
    
    self.data = news
    return { render = index }
end

return controller
