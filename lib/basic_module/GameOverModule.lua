--- GameOverModule.lua
--- Created by dreamness
--- DateTime: 12/15/2024 12:46 AM

--- 游戏结束模块
GameOverModule = {}

-- TODO: test
--- 杀死玩家所有单位 (69)
--- @param player_name PlayerEnum
GameOverModule.kill_player_everything = function(player_name)
    if type(player_name) ~= "string" then
        LoggerModule.error("GameOverModule.kill_player_everything", "player_name must be a string")
        return
    end
    ExecuteAction("PLAYER_KILL", player_name)
end

-- TODO: test
--- 出售玩家所有单位 (70)
--- @param player_name PlayerEnum
GameOverModule.sell_player_everything = function(player_name)
    if type(player_name) ~= "string" then
        LoggerModule.error("GameOverModule.sell_player_everything", "player_name must be a string")
        return nil
    end
    ExecuteAction("PLAYER_SELL_EVERYTHING", player_name)
end