--- MatrixUtil.lua
--- Created by dreamness
--- DateTime: 2024/12/3 9:11
---

--- @class Matrix 矩阵

--- @class Vector 向量

--- 矩阵工具类
MatrixUtil = {}

--- 矩阵点乘
--- @param ... Matrix 矩阵
--- @return Matrix
MatrixUtil.dot = function(...)
    if getn(arg) == 0 then
        LoggerModule.error("MatrixUtil.dot", "at least 2 matrix")
        return nil
    end

    local result = arg[1]
    for i = 2, getn(arg) do
        result = MatrixUtil.__dot2(result, arg[i])
    end
    return result
end

--- 矩阵点乘
--- @param m1 Matrix 矩阵1
--- @param m2 Matrix 矩阵2
--- @return Matrix
MatrixUtil.__dot2 = function(m1, m2)
    local result = {}
    local m1_row = getn(m1)
    local m1_col = getn(m1[1])
    local m2_row = getn(m2)
    local m2_col = getn(m2[1])
    if m1_col ~= m2_row then
        LoggerModule.error("MatrixUtil.__dot2", "m1_col must be equal to m2_row")
        return
    end
    for i = 1, m1_row do
        result[i] = {}
        for j = 1, m2_col do
            result[i][j] = 0
            for k = 1, m1_col do
                result[i][j] = result[i][j] + m1[i][k] * m2[k][j]
            end
        end
    end
    return result
end

-- TODO: test
--- 转置矩阵
--- @param m Matrix 矩阵
--- @return Matrix
MatrixUtil.transpose = function(m)
    local result = {}
    local row = getn(m)
    local col = getn(m[1])
    for i = 1, col do
        result[i] = {}
        for j = 1, row do
            result[i][j] = m[j][i]
        end
    end
    return result
end


-- TODO: test
--- 矩阵相加
--- @param ... Matrix 矩阵
--- @return Matrix
MatrixUtil.add = function(...)
    if getn(arg) == 0 then
        LoggerModule.error("MatrixUtil.add", "at least 2 matrix")
        return nil
    end

    local result = arg[1]
    for i = 2, getn(arg) do
        result = MatrixUtil.__add2(result, arg[i])
    end
    return result
end


-- TODO: test
--- 矩阵相加
--- @param m1 Matrix 矩阵1
--- @param m2 Matrix 矩阵2
--- @return Matrix
MatrixUtil.__add2 = function(m1, m2)
    local result = {}
    local m1_row = getn(m1)
    local m1_col = getn(m1[1])
    local m2_row = getn(m2)
    local m2_col = getn(m2[1])
    if m1_row ~= m2_row or m1_col ~= m2_col then
        LoggerModule.error("MatrixUtil.add", "m1_row must be equal to m2_row and m1_col must be equal to m2_col")
        return
    end
    for i = 1, m1_row do
        result[i] = {}
        for j = 1, m1_col do
            result[i][j] = m1[i][j] + m2[i][j]
        end
    end
    return result
end

-- TODO: test
--- 矩阵转字符串, 用于日志输出
--- @param m Matrix 矩阵
--- @return string
MatrixUtil.m_tostring = function(m)
    local s = '[\n'
    for i = 1, getn(m) do
        s = s .. '['
        for j = 1, getn(m[i]) do
            s = s .. m[i][j] .. ','
        end
        s = s .. '],'
    end
    s = s .. '\n]'
    return s
end

-- TODO: test
--- 获取单位矩阵
--- @param rank number 秩
--- @return Matrix
MatrixUtil.unit_matrix = function(rank)
    if type(rank) ~= "number" then
        LoggerModule.error("unit_matrix", "rank must be a number")
        return nil
    end
    if rank <= 0 then
        LoggerModule.error("unit_matrix", "rank must be greater than 0")
        return nil
    end
    local m = {}
    for i = 1, rank do
        m[i] = {}
        for j = 1, rank do
            if i == j then
                m[i][j] = 1
            else
                m[i][j] = 0
            end
        end
    end
    return m
end

--- 矩阵乘法
--- @param m Matrix 矩阵
--- @param num number 数字
--- @return Matrix
MatrixUtil.multiply = function(m, num)
    if type(m) ~= "table" then
        LoggerModule.error("MatrixUtil.multiply", "m must be table")
        return nil
    end
    if type(num) ~= "number" then
        LoggerModule.error("MatrixUtil.multiply", "num must be number")
        return nil
    end
    local result = {}
    for i = 1, getn(m) do
        result[i] = {}
        for j = 1, getn(m[i]) do
            result[i][j] = m[i][j] * num
        end
    end
    return result
end