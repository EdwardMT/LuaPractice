-- 定义名为module的模块
moduleAndPakage = {}

-- 定义一个常量
moduleAndPakage.constant = "这是一个常量"

function moduleAndPakage.func()
    io.write("这是一个公有函数\n")
end

local function func1()
    print("这是一个私有函数")
end

function moduleAndPakage.func2()
    func1()
end

return moduleAndPakage
