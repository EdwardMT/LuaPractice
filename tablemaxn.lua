-- 用于计算某表的最大键值，即表内元素的个数
tablemaxn = {}

function tablemaxn.table_maxn(t)
    local mn = 0
    for k, v in pairs(t) do
        if mn < k then
            mn = k
        end
    end
    return mn
end

return tablemaxn