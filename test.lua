-- function practice
--[=[
function factorial(n)
    if 0 == n then
        return 1
    else
        return n * factorial(n - 1)
    end
end

print(factorial(5))

func = factorial
print(func(5))
]=]

-- anonymous function
function testFunc(tab, func)
    for k, v in pairs(tab) do
        print(func(k,v))
    end
end

tab = {key1="val1", key2 = "val2"};
testFunc(tab,
    function(k, v)
        return k.."="..v;
    end
);
