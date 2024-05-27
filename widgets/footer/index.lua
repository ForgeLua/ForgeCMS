---@diagnostic disable: undefined-global
local widget = require("lapis.html").Widget

return widget:extend(function(self)
  return footer({
    class = "pt-3 mt-4 text-body-secondary"
  }, string.format("%s %s", 'ForgeCMS ©', os.date('%Y'))
)
end)