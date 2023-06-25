```
cd openresty
docker-compose up --build
#ps:把nginx.conf, access.lua里面的flask app和redis的Host换成宿主机的ip


init_by_lua_file：在Nginx主进程初始化时执行Lua文件中的代码。
init_worker_by_lua_file：在Nginx工作进程初始化时执行Lua文件中的代码。
set_by_lua_file：使用Lua文件中的代码动态设置Nginx变量。
rewrite_by_lua_file：在Nginx的rewrite阶段执行Lua文件中的代码。
access_by_lua_file：在Nginx的access阶段执行Lua文件中的代码。
content_by_lua_file：在Nginx的content阶段执行Lua文件中的代码。
header_filter_by_lua_file：在Nginx的header过滤阶段执行Lua文件中的代码。
body_filter_by_lua_file：在Nginx的body过滤阶段执行Lua文件中的代码。
log_by_lua_file：在Nginx的log阶段执行Lua文件中的代码。
```

