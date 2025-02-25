--- AbilityModule.lua
--- Created by dreamness
--- DateTime: 10/23/2024 10:30 PM
---

--- 单位能力模块
AbilityModule = {}

--- 使用技能 (192)
--- @param unit_table_or_name string|SystemUnitTable 单位table或单位名
--- @param ability_name AbilityEnum 技能名
AbilityModule.unit_use_ability = function(unit_table_or_name, ability_name)
    if type(unit_table_or_name) ~= "string" and type(unit_table_or_name) ~= 'table' then
        LoggerModule.error("AbilityModule.unit_use_ability", "unit_table_or_name must be a string")
    end
    if type(ability_name) ~= "string" then
        LoggerModule.error("AbilityModule.unit_use_ability", "ability_name must be a string")
    end

    ExecuteAction("NAMED_USE_COMMANDBUTTON_ABILITY", unit_table_or_name, ability_name)
end

--- 使用技能在指定路径点 (162)
--- @param unit_table_or_name string|SystemUnitTable 单位table或单位名
--- @param ability_name AbilityEnum 技能名
--- @param waypoint string 路径点
AbilityModule.unit_use_ability_at_waypoint = function(unit_table_or_name, ability_name, waypoint)
    if type(unit_table_or_name) ~= "string" and type(unit_table_or_name) ~= 'table' then
        LoggerModule.error("AbilityModule.unit_use_ability_at_waypoint", "unit_table_or_name must be a string")
    end
    if type(ability_name) ~= "string" then
        LoggerModule.error("AbilityModule.unit_use_ability_at_waypoint", "ability_name must be a string")
    end
    if type(waypoint) ~= "string" then
        LoggerModule.error("AbilityModule.unit_use_ability_at_waypoint", "waypoint must be a string")
    end

    ExecuteAction("NAMED_USE_COMMANDBUTTON_ABILITY_AT_WAYPOINT", unit_table_or_name, ability_name, waypoint)
end

--- 在单位上使用技能 ((161))
--- @param unit_name string 单位名
--- @param ability_name AbilityEnum 技能名
--- @param target_unit_name string 目标单位名
AbilityModule.unit_use_ability_on_unit = function(unit_name, ability_name, target_unit_name)
    if type(unit_name) ~= "string" then
        LoggerModule.error("AbilityModule.unit_use_ability_on_unit", "unit_name must be a string")
    end
    if type(ability_name) ~= "string" then
        LoggerModule.error("AbilityModule.unit_use_ability_on_unit", "ability_name must be a string")
    end
    if type(target_unit_name) ~= "string"then
        LoggerModule.error("AbilityModule.unit_use_ability_on_unit", "target_unit_name must be a string")
    end

    ExecuteAction("NAMED_USE_COMMANDBUTTON_ABILITY_ON_NAMED", unit_name, ability_name, target_unit_name)
end


-- -- TODO: test, package
-- --- 队伍使用技能 (193)
-- --- @param team_name string 队伍名
-- --- @param ability_name AbilityEnum 技能名
-- AbilityModule.team_use_ability = function(team_name, ability_name)
--     if type(team_name) ~= "string" then
--         LoggerModule.error("AbilityModule.team_use_ability", "team_name must be a string")
--     end
--     if type(ability_name) ~= "string" then
--         LoggerModule.error("AbilityModule.team_use_ability", "ability_name must be a string")
--     end

--     ExecuteAction("TEAM_USE_COMMANDBUTTON_ABILITY", team_name, ability_name)
-- end

-- -- TODO: test, package
-- --- 队伍使用技能在指定路径点 (191)
-- --- @param team_name string 队伍名
-- --- @param ability_name AbilityEnum 技能名
-- AbilityModule.team_use_ability_at_waypoint = function(team_name, ability_name, waypoint)
--     if type(team_name) ~= "string" then
--         LoggerModule.error("AbilityModule.team_use_ability_at_waypoint", "team_name must be a string")
--     end
--     if type(ability_name) ~= "string" then
--         LoggerModule.error("AbilityModule.team_use_ability_at_waypoint", "ability_name must be a string")
--     end
--     if type(waypoint) ~= "string" then
--         LoggerModule.error("AbilityModule.team_use_ability_at_waypoint", "waypoint must be a string")
--     end

--     ExecuteAction("TEAM_USE_COMMANDBUTTON_ABILITY_AT_WAYPOINT", team_name, ability_name, waypoint)
-- end

-- -- TODO: test, package
-- --- 队伍使用技能在指定单位上 (190)
-- --- @param team_name string 队伍名
-- --- @param ability_name AbilityEnum 技能名
-- --- @param target_unit_name string 目标单位名
-- AbilityModule.team_use_ability_on_unit = function(team_name, ability_name, target_unit_name)
--     if type(team_name) ~= "string" then
--         LoggerModule.error("AbilityModule.team_use_ability_on_unit", "team_name must be a string")
--     end
--     if type(ability_name) ~= "string" then
--         LoggerModule.error("AbilityModule.team_use_ability_on_unit", "ability_name must be a string")
--     end
--     if type(target_unit_name) ~= "string" then
--         LoggerModule.error("AbilityModule.team_use_ability_on_unit", "target_unit_name must be a string")
--     end

--     ExecuteAction("TEAM_USE_COMMANDBUTTON_ABILITY_ON_NAMED", team_name, ability_name, target_unit_name)
-- end

