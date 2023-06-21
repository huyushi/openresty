local redis = require "resty.redis"
local red = redis:new()

red:set_timeout(1000)

local ok, err = red:connect("10.212.43.107", 6379)
if not ok then
    ngx.say("failed to connect to Redis: ", err)
    return
end

local api_key = ngx.req.get_headers()["X-API-KEY"]

if api_key == nil then
    ngx.status = ngx.HTTP_FORBIDDEN
    ngx.header.content_type = "text/plain"
    ngx.say("Missing API key")
    ngx.exit(ngx.HTTP_OK)
end

local res, err = red:get(api_key)
if res == ngx.null or tonumber(res) <= 0 then
    ngx.status = ngx.HTTP_FORBIDDEN
    ngx.header.content_type = "text/plain"
    ngx.say("Invalid API key")
    ngx.exit(ngx.HTTP_OK)
end