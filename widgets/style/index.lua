return function()
  local styleUtils = require('widgets.style.utils')
  local css = styleUtils.compileSCSSWithVariables()
  return string.format([[
    <style>
      %s
    </style>
  ]], css)
end