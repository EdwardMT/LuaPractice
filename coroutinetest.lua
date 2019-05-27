do
    local function foo(a)
        print("foo func putput", a)
        return coroutine.yield(2 * a)
    end

    local co = coroutine.create(function (a,b)
        print("first coroutine output", a, b)
        local r = foo(a + 1)
        
        print("second coroutine ouput", r)
        local r, s = coroutine.yield(a + b, a - b)
        
        print("third coroutine ouput", r, s)
        return b, "coroutine dead"
    end)

    print("main", coroutine.resume(co, 1, 10))
    print("---------------")
    print("main", coroutine.resume(co, "r"))
    print("---------------")
    print("main", coroutine.resume(co, "x", "y"))
    print("---------------")
    print("main", coroutine.resume(co, "x", "y"))
end

do
    local newProductor
    local function receive()
        local status, value = coroutine.resume(newProductor)
        return value
    end

    local function send(x)
        coroutine.yield(x)
    end

    local function productor()
        local i = 0
        while true do
            i = i + 1
            send(i) -- send to consumer
            if 100 == i then
                break;
            end
        end
    end

    local function consumer()
        while true do
            local i = receive() -- receive from productor
            print(i)
            if 100 == i then
                break;
            end
        end
    end

    newProductor = coroutine.create(productor)
    consumer()

end
