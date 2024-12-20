--- ThreatLevelModule.lua
--- Created by dreamness
--- DateTime: 12/15/2024 06:00 PM

--- 威胁等级模块
ThreatLevelModule = {}

-- TODO: test
--- 获取威胁等级
--- @param player_name PlayerEnum 玩家名
--- @return number
ThreatLevelModule.get_threat_level = function(player_name)
    if type(player_name) ~= "string" then
        LoggerModule.error("ThreatLevelModule.get_threat_level", "player_name must be a string")
    end
    return ObjectGetRedAlertCurrentThreatLevel(player_name)
end

-- TODO: test
--- 设置威胁等级
--- @param player_name PlayerEnum 玩家名
--- @param level number 等级
ThreatLevelModule.set_threat_level = function(player_name, level)
    if type(player_name) ~= "string" then
        LoggerModule.error("ThreatLevelModule.set_threat_level", "player_name must be a string")
    end
    if type(level) ~= "number" then
        LoggerModule.error("ThreatLevelModule.set_threat_level", "level must be a number")
    end
    ObjectSetRedAlertCurrentThreatLevel(player_name, level)
end