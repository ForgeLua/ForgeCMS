--[[
    Copyright (C) 2024 - ForgeCMS
    This program is free software licensed under the GNU General Public License v3.0 (GPL-3.0)
    Please see the included LICENSE file for more information

    @Authors : iThorgrim
    @Contributors : M4v3r1ck0, alexis-piquet
]]--

local view          = require("modules.login.view")
local model         = require("modules.login.model")
local utils         = require("common.utils")
local controller    = { }

--[[ Private functions ]]--
local function fetch_user_by_username(username)
    return model.get_by_username(username)
end

function controller.index(self)
    local connected = self.session.user and self.session.user.logged or false

    return connected and { redirect_to = self:url_for("home") } or { render = view }
end

function controller.login(self)
    local username = self.params.username
    local password = self.params.password

    local data = fetch_user_by_username(username)
    if (not data) then
        error("Aucun utilisateur(s) trouvé pour ce nom d'utilisateur")
    end

    local verifier = utils.calculate_verifier(username, password, data.salt)
    if (verifier ~= data.verifier) then
        error("Le mot de passe ne correspond pas.")
    end

    self.session.user = {
        username = username,
        logged   = true
    }
end

return controller
