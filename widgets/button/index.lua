---@diagnostic disable: undefined-global
local widget = require("lapis.html").Widget

local widget_button = widget:extend(function(props)
  assert(props.label, "Label is required")
  assert(props.onclick, "Onclick is required")
  local class = "button "
  class = class .. (props.intent and "button-" .. props.intent .. " " or "button-primary ")
  class = class .. (props.size == 'small' and "button-small " or "button-large ")
  class = class .. (props.outline and "button-outline " or "")
  return button({
    type = "button",
    class = class,
    label = props.label,
    disabled = props.disabled,
    onclick = props.onclick
  }, string.format("%s", props.label))
end)

return widget_button