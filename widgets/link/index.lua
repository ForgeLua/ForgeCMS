---@diagnostic disable: undefined-global
local widget = require("lapis.html").Widget

local widget_link = widget:extend(function(props)
  assert(props.href, "Href is required")
  assert(props.label, "Label is required")
  return a({
    class = "font-bliz-Medium-white",
    href = props.href,
    label = props.label
  }, string.format("%s", props.label))
end)

return widget_link
