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

-- TODO: test
--- 游戏结束, 显示胜利画面 (3)
GameModule.game_over_with_victory_screen = function()
    ExecuteAction("VICTORY")
end

-- TODO: test
--- 游戏结束, 显示失败画面 (4)
GameModule.game_over_with_defeat_screen = function()
    ExecuteAction("DEFEAT")
end

-- TODO: test
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