---@diagnostic disable: undefined-global
local widget = require("lapis.html").Widget

local widget_select = widget:extend(function(props)
  assert(props.options, "Options are required")
  local options = props.options
  local select_options = {}
  for _, option in ipairs(options) do
    table.insert(select_options, option)
  end
  return element('select', {
    class = "select-component",
    name = props.name,
    id = props.id
  }, function()
    for _, opt in ipairs(select_options) do
      option({
        value = opt.value
      }, opt.label)
    end
  end)
end)

return widget_select
