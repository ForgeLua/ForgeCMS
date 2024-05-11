local view          = require("modules.error.views.error_view")
local controller    = { }

function controller.index(self)
    return { render = view }
end

return controller