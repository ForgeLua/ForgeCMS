--[[
    Copyright (C) 2024 - ForgeCMS
    This program is free software licensed under the GNU General Public License v3.0 (GPL-3.0)
    Please see the included LICENSE file for more information
    
    @Authors : iThorgrim
    @Contributors : M4v3r1ck0, alexis-piquet
]]--

local common_utils = require('common.utils')
local template = require("common.template")

local intents = {}

function intents.get_intents()
  local active_template = template.get_active()

  local template_intents = {
    ['$primary'] = active_template.intents.primary,
    ['$secondary'] = active_template.intents.secondary,
    ['$success'] = active_template.intents.success,
    ['$danger'] = active_template.intents.danger,
    ['$warning'] = active_template.intents.warning,
    ['$info'] = active_template.intents.info,
    ['$dark'] = active_template.intents.dark,
    ['$light'] = active_template.intents.light,
    ['$link'] = active_template.intents.link,
    ['$none'] = active_template.intents.none,
    ['$primary_light'] = common_utils.hex_to_rgba(active_template.intents.primary, .6),
    ['$secondary_light'] = common_utils.hex_to_rgba(active_template.intents.secondary, .6),
    ['$success_light'] = common_utils.hex_to_rgba(active_template.intents.success, .6),
    ['$danger_light'] = common_utils.hex_to_rgba(active_template.intents.danger, .6),
    ['$warning_light'] = common_utils.hex_to_rgba(active_template.intents.warning, .6),
    ['$info_light'] = common_utils.hex_to_rgba(active_template.intents.info, .6),
    ['$dark_light'] = common_utils.hex_to_rgba(active_template.intents.dark, .6),
    ['$light_light'] = common_utils.hex_to_rgba(active_template.intents.light, .6),
    ['$link_light'] = common_utils.hex_to_rgba(active_template.intents.link, .6)
  }
  local strigify_intents = ''
  for key, value in pairs(template_intents) do
    strigify_intents = strigify_intents .. string.format('%s: %s;\n', key, value)
  end
  return strigify_intents
end

return intents
