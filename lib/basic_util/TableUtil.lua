--- TableUtil.lua
--- Created by dreamness
--- DateTime: 10/13/2024 11:03 PM
---

--- table工具类
TableUtil = {}

--- 根据索引获取table的值
--- @param t table
--- @param key_or_index string|number
--- @param default_value any
TableUtil.get_or_default = function(t, key_or_index, default_value)
    return t[key_or_index] or default_value
end

-- TODO: test
--- table转字符串, 用于输出日志
--- @param t table
--- @return string
TableUtil.to_string = function(t)
    local str = '{'
    for k, v in t do
        str = str .. tostring(k) .. '=' .. toString(v) .. ','
    end
    str = str .. '}'
    str = str .. '['
    for i = 1, getn(t) do
        str = str .. toString(t[i]) .. ','
    end
    str = str .. ']'
    return str
end

-- TODO: test
--- 判断元素是否在数组中
--- @param t table
--- @param ele any
--- @return boolean
TableUtil.is_ele_in_array = function(t, ele)
    for i = 1, getn(t) do
        if t[i] == ele then
            return 1
        end
    end
    return nil
end

--- TODO: test
--- 数组浅拷贝
--- @param t table
--- @return table
TableUtil.array_shallow_copy = function(t)
    local new_table = {}
    local len = getn(t)
    for i = 1, len do
        new_table[i] = t[i]
    end
    return new_table
end

-- TODO: test
--- 字典浅拷贝
--- @param t table
--- @return table
TableUtil.dict_shallow_copy = function(t)
    local new_table = {}
    for k, v in t do
        new_table[k] = v
    end
    return new_table
end

