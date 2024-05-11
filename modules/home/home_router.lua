local controller   = require("modules.home.controllers.home_controller")
local respond_to   = require("lapis.application").respond_to

return function(app)
    app:match( "/", respond_to({
        GET = controller.index,
    }))
end