--- AllegianceModule.lua
--- Created by dreamness
--- DateTime: 12/18/2024 1:40 AM

--- 结盟模块
AllegianceModule = {}

--- @class AllegianceEnum
AllegianceEnum = {
    ENEMY = "Enemy",
    NEUTRAL = "Neutral",
    FRIEND = "Friend",
}

--- 设置玩家单向关系 (78)
--- @param player_name1 PlayerEnum 玩家1
--- @param player_name2 PlayerEnum 玩家2
--- @param relationship AllegianceEnum
AllegianceModule.set_allegiance_single_way = function(player_name1, player_name2, allegiance)
    if type(player_name1) ~= "string" then
        LoggerModule.error("AllegianceModule.set_allegiance_single_way", "player_name1 must be a string")
        return
    end
    if type(player_name2) ~= "string" then
        LoggerModule.error("AllegianceModule.set_allegiance_single_way", "player_name2 must be a string")
        return
    end
    if type(allegiance) ~= "string" then
        LoggerModule.error("AllegianceModule.set_allegiance_single_way", "allegiance must be a string")
        return
    end
    ExecuteAction("PLAYER_RELATES_PLAYER", player_name1, player_name2, allegiance)
end


--- 设置玩家双向关系
--- @param playerName1 PlayerEnum 玩家1
--- @param player_name2 PlayerEnum 玩家2
--- @param relationship AllegianceEnum
AllegianceModule.set_allegiance_both_way = function(player_name1, player_name2, allegiance)
    if type(player_name1) ~= "string" then
        LoggerModule.error("AllegianceModule.set_allegiance_both_way", "player_name1 must be a string")
        return
    end
    if type(player_name2) ~= "string" then
        LoggerModule.error("AllegianceModule.set_allegiance_both_way", "player_name2 must be a string")
        return
    end
    if type(allegiance) ~= "string" then
        LoggerModule.error("AllegianceModule.set_allegiance_both_way", "allegiance must be a string")
        return
    end
    AllegianceModule.set_allegiance_single_way(player_name1, player_name2, allegiance)
    AllegianceModule.set_allegiance_single_way(player_name2, player_name1, allegiance)
end