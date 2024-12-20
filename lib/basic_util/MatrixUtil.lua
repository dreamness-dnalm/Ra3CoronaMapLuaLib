--- MatrixUtil.lua
--- Created by dreamness
--- DateTime: 2024/12/3 9:11
---

--- @class Matrix 矩阵

function dot(m1, m2)
    local result = {}
    local m1_row = getn(m1)
    local m1_col = getn(m1[1])
    local m2_row = getn(m2)
    local m2_col = getn(m2[1])
    if m1_col ~= m2_row then
        LoggerModule.error("dot", "m1_col must be equal to m2_row")
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

function transpose(m)
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

function add(m1, m2)
    local result = {}
    local m1_row = getn(m1)
    local m1_col = getn(m1[1])
    local m2_row = getn(m2)
    local m2_col = getn(m2[1])
    if m1_row ~= m2_row or m1_col ~= m2_col then
        LoggerModule.error("add", "m1_row must be equal to m2_row and m1_col must be equal to m2_col")
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

function m_tostring(m)
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

function unit_matrix(dim)
    local m = {}
    for i = 1, dim do
        m[i] = {}
        for j = 1, dim do
            if i == j then
                m[i][j] = 1
            else
                m[i][j] = 0
            end
        end
    end
    return m
end