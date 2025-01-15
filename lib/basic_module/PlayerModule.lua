--- PlayerModule.lua
--- Created by dreamness
--- DateTime: 8/10/2024 10:58 PM
---

--- 玩家模块
PlayerModule = {}

--- 获取玩家名字, 不能在第一帧调用
--- @param player_str_or_unit_table SystemUnitTable|playerEnum|PlayerStrEnum
--- @return PlayerEnum
PlayerModule.get_player_name = function(player_str_or_unit_table)
    return ObjectPlayerScriptName(player_str_or_unit_table)
end



-- TODO: test, package
--- 玩家的起始位置是否是xx [79]
--- @param player_name PlayerEnum
--- @param start_pos number 起始位置编号
--- @return boolean
PlayerModule.is_start_pos = function(player_name, start_pos)
    if type(player_name) ~= "string" then
        LoggerModule.error("PlayerModule.is_start_pos", "player_name must be a string")
        return nil
    end
    if type(start_pos) ~= "number" then
        LoggerModule.error("PlayerModule.is_start_pos", "start_pos must be a number")
        return nil
    end
    return GameModule.from_ra3_boolean(EvaluateCondition("START_POSITION_IS", player_name, start_pos))
end


-- TODO: test, package
--- 获取玩家数 [114]
--- @return number
PlayerModule.get_player_cnt = function()
    for i = 0, 10 do
        if EvaluateCondition("COMPARE_NUM_PLAYERS_IN_GAME", '==', i) then
            return i
        end
    end
    return nil
end

--- 获取玩家派系(国家) [153]
--- @param player_name PlayerEnum
--- @return FactionEnum
PlayerModule.get_player_faction = function(player_name)
    LoggerModule.debug('PlayerModule.get_player_faction', 'player_name: ' .. tostring(player_name))
    if type(player_name) ~= "string" then
        LoggerModule.error("PlayerModule.get_player_faction", "player_name must be a string")
        return nil
    end
    if EvaluateCondition("PLAYER_HAS_PLAYER_TECH", player_name, "PlayerTech_Allied") then
        return FactionEnum.ALLIED
    elseif EvaluateCondition("PLAYER_HAS_PLAYER_TECH", player_name, "PlayerTech_Soviet") then
        return FactionEnum.SOVIET
    elseif EvaluateCondition("PLAYER_HAS_PLAYER_TECH", player_name, "PlayerTech_Japan") then
        return FactionEnum.JAPAN
    elseif EvaluateCondition("PLAYER_HAS_PLAYER_TECH", player_name, "PlayerTech_Celestial") then
        return FactionEnum.CELESTIAL
    end
    return nil
end

--- 覆盖玩家的协议面板
--- @param player_name PlayerEnum 玩家名
--- @param faction_name FactionEnum
PlayerModule.set_player_protocol_tech_faction = function(player_name, faction_name)
    if type(player_name) ~= "string" then
        LoggerModule.error("PlayerModule.set_player_protocol_tech_faction", "player_name must be a string")
    end
    if type(faction_name) ~= "string" then
        LoggerModule.error("PlayerModule.set_player_protocol_tech_faction", "faction_name must be a string")
    end
    ProtocolModule.set_player_protocol_tech_faction(player_name, faction_name)
end


--- 杀死玩家所有单位 (69)
--- @param player_name PlayerEnum
PlayerModule.kill_player_everything = function(player_name)
    if type(player_name) ~= "string" then
        LoggerModule.error("PlayerModule.kill_player_everything", "player_name must be a string")
        return
    end
    ExecuteAction("PLAYER_KILL", player_name)
end

-- TODO: test
--- 出售玩家所有单位 (70)
--- @param player_name PlayerEnum
PlayerModule.sell_player_everything = function(player_name)
    if type(player_name) ~= "string" then
        LoggerModule.error("PlayerModule.sell_player_everything", "player_name must be a string")
        return nil
    end
    ExecuteAction("PLAYER_SELL_EVERYTHING", player_name)
end

-- TODO: test
--- 获取玩家昵称
--- @param player_name PlayerEnum
--- @return string
PlayerModule.get_player_nickname = function(player_name)
    if type(player_name) ~= "string" then
        LoggerModule.error("PlayerModule.get_player_nickname", "player_name must be a string")
        return nil
    end
    return exGetPlayerNickNameByScriptName(player_name)
end

-- TODO: test
--- 获取ai经济作弊倍数   注意：1.0表示不指定（而非1倍）
--- @return number
PlayerModule.get_ai_cheat_multiplier = function()
    return exModeGetAICheatMultiplier()
end