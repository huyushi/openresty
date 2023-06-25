-- rewrite.lua
-- 定义一个包含不同元素的表（数组）
local uris = {"/api/service1", "/api/service2"}
local uri = ngx.var.uri
-- 定义一个标志变量，表示当前请求的URL是否在表中
local found = false

-- 遍历表，检查值是否存在
for _, item in ipairs(uris) do
    if item == uri then
        found = true
        break
    end
end
if found == false then
    ngx.req.set_uri("/api/service1")
end