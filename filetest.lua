do
    -- 以只读方式打开文件
    local file = io.open("test.lua", "r")
    -- 设置默认输入文件为test.lua
    io.input(file)
    print(io.read())
    io.close(file)

    -- 以追加方式打开只写文件
    local ofile = io.open("test.lua", "a")
    ofile:write("-- add by I/O append")
    ofile:close()
end