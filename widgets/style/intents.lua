local commonUtils = require('common.utils')
local intents = {}

-- Couleurs sans point-virgule
local primary = '#b39475'
local secondary = '#abacb0'
local success = '#27ae60'
local danger = '#9f1600'
local warning = '#b06601'
local info = '#3498db'
local dark = '#2c3e50'
local light = '#ecf0f1'
local link = '#2980b9'

local defaultIntents = {
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
  ['$primary_light'] = commonUtils.HexToRgba(primary, 0.6),
  ['$secondary_light'] = commonUtils.HexToRgba(secondary, 0.6),
  ['$success_light'] = commonUtils.HexToRgba(success, 0.6),
  ['$danger_light'] = commonUtils.HexToRgba(danger, 0.6),
  ['$warning_light'] = commonUtils.HexToRgba(warning, 0.6),
  ['$info_light'] = commonUtils.HexToRgba(info, 0.6),
  ['$dark_light'] = commonUtils.HexToRgba(dark, 0.6),
  ['$light_light'] = commonUtils.HexToRgba(light, 0.6),
  ['$link_light'] = commonUtils.HexToRgba(link, 0.6),
}

function intents.getIntents()
  local intentsStr = ''
  for key, value in pairs(defaultIntents) do
    intentsStr = intentsStr .. string.format('%s: %s;\n', key, value)
  end
  return intentsStr
end

return intents