---@diagnostic disable: undefined-global
local widget = require("lapis.html").Widget

local widget_input_password = widget:extend(function(props)
  assert(props.placeholder, "Placeholder is required")
  assert(props.oninput, "Oninput is required")
  
  return input({
    type = "password",
    placeholder = props.placeholder,
    oninput = props.oninput
  })
end)

return widget_input_password
