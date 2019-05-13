a = 5
local b = 5

function joke()
    c = 5
    local d = 6
end

joke()
print(c,d)

do
    local a = 6
    b = 6
    print(a,b)
end

print(a,b)

-- exchange x and y
x,y = 5,6
print(x,y)
x,y = y,x
print(x,y)