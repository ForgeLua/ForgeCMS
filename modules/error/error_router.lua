local controller   = require("modules.error.controllers.error_controller")
local view         = require('modules.error.views.error_view')
local respond_to   = require("lapis.application").respond_to

return function(app)
    app:match( "/error", respond_to({
        GET = controller.index,
    }))
    
    app.handle_404 = function (self)
        self.data = { code = 404 }
        return { render = view }
    end
    
    app.handle_500 = function (self)
        self.data = { code = 500 }
        return { render = view }
    end
end