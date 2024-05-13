local CommonUtils = require('common.utils')

local default_intents = {
  ['$primary'] = '#b39475',
  ['$secondary'] = '#abacb0',
  ['$success'] = '#27ae60',
  ['$danger'] = '#9f1600',
  ['$warning'] = '#b06601',
  ['$info'] = '#3498db',
  ['$dark'] = '#2c3e50',
  ['$light'] = '#2c3e50',
  ['$link'] = '#2c3e50',
  ['$none'] = 'transparent',
  ['$primary_light'] = CommonUtils.HexToRgba('#b39475', '.6'),
  ['$secondary_light'] = CommonUtils.HexToRgba('#abacb0', '.6'),
  ['$success_light'] = CommonUtils.HexToRgba('#27ae60', '.6'),
  ['$danger_light'] = CommonUtils.HexToRgba('#9f1600', '.6'),
  ['$warning_light'] = CommonUtils.HexToRgba('#b06601', '.6'),
  ['$info_light'] = CommonUtils.HexToRgba('#3498db', '.6'),
  ['$dark_light'] = CommonUtils.HexToRgba('#2c3e50', '.6'),
  ['$light_light'] = CommonUtils.HexToRgba('#2c3e50', '.6'),
  ['$link_light'] = CommonUtils.HexToRgba('#2c3e50', '.6'),
}

function GetIntents()
  local intents = 'CommonUtils'
  for key, value in pairs(default_intents) do
    intents = intents .. string.format('$%s: %s;\n', key, value)
  end
  return intents
end

return {
  default_intents = default_intents,
  GetIntents = GetIntents,
}