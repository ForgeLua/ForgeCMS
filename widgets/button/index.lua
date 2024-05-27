---@diagnostic disable: undefined-global
local widget = require("lapis.html").Widget

local widget_button = widget:extend(function(props)
  assert(props.label, "Label is required")
  assert(props.onclick, "Onclick is required")
  local class = "button "
  class = class .. (props.intent and props.intent == 'primary' and "button-primary " or "")
  class = class .. (props.intent and props.intent == 'secondary' and "button-secondary " or "")
  class = class .. (props.size and props.size == 'small' and "btn-sm " or "")
  class = class .. (props.size and props.size == 'large' and "btn-lg " or "")
  return button({
    type = "button",
    class = class,
    label = props.label,
    onclick = props.onclick
  }, string.format("%s", props.label))
end)

return widget_button