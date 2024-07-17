--[[
    Copyright (C) 2024 - ForgeCMS
    This program is free software licensed under the GNU General Public License v3.0 (GPL-3.0)
    Please see the included LICENSE file for more information

    @Authors : iThorgrim
    @Contributors : M4v3r1ck0, alexis-piquet
]]--

local view          = require("modules.register.view")
local model         = require("modules.register.model")
local utils         = require("common.utils")
local smtps         = require("smtps")
local controller    = { }

--[[ Private functions ]]--
local function fetch_user_by_username(username)
    return model.get_by_username(username)
end

function controller.index(self)
    local connected = self.session.user and self.session.user.logged or false

    return connected and { redirect_to = self:url_for("home") } or { render = view }
end

function controller.register(self)
    local username = self.params.username
    local password = self.params.password
    local confirm_password = self.params.confirm_password

    local data = fetch_user_by_username(username)
    if (data) then
        error("Un utilisateur portant ce nom existe déjà.")
    end

    local salt = utils.generate_salt()
    local verifier = utils.calculate_verifier(username, password, salt)
    model.create_account(username, salt, verifier)
end

return controller
