-- api_gateway.lua
local http = require "resty.http"

local function proxy_request(backend_url)
    local httpc = http.new()
    local res, err = httpc:request_uri(backend_url, {
        method = ngx.req.get_method(),
        body = ngx.req.get_body_data(),
        headers = ngx.req.get_headers(),
        query = ngx.req.get_uri_args(),
    })

    if not res then
        ngx.status = ngx.HTTP_BAD_GATEWAY
        ngx.say("Failed to request backend: ", err)
        return
    end

    ngx.status = res.status
    for k, v in pairs(res.headers) do
        ngx.header[k] = v
    end
    ngx.say(res.body)
end

local path = ngx.var.uri

-- 负载均衡
if path:find("^/api/service1") then
    proxy_request("http://10.212.43.107:5000" .. path)
elseif path:find("^/api/service2") then
    proxy_request("http://10.212.43.107:5001" .. path)
else
    ngx.status = ngx.HTTP_NOT_FOUND
    ngx.say("API not found")
end