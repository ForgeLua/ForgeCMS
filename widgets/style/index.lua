local CompileSCSSWithVariables = require("widgets.style.utils")

function Style()
  local css = CompileSCSSWithVariables('#3366ff', '#ff3366')
  return string.format([[
    <style>
      %s
    </style>
  ]], css)
end

return Style