return function()
  local style_utils = require('widgets.style.utils')
  local css = style_utils.compile_scss_with_variables()
  return string.format([[
    <style>
      %s
    </style>
  ]], css)
end