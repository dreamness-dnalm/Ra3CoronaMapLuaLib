--- BuildModule.lua
--- Created by dreamness
--- DateTime: 12/29/2024 11:11 PM

--- 和建造相关的函数
BuildModule = {}


-- TODO: package
--- 是否允许玩家建造建筑 (59)/(56)
--- 注: 帝国的核心不是建筑，所以不受影响
--- @param player_name PlayerEnum
--- @param is_allowed boolean
BuildModule.allow_build_building = function(player_name, is_allowed)
    if type(player_name) ~= "string" then
        LoggerModule.error("BuildModule.allow_build_building", "player_name must be a string")
    end
    if is_allowed then
        ExecuteAction("PLAYER_ENABLE_BASE_CONSTRUCTION", player_name)
    else
        ExecuteAction("PLAYER_DISABLE_BASE_CONSTRUCTION", player_name)
    end
end

-- TODO: package
--- 是否允许玩家建造单位 (61)/(58)
--- 注: 帝国的核心属于单位, 会受影响
--- @param player_name PlayerEnum
--- @param is_allow boolean
BuildModule.allow_build_unit = function(player_name, is_allow)
    if type(player_name) ~= "string" then
        LoggerModule.error("BuildModule.allow_build_unit", "player_name must be a string")
    end
    if is_allow then
        ExecuteAction("PLAYER_ENABLE_UNIT_CONSTRUCTION", player_name)
    else
        ExecuteAction("PLAYER_DISABLE_UNIT_CONSTRUCTION", player_name)
    end
end

-- TODO: package
--- 允许/禁止玩家建造一个单位 (283)
--- @param player_name PlayerEnum
--- @param thing_name ThingEnum
--- @param is_allow boolean
BuildModule.allow_build_a_unit = function(player_name, thing_name, is_allow)
    if type(player_name) ~= "string" then
        LoggerModule.error("BuildModule.allow_build_a_unit", "player_name must be a string")
    end
    if type(thing_name) ~= "string" then
        LoggerModule.error("BuildModule.allow_build_a_unit", "thing_name must be a string")
    end
    local is_allow_value = GameModule.to_ra3_boolean(is_allow)
    ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING", player_name, thing_name, is_allow_value)
end