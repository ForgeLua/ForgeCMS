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
  if active_template == nil then
    print("active_template is nil")
    return ""
  end

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
    ['$none'] = active_template.intents.none
  }

  local intents = {}
  for key, value in pairs(template_intents) do
    if value then
      intents[key] = value
      if key ~= '$none' then
        intents[key .. "_light"] = common_utils.hex_to_rgba(value, 0.6)
      end
    end
  end

  local strigify_intents = ''
  for key, value in pairs(intents) do
    strigify_intents = strigify_intents .. string.format('%s: %s;\n', key, value)
  end
  return strigify_intents
end

return intents
