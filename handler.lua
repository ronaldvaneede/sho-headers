local BasePlugin = require "kong.plugins.base_plugin"
local req_set_header = ngx.req.set_header

local ShoHeadersHandler = BasePlugin:extend()

CustomHandler.VERSION  = "1.0.0"
CustomHandler.PRIORITY = 500

function ShoHeadersHandler:new()
  ShoHeadersHandler.super.new(self, "sho-headers")
end

function ShoHeadersHandler:access(conf)
  JwtClaimsHeadersHandler.super.access(self)

  req_set_header("x-forwarded-host", conf.host)
  req_set_header("x-forwarded-port", conf.port)
  req_set_header("x-forwarded-proto", conf.proto)  
end

return ShoHeadersHandler