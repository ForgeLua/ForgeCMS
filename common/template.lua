--[[
    Copyright (C) 2024 - ForgeCMS
    This program is free software licensed under the GNU General Public License v3.0 (GPL-3.0)
    Please see the included LICENSE file for more information
    
    @Authors : iThorgrim
    @Contributors : M4v3r1ck0, alexis-piquet
]]--

local model  = require('lapis.db.model').Model
local template = {}

function template.get_template_variables_by_id(id)
  local template_variables = model:extend('template_variables'):select('WHERE id = ?', id)

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
      template_variables[value] = model
        :extend(string.format('template_variables_%s', value))
        :select('WHERE id = ?', template_variables[string.format('%s_id', value)])
    end
  end

  return template_variables
end

function template.get_active()
  local active_template = model:extend('template'):select('WHERE active = ?', true)
	if active_template == nil then
		error('No active template found')
	end

  active_template.intents   = model:extend('template_intents'):select('WHERE id = ?', active_template.intents_id)
  active_template.variables = template.get_template_variables_by_id(active_template.id)
  return active_template
end

function template.set_active(id)
  local current_active_templates = model:extend('template'):select('active = ?', true)
  for current_active_template in pairs(current_active_templates) do
    current_active_template:update({ active = false })
  end
  local active_template = model:extend('template'):find(id)
  return active_template:update({ active = true })
end

return template
