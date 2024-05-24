local widget = require("lapis.html").Widget

local function validateProps(props)
  assert(props.class, "Class is required")
  assert(props.onclick, "Onclick function is required")
  assert(props.label, "Label is required")
end
return widget:extend(function(_, props)
  validateProps(props)
  return button({
    type="button",
    class = props.class,
    onclick = props.onclick,
    label = props.label
  }, string.format("%s", props.label))
end)