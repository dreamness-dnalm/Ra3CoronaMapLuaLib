--- RandomHelper.lua
--- Created by dreamness
--- DateTime: 10/18/2024 11:53 PM
---

--- 随机数帮助类
RandomHelper = {}

--- 获取一个0-1之间的随机浮点数
--- @return number
RandomHelper.random_float = function()
    return GetRandomNumber()
end

--- 获取一个min_num和max_num之间的随机浮点数, 左闭右开
--- @param min_num number 最小值, 包含
--- @param max_num number 最大值, 不包含
--- @return number
RandomHelper.randon_range_float = function(min_num, max_num)
    if type(min_num) ~= "number" or type(max_num) ~= "number" then
        LoggerModule.error("RandomHelper.rand_range_float", "min_num or max_num is not a number")
        return nil
    end
    return (max_num - min_num) * RandomHelper.random_float() + min_num
end

--- 获取一个min_num和max_num之间的随机整数, 左闭右开
--- @param min_num number 最小值, 包含
--- @param max_num number 最大值, 不包含
--- @return number
RandomHelper.random_range_int = function(min_num, max_num)
    if type(min_num) ~= "number" or type(max_num) ~= "number" then
        LoggerModule.error("RandomHelper.rand_range_int", "min_num or max_num is not a number")
        return nil
    end
    return floor(RandomHelper.randon_range_float(min_num, max_num))
end

--- 从数组中随机选择一个元素
--- @param array table
--- @return any
RandomHelper.choice = function(array)
    if type(array) ~= "table" then
        LoggerModule.error("RandomHelper.choice", "array must be a table")
        return nil
    end
    local len = getn(array)
    if len == 0 then
        LoggerModule.warn("RandomHelper.choice", "array is empty")
        return nil
    end
    local index = RandomHelper.random_range_int(1, len + 1)
    return array[index]
end

--- 从数组中随机选择N个不相同的元素
--- @param array table
--- @param n number
--- @return table
RandomHelper.choices = function(array, n)
    if type(array) ~= "table" then
        LoggerModule.error("RandomHelper.choices", "array must be a table")
        return nil
    end
    local len = getn(array)
    if len == 0 then
        LoggerModule.warn("RandomHelper.choices", "array is empty")
        return {}
    end
    if n > len then
        LoggerModule.warn("RandomHelper.choices", "n is greater than the length of the array")
        n = len
    end
    local result = {}
    local tmp = TableUtil.array_shallow_copy(array)
    for i = 1, n do
        local index = RandomHelper.random_range_int(1, getn(tmp))
        tinsert(result, tmp[index])
        tremove(tmp, index)
    end
    return result
end


--- 将数组打乱, 返回新数组; 不会更改原数组
--- @param array table
--- @return table
RandomHelper.shuffle = function(array)
    if type(array) ~= "table" then
        LoggerModule.error("RandomHelper.shuffle", "array must be a table")
        return nil
    end
    local len = getn(array)
    if len == 0 then
        LoggerModule.warn("RandomHelper.shuffle", "array is empty")
        return {}
    end
    local result = TableUtil.array_shallow_copy(array)
    for i = 1, len do
        local index = RandomHelper.random_range_int(1, len + 1)
        result[i], result[index] = result[index], result[i]
    end
    return result
end