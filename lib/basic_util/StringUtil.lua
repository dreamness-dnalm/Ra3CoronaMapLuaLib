--- StringUtil.lua
--- Created by dreamness
--- DateTime: 8/10/2024 6:58 PM
---

StringUtil = {}

--- 将字符串数组连接成一个字符串
--- @param strTbl table 字符串数组
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

-- TODO: test
--- 分割字符串
--- @param str string 字符串
--- @param sep string 分隔符
--- @return table,number subStrs,subStrsCount
StringUtil.split = function(str, sep)
    if str == "" then
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