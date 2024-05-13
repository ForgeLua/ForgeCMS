local CommonUtils = require('common.utils')

local primary = '#b39475'
local secondary = '#abacb0'
local success = '#27ae60'
local danger = '#9f1600'
local warning = '#b06601'
local info = '#3498db'
local dark = '#2c3e50'
local light = '#2c3e50'
local link = '#2c3e50'

local default_intents = {
  ['$primary'] = primary,
  ['$secondary'] = secondary,
  ['$success'] = success,
  ['$danger'] = danger,
  ['$warning'] = warning,
  ['$info'] = info,
  ['$dark'] = dark,
  ['$light'] = light,
  ['$link'] = link,
  ['$none'] = 'transparent',
  ['$primary_light'] = CommonUtils.HexToRgba(primary, '.6'),
  ['$secondary_light'] = CommonUtils.HexToRgba(secondary, '.6'),
  ['$success_light'] = CommonUtils.HexToRgba(success, '.6'),
  ['$danger_light'] = CommonUtils.HexToRgba(danger, '.6'),
  ['$warning_light'] = CommonUtils.HexToRgba(warning, '.6'),
  ['$info_light'] = CommonUtils.HexToRgba(info, '.6'),
  ['$dark_light'] = CommonUtils.HexToRgba(dark, '.6'),
  ['$light_light'] = CommonUtils.HexToRgba(light, '.6'),
  ['$link_light'] = CommonUtils.HexToRgba(link, '.6'),
}

function GetIntents()
  local intents = ''
  for key, value in pairs(default_intents) do
    intents = intents .. string.format('$%s: %s;\n', key, value)
  end
  return intents
end

return {
  default_intents = default_intents,
  GetIntents = GetIntents,
}