local StyleUtils = require("widgets.style.utils")

function Style()
  local css = StyleUtils.CompileSCSSWithVariables()
  return string.format([[
    <style>
      %s
    </style>
  ]], css)
end

return Style