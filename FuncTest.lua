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