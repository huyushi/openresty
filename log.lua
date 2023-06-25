-- log.lua
local log_data = {
    remote_addr = ngx.var.remote_addr,
    request_uri = ngx.var.request_uri,
    status = ngx.var.status,
    request_time = ngx.var.request_time
}

local log_json = require("cjson").encode(log_data)
ngx.log(ngx.INFO, log_json)
ngx.log(ngx.INFO, greeting)