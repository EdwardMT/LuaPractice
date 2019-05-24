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