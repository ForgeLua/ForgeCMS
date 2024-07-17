--[[
    Copyright (C) 2024 - ForgeCMS
    This program is free software licensed under the GNU General Public License v3.0 (GPL-3.0)
    Please see the included LICENSE file for more information
    
    @Authors : iThorgrim
    @Contributors : M4v3r1ck0, alexis-piquet
]]--

local lapis     = require("lapis")
local engine    = require("lapis.db.model").Model
local model     = {}

local config    = engine:extend("config")

function model.loadConfig()
    return config:select()
end

return model
