--- StringUtil.lua
--- Created by dreamness
--- DateTime: 8/10/2024 6:58 PM
---

StringUtil = {}

--- 将字符串数组连接成一个字符串
--- @param strTbl string[] 字符串数组
--- @param sep string 分隔符
--- @return string
StringUtil.make_string = function(strTbl, sep)
    local str = ""
    for i = 1, getn(strTbl) do
        str = str .. strTbl[i]
        if i < getn(strTbl) then
            str = str .. sep
        end
    end
    return str
end

--- 分割字符串
--- @param str string 字符串
--- @param sep string 分隔符
--- @return string[] 子字符串列表, number 子字符串数量
StringUtil.split = function(str, sep)
    if sep == "" then
        -- 返回字符数组
        local ret = {}
        for i = 1, strlen(str) do
            tinsert(ret, strsub(str, i, i))
        end
        return ret, getn(ret)
    end
    local sepLen = strlen(sep)
    local ret = {}

    local startPos = 1
    local sepStartPos = strfind(str, sep, startPos, 1)
    repeat
        sepStartPos = strfind(str, sep, startPos, 1)
        if sepStartPos then
            tinsert(ret, strsub(str, startPos, sepStartPos - 1))
            startPos = sepStartPos + sepLen
        else
            tinsert(ret, strsub(str, startPos))
        end
    until sepStartPos == nil

    return ret, getn(ret)
end


--- 字符串左填充
--- @param str string 字符串
--- @param len number 长度
--- @param pad string 填充字符
StringUtil.LPad = function(str, len, pad)
    if pad == nil then
        pad = " "
    end
    local strLen = strlen(str)
    if strLen >= len then
        return str
    end
    return strrep(pad, len - strLen) .. str
end