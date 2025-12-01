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

--- 游戏结束, 显示胜利画面 (3)
GameModule.game_over_with_victory_screen = function()
    ExecuteAction("VICTORY")
end

--- 游戏结束, 显示失败画面 (4)
GameModule.game_over_with_defeat_screen = function()
    ExecuteAction("DEFEAT")
end

--- 游戏结束, 显示游戏结束画面 (223)
GameModule.game_over_with_game_over_screen = function()
    ExecuteAction("LOCALDEFEAT")
end


--- 将值转换为布尔值(仅用于ra3内部函数调用)
GameModule.to_ra3_boolean = function(value)
    if value then
        return true
    else
        return false
    end
end

GameModule.from_ra3_boolean = function(value)
    if value then
        return 1
    else
        return nil
    end
end

--- 启用/禁用脚本
--- @param script_name string
--- @param enable boolean
GameModule.enable_script = function(script_name, enable)
    if enable then
        exEnableWBScript(script_name)
    else
        exDisableWBScript(script_name)
    end
end


--- 获取上一次调用该函数到这次调用的时间间隔，单位是纳秒
--- @return number
GameModule.get_duration_from_last_call_nanosecond = function()
    return HighResolutionClock()
end

--- 获取上一次调用该函数到这次调用的时间间隔，单位是毫秒
--- @return number
GameModule.get_duration_from_last_call_millisecond = function()
    return GameModule.get_duration_from_last_call_nanosecond() / 1000000
end