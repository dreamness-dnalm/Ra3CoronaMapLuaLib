--- VectorUtil.lua
--- Created by dreamness
--- DateTime: 12/22/2024 08:33 PM

--- @class Vector 向量

--- 向量工具类
VectorUtil = {}

--- 向量的模
--- @param vec Vector 向量
--- @return number
VectorUtil.norm = function(vec)
    local sum = 0
    for i = 1, getn(vec) do
        sum = sum + vec[i] * vec[i]
    end
    return sqrt(sum)
end

--- 向量转为单位向量
--- @param vec Vector 向量
--- @return Vector
VectorUtil.to_unit_vec = function(vec)
    local n = VectorUtil.norm(vec)
    local result = {}
    for i = 1, getn(vec) do
        result[i] = vec[i] / n
    end
    return result
end

--- 向量点乘
--- @param vec1 Vector 向量1
--- @param vec2 Vector 向量2
--- @return number
VectorUtil.dot = function(vec1, vec2)
    if type(vec1) ~= "table" or type(vec2) ~= "table" then
        LoggerModule.error("VectorUtil.dot", "vec1 and vec2 must be table")
        return nil
    end
    if getn(vec1) ~= getn(vec2) then
        LoggerModule.error("VectorUtil.dot", "vec1 and vec2 must have the same length")
        return nil
    end
    local sum = 0
    for i = 1, getn(vec1) do
        sum = sum + vec1[i] * vec2[i]
    end
    return sum
end

--- 获取向量夹角
--- @param vec1 Vector 向量1
--- @param vec2 Vector 向量2
--- @return number 角度
VectorUtil.angle = function(vec1, vec2)
    local dot = VectorUtil.dot(vec1, vec2)
    local n1 = VectorUtil.norm(vec1)
    local n2 = VectorUtil.norm(vec2)
    return MathUtil.acos(dot / (n1 * n2))
end

--- 3维向量叉乘
--- @param vec1 Vector 向量1
--- @param vec2 Vector 向量2
--- @return Vector
VectorUtil.cross3 = function(vec1, vec2)
    if type(vec1) ~= "table" or type(vec2) ~= "table" then
        LoggerModule.error("VectorUtil.cross3", "vec1 and vec2 must be table")
        return nil
    end
    if getn(vec1) ~= 3 or getn(vec2) ~= 3 then
        LoggerModule.error("VectorUtil.cross3", "vec1 and vec2 must have length 3")
        return nil
    end
    return {
        vec1[2] * vec2[3] - vec1[3] * vec2[2],
        vec1[3] * vec2[1] - vec1[1] * vec2[3],
        vec1[1] * vec2[2] - vec1[2] * vec2[1]
    }
end

--- 2维向量叉乘
--- @param vec1 Vector 向量1
--- @param vec2 Vector 向量2
--- @return number
VectorUtil.cross2 = function(vec1, vec2)
    if type(vec1) ~= "table" or type(vec2) ~= "table" then
        LoggerModule.error("VectorUtil.cross2", "vec1 and vec2 must be table")
        return nil
    end
    if getn(vec1) ~= 2 or getn(vec2) ~= 2 then
        LoggerModule.error("VectorUtil.cross2", "vec1 and vec2 must have length 2")
        return nil
    end
    return vec1[1] * vec2[2] - vec1[2] * vec2[1]
end

--- 向量乘法
--- @param vec Vector 向量
--- @param num number 数字
--- @return Vector
VectorUtil.multiply = function(vec, num)
    if type(vec) ~= "table" then
        LoggerModule.error("VectorUtil.multiply", "vec must be table")
        return nil
    end
    if type(num) ~= "number" then
        LoggerModule.error("VectorUtil.multiply", "num must be number")
        return nil
    end
    local result = {}
    for i = 1, getn(vec) do
        result[i] = vec[i] * num
    end
    return result
end

--- 向量加法
--- @param vec1 Vector 向量1
--- @param vec2 Vector 向量2
--- @return Vector
VectorUtil.add = function(vec1, vec2)
    if type(vec1) ~= "table" or type(vec2) ~= "table" then
        LoggerModule.error("VectorUtil.add", "vec1 and vec2 must be table")
        return nil
    end
    if getn(vec1) ~= getn(vec2) then
        LoggerModule.error("VectorUtil.add", "vec1 and vec2 must have the same length")
        return nil
    end
    local result = {}
    for i = 1, getn(vec1) do
        result[i] = vec1[i] + vec2[i]
    end
    return result
end

--- 向量减法
--- @param vec1 Vector 向量1
--- @param vec2 Vector 向量2
--- @return Vector
VectorUtil.subtract = function(vec1, vec2)
    if type(vec1) ~= "table" or type(vec2) ~= "table" then
        LoggerModule.error("VectorUtil.subtract", "vec1 and vec2 must be table")
        return nil
    end
    if getn(vec1) ~= getn(vec2) then
        LoggerModule.error("VectorUtil.subtract", "vec1 and vec2 must have the same length")
        return nil
    end
    return VectorUtil.add(vec1, VectorUtil.multiply(vec2, -1))
end

--- 向量转字符串, 用于日志输出
--- @param vec Vector 向量
--- @return string
VectorUtil.to_string = function(vec)
    if type(vec) ~= "table" then
        LoggerModule.error("VectorUtil.to_string", "vec must be table")
        return nil
    end
    return TableUtil.arr_to_string(vec)
    
end

--- 两点之间的距离
--- @param p1 Vector 点1
--- @param p2 Vector 点2
--- @return number
VectorUtil.point_distance = function(p1, p2)
    return VectorUtil.norm(VectorUtil.subtract(p1, p2))
end

--- 复制向量
--- @param vec Vector 向量
--- @return Vector
VectorUtil.copy = function(vec)
    return TableUtil.array_shallow_copy(vec)
end