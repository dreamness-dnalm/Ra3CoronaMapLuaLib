--- MathUtil.lua
--- Created by dreamness
--- DateTime: 9/15/2024 8:18 PM
---

--- 基础数学库
MathUtil = {}

--- sin
--- @param angle number
--- @return number
MathUtil.sin = function(angle)
    return floor(sin(angle) * 10000000) / 10000000
end

--- cos
--- @param angle number
--- @return number
MathUtil.cos = function(angle)
    return floor(cos(angle) * 10000000) / 10000000
end

--- tan
--- @param angle number
--- @return number
MathUtil.tan = function(angle)
    return floor(tan(angle) * 10000000) / 10000000
end

--- asin
--- @param value number
--- @return number
MathUtil.asin = function(value)
    return floor(asin(value) * 10000000) / 10000000
end

--- acos
--- @param value number
--- @return number
MathUtil.acos = function(value)
    return floor(acos(value) * 10000000) / 10000000
end

--- atan
--- @param value number
--- @return number
MathUtil.atan = function(value)
    return floor(atan(value) * 10000000) / 10000000
end

--- atan2
--- @param y number
--- @param x number
--- @return number
MathUtil.atan2 = function(y, x)
    return floor(atan2(y, x) * 10000000) / 10000000
end

--- 十进制转十六进制
--- @param dec number 十进制数
--- @return string 十六进制
MathUtil.dec_to_hex = function (dec)
    return format('%x', dec)
end

--- 十六进制转十进制
--- @param hex string 十六进制
--- @return number 十进制数
MathUtil.hex_to_dec = function(hex)
    return tonumber(hex, 16)
end

--- 判断是否为整数
--- @param n number
--- @return boolean
MathUtil.is_integer = function(n)
    if type(n) ~= "number" then
        return nil
    end
    if n > 0 then
        return floor(n) == n
    else
        return ceil(n) == n
    end
end

--- 判断是否在误差范围内
--- @param n number
--- @param target number
--- @param tolerate number
--- @return boolean
MathUtil.is_in_error_range = function(n, target, tolerate)
    if type(n) ~= "number" then
        LoggerModule.error("MathUtil.is_in_error_range", "n should be a number")
        return nil
    end

    if type(target) ~= "number" then
        LoggerModule.error("MathUtil.is_in_error_range", "target should be a number")
        return nil
    end

    if type(tolerate) ~= "number" then
        LoggerModule.error("MathUtil.is_in_error_range", "tolerate should be a number")
        return nil
    end
    return abs(n - target) < abs(tolerate)
end