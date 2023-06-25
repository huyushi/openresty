-- body_filter.lua
local function replace_domain(chunk)
    local original_domain = "Flask"
    local new_domain = "World"
    local modified_chunk = chunk:gsub(original_domain, new_domain)
    return modified_chunk
end

if not ngx.ctx.buffer then
    ngx.ctx.buffer = ""
end

local chunk = ngx.arg[1]
local is_last_chunk = ngx.arg[2]

ngx.ctx.buffer = ngx.ctx.buffer .. chunk

if is_last_chunk then
    local modified_buffer = replace_domain(ngx.ctx.buffer)
    ngx.arg[1] = modified_buffer
    ngx.ctx.buffer = nil
else
    ngx.arg[1] = ""
end



