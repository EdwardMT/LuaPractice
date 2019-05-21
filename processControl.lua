-- Lua认为false和nil为假，true和非nil为真，所以0也是真！
if(0) then 
    print("0 is true")
end
    
local a = 100
if(10 == a) then
    print("a is 10")
elseif(20 == a) then
    print("a is 20")
else
    print("a is", a)
end