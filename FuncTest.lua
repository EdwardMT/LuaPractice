function max(num1, num2)
    if(num1 > num2) then
        return num1
    else
        return num2
    end
    return num1
end

print("max num is ", max(10, 5))

local myprint = function(param)
    print("my print func", param)
end

local function add(num1, num2, funcPrint)
    local result = num1 + num2
    funcPrint(result)
end

myprint(10)
-- 函数作为参数传递
add(2, 3, myprint)

-- 多个返回值
local function maximum(vec)
    local mi = 1;
    local m = vec[mi]
    for i, val in pairs(vec) do
        if val > m then
            mi = i
            m = val
        end
    end

    return m, mi
end

print(maximum({8, 10, 23, 12, 5}))

-- 可变参数
local function average(...)
    local result = 0
    local arg={...}
    for i,v in pairs(arg) do
        result = result + v
    end

    print("total args num is "..#arg)
    return result / #arg
end
print("average is", average(10,5,3,4,5,6))

-- select func
do
    local function foo(...)
        for i = 1, select("#", ...) do  -- 返回{...}的参数个数
            local arg = select(i, ...)  -- 返回第i个参数
            print("arg", arg)
        end
    end

    foo(2,3,4,5)
end

print(string.format("%q", "one\ntwo"))

-- 多维数组
do
    local array = {}
    local maxRows = 3
    local maxCols = 3
    for row = 1, maxRows do
        for col = 1, maxCols do
            array[row * maxCols + col] = row * col
        end
    end
    
    for row = 1, maxRows do
        for col = 1, maxCols do
            print(array[row * maxCols + col])
        end
    end
    
    for i,v in pairs(array) do
        print(i,v)
    end 
end

-- 无状态迭代器
do
    local function square(itrMaxCount, curNumber)
        if curNumber < itrMaxCount then
            curNumber = curNumber + 1
            return curNumber, curNumber * curNumber
        end
    end

    for i, n in square,3,0 do
        print(i, n)
    end
end