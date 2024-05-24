--[[
    Copyright (C) 2024 - ForgeCMS
    This program is free software licensed under the GNU General Public License v3.0 (GPL-3.0)
    Please see the included LICENSE file for more information
    
    @Authors : iThorgrim
    @Contributors : M4v3r1ck0, alexis-piquet
]]--

local common_utils = require('common.utils')
local template = require("common.template")

local variables = {}

function variables.get_variables()
  local active_template = template.get_active()

  local template_variables = {
    ['$primary'] = active_template.intents.primary,
    ['$primary_light'] = common_utils.hex_to_rgba(active_template.intents.primary, .6),
  }
  local strigify_variables = ''
  for key, value in pairs(template_variables) do
    strigify_variables = strigify_variables .. string.format('%s: %s;\n', key, value)
  end
  return strigify_variables
end

return variables
