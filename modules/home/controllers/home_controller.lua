local view          = require("modules.home.views.home_view")
local controller    = { }

function controller.index(self)
    return { render = view }
end

return controller