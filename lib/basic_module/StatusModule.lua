--- StatusModule.lua
--- Created by dreamness
--- DateTime: 8/10/2024 10:46 PM
---


StatusModule = {}

--- 单位是否拥有状态 [59]
--- @param unit_table_or_name SystemUnitTable|string 
--- @param status StatusEnum
--- @return boolean
StatusModule.is_unit_has_status = function(unit_table_or_name, status)
    if type(unit_table_or_name) ~= "string" and type(unit_table_or_name) ~= "table" then
        LoggerModule.error("StatusModule.is_unit_has_status", "unit_table_or_name must be a table or string")
        return nil
    end
    if type(status) ~= "string" then
        LoggerModule.error("StatusModule.is_unit_has_status", "status must be a string")
        return nil
    end
    return GameModule.from_ra3_boolean(EvaluateCondition("UNIT_HAS_OBJECT_STATUS", unit_table_or_name, status)) --59)
end

-- -- TODO: test
-- --- 队伍是否拥有状态 [60], [61]
-- --- @param team_name string 队伍名
-- --- @param status StatusEnum
-- --- @param is_all boolean 是否全部拥有
-- StatusModule.is_team_has_status = function(team_name, status, is_all)
--     if type(team_name) ~= "string" then
--         LoggerModule.error("StatusModule.is_team_has_status", "team_name must be a number")
--         return nil
--     end
--     if type(status) ~= "string" then
--         LoggerModule.error("StatusModule.is_team_has_status", "status must be a string")
--         return nil
--     end
--     if is_all then
--         return EvaluateCondition("TEAM_ALL_HAS_OBJECT_STATUS", team_name, status) --60
--     else
--         return EvaluateCondition("TEAM_SOME_HAVE_OBJECT_STATUS", team_name, status) --61
--     end
-- end

--- 改变单位状态 (411)
--- @param unit_table_or_name SystemUnitTable|string
--- @param statuses StatusEnum | StatusEnum[]
--- @param is_active boolean 是否激活 add / remove
StatusModule.unit_change_status = function(unit_table_or_name, statuses, is_active)
    if type(unit_table_or_name) ~= "string" and type(unit_table_or_name) ~= "table" then
        LoggerModule.error("StatusModule.unit_change_status", "unitTableOrName must be a table or string, but " .. type(unit_table_or_name))
        return
    end

    if type(statuses) == 'string' then
        ExecuteAction("UNIT_CHANGE_OBJECT_STATUS", unit_table_or_name, statuses, is_active) --411
        return
    elseif type(statuses) == 'table' then
        for i = 1, getn(statuses) do
            ExecuteAction("UNIT_CHANGE_OBJECT_STATUS", unit_table_or_name, statuses[i], is_active) --411
        end
    else
        LoggerModule.error("StatusModule.unit_change_status", "statuses must be a table or string")
    end
end

-- -- TODO: test
-- --- 改变队伍里所有单位状态 (412)
-- --- @param team_name string 队伍名
-- --- @param status StatusEnum
-- --- @param is_active boolean 是否激活 add / remove
-- StatusModule.team_change_status = function(team_name, status, is_active)
--     if type(team_name) ~= "string" then
--         LoggerModule.error("StatusModule.team_change_status", "team must be a string")
--         return
--     end
--     if type(status) ~= "string" then
--         LoggerModule.error("StatusModule.team_change_status", "status must be a string")
--         return
--     end
--     ExecuteAction("TEAM_CHANGE_OBJECT_STATUS", team_name, status, is_active) --412
-- end