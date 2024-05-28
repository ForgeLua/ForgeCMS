--[[
    Copyright (C) 2024 - ForgeCMS
    This program is free software licensed under the GNU General Public License v3.0 (GPL-3.0)
    Please see the included LICENSE file for more information
    
    @Authors : iThorgrim
    @Contributors : M4v3r1ck0, alexis-piquet
]]--

local engine    = require("lapis.db.model").Model
local template = {}

function template.get_template_variables_by_id(id)
  local template_variables = engine:extend('template_variables'):find(id)

  if template_variables then
    local variables = {
      'animation',
      'background_color',
      'badge_size',
      'box_shadow',
      'button_size',
      'image_shadow',
      'padding',
      'margin',
      'text_shadow',
    }

    for _, value in pairs(variables) do
      template_variables[value] = engine
        :extend(string.format('template_variables_%s', value))
        :find(template_variables[string.format('%s_id', value)])
    end
  end

  return template_variables
end

function template.get_active()
  local active_template     = engine:extend('template'):find({active = 'true' })
  active_template.intents   = engine:extend('template_intents'):find(active_template.intents_id)
  active_template.variables = template.get_template_variables_by_id(active_template.id)
  return active_template
end

function template.set_active(id)
  local current_active_templates = engine:extend('template'):select('active = ?', 'true')
  for current_active_template in pairs(current_active_templates) do
    current_active_template:update({ active = false })
  end
  local active_template = engine:extend('template'):find(id)
  return active_template:update({ active = true })
end

return template
