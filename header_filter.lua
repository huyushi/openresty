-- header_filter.lua
local content_type = ngx.header["Content-Type"]

if content_type and content_type:find("text/html") then
    ngx.header["Cache-Control"] = "no-cache, no-store, must-revalidate"
    ngx.header["Pragma"] = "no-cache"
    ngx.header["Expires"] = "0"
end