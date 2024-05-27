---@diagnostic disable: undefined-global
local widget = require("lapis.html").Widget

local widget_input_search = widget:extend(function(props)
  assert(props.placeholder, "Placeholder is required")
  assert(props.onsearch, "Onsearch is required")
  
  return input({
    type = "text",
    placeholder = props.placeholder,
    onsearch = props.onsearch
  })
end)

return widget_input_search
