--- MoneyModule.lua
--- Created by dreamness
--- DateTime: 12/30/2024 00:25 AM

--- 金钱模块
MoneyModule = {}

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

--- 获取作弊金钱倍数
--- @return number
MoneyModule.get_cheat_multiplier = function()
    return exModeGetCheatMultiplier()
end


--- 获取单位造价
--- @param unit_table SystemUnitTable 单位table
--- @param producer_table SystemUnitTable 生产建筑table
--- @param custom_cost number 自定义造价
--- @return number 造价
MoneyModule.get_unit_money_value = function(unit_table, producer_table, custom_cost)
    if type(unit_table) ~= "table" then
        LoggerModule.error("MoneyModule.get_money_value", "unit_table must be a table")
        return nil
    end
    
    return ObjectGetValue(unit_table, producer_table, custom_cost)
end

-- TODO: with bug (函数有bug, 传Player_1等字符串返回0)
--- 获取玩家所有单位的造价
--- @param unit_table_or_player_string SystemUnitTable|string 单位table 或 玩家字符串 "<This Player>" / "<1st Human Player>" / "<1st Human Player's Enemies>"(复数的会把所有敌人的造价加起来)
--- @return number 造价
MoneyModule.get_player_all_units_money_value = function(unit_table_or_player_string)
    return GetPlayerAllUnitsValue(unit_table_or_player_string)
end

