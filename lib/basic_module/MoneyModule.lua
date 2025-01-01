--- MoneyModule.lua
--- Created by dreamness
--- DateTime: 12/30/2024 00:25 AM

--- 金钱模块
MoneyModule = {}

-- TODO: test, package
--- 获取玩家当前金钱
--- @param player_name PlayerEnum
--- @return number
MoneyModule.get_player_money = function(player_name)
    if type(player_name) ~= "string" then
        LoggerModule.error("MoneyModule.get_player_money", "player_name must be a string")
        return nil
    end
    return exPlayerGetCurrentMoney(player_name)
end

-- TODO: package
--- 增加玩家金钱 (129)
--- @param player_name PlayerEnum
--- @param money number 金钱, 负数表示减少
MoneyModule.add_player_money = function(player_name, money)
    if type(player_name) ~= "string" then
        LoggerModule.error("MoneyModule.add_player_money", "player_name must be a string")
    end
    if type(money) ~= "number" then
        LoggerModule.error("MoneyModule.add_player_money", "money must be a number")
    end
    ExecuteAction("PLAYER_GIVE_MONEY", player_name, money)
end



-- TODO: package
--- 设置玩家金钱 (128)
--- @param player_name PlayerEnum
--- @param money number 金钱
MoneyModule.set_player_money = function(player_name, money)
    if type(player_name) ~= "string" then
        LoggerModule.error("MoneyModule.set_player_money", "player_name must be a string")
    end
    if type(money) ~= "number" then
        LoggerModule.error("MoneyModule.set_player_money", "money must be a number")
    end
    ExecuteAction("PLAYER_SET_MONEY", player_name, money)
end