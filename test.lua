-- function practice
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
