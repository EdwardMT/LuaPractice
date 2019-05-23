package.path = "?;?.lua;"..package.path
print(package.path)

local module = require("moduleAndPakage")

print(module.constant)
module.func2()