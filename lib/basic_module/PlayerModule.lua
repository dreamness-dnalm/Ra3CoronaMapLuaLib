--- PlayerModule.lua
--- Created by dreamness
--- DateTime: 8/10/2024 10:58 PM
---

--- 玩家模块
PlayerModule = {}

-- TODO: test
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
    return EvaluateCondition("START_POSITION_IS", player_name, start_pos)
end


-- TODO: test, package
--- 是否允许玩家建造建筑 (59)/(56)
--- @param player_name PlayerEnum
--- @param is_allowed boolean
PlayerModule.allow_build_building = function(player_name, is_allowed)
    if type(player_name) ~= "string" then
        LoggerModule.error("PlayerModule.allow_build_building", "player_name must be a string")
    end
    if is_allowed then
        ExecuteAction("PLAYER_ENABLE_BASE_CONSTRUCTION", player_name)
    else
        ExecuteAction("PLAYER_DISABLE_BASE_CONSTRUCTION", player_name)
    end
end

-- TODO: test, package
--- 是否允许玩家建造单位 (61)/(58)
--- @param player_name PlayerEnum
--- @param is_allow boolean
PlayerModule.allow_build_unit = function(player_name, is_allow)
    if type(player_name) ~= "string" then
        LoggerModule.error("PlayerModule.allow_build_unit", "player_name must be a string")
    end
    if is_allow then
        ExecuteAction("PLAYER_ENABLE_UNIT_CONSTRUCTION", player_name)
    else
        ExecuteAction("PLAYER_DISABLE_UNIT_CONSTRUCTION", player_name)
    end
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

-- TODO: package
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

-- TODO: test
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