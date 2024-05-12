--[[
    Copyright (C) 2024 - ForgeCMS
    This program is free software licensed under the GNU General Public License v3.0 (GPL-3.0)
    Please see the included LICENSE file for more information
    
    @Authors : iThorgrim
    @Contributors : M4v3r1ck0, alexis-piquet
]]--

local index         = require("modules.news.views.news_index_view")
local view          = require("modules.news.views.news_view")
local model         = require("modules.news.models.news_model")
local controller    = { }

function controller.index(self)
    self.news_list = model.get_all()
    return { render = index }
end

function controller.view(self)
    local news_id = tonumber(self.params.news_id)
    if (not news_id) then
        return { render = index }
    end
    
    local news = model.get(news_id)
    if ( not news ) then
       -- error 
    end
    
    self.data = news
    return { render = view }
end

return controller