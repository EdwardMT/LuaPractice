do
    local mytable = {}
    local mymetatable = {}
    
    -- 把mymetatable设置为mytable的元表
    setmetatable(mytable, mymetatable)
    -- mytable = setmetatable({},{}) 同样效果
    
    -- 返回mymetatable
    getmetatable(mytable)
end

-- __index元方法
do
    local other = {foo = 3}
    t = setmetatable({}, {__index = other})
    print(t.foo)
    print(t.bar)

    -- __index包含一个函数
    local mytable = setmetatable({key1 = "value1"},{
        __index = function(mytable, key)
            if key == "key2" then
                return "metatablevalue"
            else
                return nil
            end
        end
    })

    print(mytable.key1, mytable.key2, mytable.key3)
end

-- __newindex元方法
do 
    local mymetatable = {}
    local mytable = setmetatable({key1="value1"}, {__newindex=mymetatable})
    print(mytable.key1)

    mytable.newkey = "new value2"
    print(mytable.newkey, mymetatable.newkey)

    mytable.key1 = "new value1"
    print(mytable.key1, mymetatable.key1)

    local othertable = setmetatable({key1 = "value1"},{
        __newindex = function(othertable, key, value)
            rawset(othertable, key, "\""..value.."\"")
        end
    })

    othertable.key1 = "new value"
    othertable.key2 = 4
    print(othertable.key1, othertable.key2)
end

--[=[
    用于表的操作符有如下几种：
    __add，对应运算符“+”
    __sub，对应运算符“-”
    __mul，对应运算符“*”
    __div，对应运算符“/”
    __mod，对应运算符“%”
    __unm，对应运算符“-”
    __concat，对应运算符“..”
    __eq，对应运算符“==”
    __lt，对应运算符“<”
    __le，对应运算符“<=”
]=]
-- __add元方法，实现两表连接
do
    local maxn = require("tablemaxn") -- 引入tablemaxn模块
    local mytable = setmetatable({1,2,3}, {
        __add = function(mytable, newtable)
            for i = 1, maxn.table_maxn(newtable) do
                table.insert(mytable, maxn.table_maxn(mytable) + 1, newtable[i])
            end

            return mytable;
        end
    })

    local othertable = {4,5,6}
    mytable = mytable + othertable
    for k, v in pairs(mytable) do
        print(k, v)
    end
end

-- __call元方法
do
    local maxn = require("tablemaxn") -- 引入tablemaxn模块
    local mytable = setmetatable({10}, {
        __call = function(mytable, newtable)
            local sum = 0
            for i = 1, maxn.table_maxn(mytable) do
                sum = sum + mytable[i]
            end
            for i = 1, maxn.table_maxn(newtable) do
                sum = sum + newtable[i]
            end
            return sum
        end
    })

    local newtable = {10, 20, 30}
    print(mytable(newtable))
end

-- __tostring元方法
do
    local mytable = setmetatable({10, 20, 30}, {
        __tostring = function(mytable)
            local sum = 0
            for k, v in pairs(mytable) do
                sum = sum + v
            end

            return "the sum of the table is "..sum
        end
    })

    print(mytable)
end