--[[
    Copyright (C) 2024 - ForgeCMS
    This program is free software licensed under the GNU General Public License v3.0 (GPL-3.0)
    Please see the included LICENSE file for more information
    
    @Authors : iThorgrim
    @Contributors : M4v3r1ck0, alexis-piquet
]]--

local intents = require('widgets.style.intents')
local sass    = require('sass')
local utils   = {}

function utils.compile_scss_with_variables()
  local scss_file = io.open('styles/default.scss', 'r')
  local scss = nil

  if not scss_file then
    error("Could not open file 'styles/default.scss'")
  else
    scss = scss_file:read('*all')
    scss_file:close()
  end
  
  local modifedScss = string.format([[
    $color_1: #ebdec2;
    $color_2: #fff;
    $color_3: #f7b10a;
    $color_4: #ffd36b;
    $color_5: white;
    $color_6: #5792d5;
    $font-family_1: Open Sans, Arial, Helvetica, sans-serif;
    $font-family_2: Semplicita Pro,Open Sans,Arial,Helvetica,sans-serif;
    $font-family_3: opensans,sans-serif;
    $transparent: transparent;
    
    // INTENTS
    %s
    
    // SCSS
    %s

  ]],intents.get_intents(), scss)
  print(modifedScss)

  return sass.compile(modifedScss, "compressed")
end

return utils