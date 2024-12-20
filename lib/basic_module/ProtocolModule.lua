--- ProtocolModule.lua
--- Created by dreamness
--- DateTime: 12/15/2024 02:42 PM

--- 协议模块
ProtocolModule = {}

-- TODO: test
--- 授权玩家协议 (528)
--- @param player_name PlayerEnum 玩家名
--- @param protocol_name ProtocolEnum 协议名
ProtocolModule.grant_protocol = function(player_name, protocol_name)
    if type(player_name) ~= "string" then
        LoggerModule.error("ProtocolModule.grant_protocol", "player_name must be a string")
    end
    if type(protocol_name) ~= "string" then
        LoggerModule.error("ProtocolModule.grant_protocol", "protocol_name must be a string")
    end
    ExecuteAction("PLAYER_GRANT_SPECIAL_POWER", protocol_name, player_name)
end

--- 设置能获取的协议点数 (533)
--- @param player_name PlayerEnum 玩家名
--- @param cnt number 点数
ProtocolModule.set_max_point = function(player_name, cnt)
    if type(player_name) ~= "string" then
        LoggerModule.error("ProtocolModule.set_max_point", "player_name must be a string")
    end
    if type(cnt) ~= "number" then
        LoggerModule.error("ProtocolModule.set_max_point", "cnt must be a number")
    end
    ExecuteAction("PLAYER_SET_MAX_PLAYER_POWER_POINTS", player_name, cnt)
end

--- 设置协议点数(548)
--- @param player_name PlayerEnum 玩家名
--- @param cnt number 点数
ProtocolModule.set_point = function(player_name, cnt)
    if type(player_name) ~= "string" then
        LoggerModule.error("ProtocolModule.set_point", "player_name must be a string")
    end
    if type(cnt) ~= "number" then
        LoggerModule.error("ProtocolModule.set_point", "cnt must be a number")
    end
    ExecuteAction("PLAYER_SET_PLAYER_POWER_POINTS", player_name, cnt)
end

-- TODO: test
--- 协议是否就绪
--- @param player_name PlayerEnum 玩家名
--- @param protocol_name ProtocolEnum 协议名
--- @return boolean
ProtocolModule.is_ready = function(player_name, protocol_name)
    if type(player_name) ~= "string" then
        LoggerModule.error("ProtocolModule.is_ready", "player_name must be a string")
    end
    if type(protocol_name) ~= "string" then
        LoggerModule.error("ProtocolModule.is_ready", "protocol_name must be a string")
    end
    return SpecialPowerModule.is_ready(player_name, protocol_name)
end

-- TODO: test
--- 覆盖玩家的协议面板
--- @param player_name PlayerEnum 玩家名
--- @param faction_name FactionEnum
ProtocolModule.set_player_protocol_tech_faction = function(player_name, faction_name)
    if type(player_name) ~= "string" then
        LoggerModule.error("ProtocolModule.set_player_protocol_tech_faction", "player_name must be a string")
    end
    if type(faction_name) ~= "string" then
        LoggerModule.error("ProtocolModule.set_player_protocol_tech_faction", "faction_name must be a string")
    end
    if faction_name == FactionEnum.ALLIED then
        exPlayerTechChangeTechFaction(player_name, 'PlayerTechStore_Allied')
    elseif faction_name == FactionEnum.SOVIET then
        exPlayerTechChangeTechFaction(player_name, 'PlayerTechStore_Soviet')
    elseif faction_name == FactionEnum.JAPAN then
        exPlayerTechChangeTechFaction(player_name, 'PlayerTechStore_Japan')
    elseif faction_name == FactionEnum.CELESTIAL then
        exPlayerTechChangeTechFaction(player_name, 'PlayerTechStore_Neutral')
    end
end