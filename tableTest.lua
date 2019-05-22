do
    local mytable = {}
    print("mytable type is", type(mytable))

    mytable[1] = "Lua"
    mytable["wow"] = "before"
    for k,v in pairs(mytable) do
        print(k, v)
    end

    anothertable = mytable;
    for k,v in pairs(anothertable) do
        print(k, v)
    end

    anothertable["wow"] = "after"
    print("mytable[\"wow\"]=", mytable["wow"])

    anothertable = nil
    print("anothertable is", anothertable)
    print("mytable[\"wow\"]=", mytable["wow"])
    mytable = nil
    print("mytable is", mytable)
end

do
    fruits = {"banana", "orange", "apple"}
    print("after concatenate is ", table.concat(fruits))
    print("after concatenate is ", table.concat(fruits, "-"))
    print("after concatenate is ", table.concat(fruits, "-", 2, 3))

    table.insert(fruits, "mango")
    print("fruits[4]=", fruits[4])
    table.insert(fruits, 2, "grapes")
    print("fruits[2]=", fruits[2])
    table.remove(fruits)
    print("fruits[5]=", fruits[5])

    print("before sort:")
    for k, v in pairs(fruits) do
        print(k, v)
    end

    table.sort(fruits)
    print("after sort:")
    for k, v in pairs(fruits) do
        print(k, v)
    end
end