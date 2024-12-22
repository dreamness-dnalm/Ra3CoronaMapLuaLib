--- GameModule.lua
--- Created by dreamness
--- DateTime: 12/15/2024 11:20 AM

--- 和整个游戏流程和系统相关的函数
GameModule = {}

--- 获取当前帧序号
--- @return number
GameModule.get_frame_number = function()
    return GetFrame()
end

--- 获取字符串的快速哈希值
--- @param content string
--- @return number
GameModule.get_string_fast_hash = function(content)
    return FastHash(content)
end