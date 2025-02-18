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