MissionModule = {}

---显示/隐藏任务目标 (403)/(404)
--- @param mission_id string
--- @param is_show boolean
MissionModule.show_mission_objective = function(mission_id, is_show)
    if type(mission_id) ~= 'string' then
        LoggerModule.error('MissionModule.show_mission_objective', 'mission_id must be a string')
        return
    end

    if is_show then
        ExecuteAction('SHOW_MISSION_OBJECTIVE', mission_id) -- (403)
    else
        ExecuteAction('HIDE_MISSION_OBJECTIVE', mission_id) -- (404)
    end
end

--- @class MissionObjectiveCategoryEnum
MissionObjectiveCategoryEnum = {
    ATTACK = 'Attack',
    BUILD = 'Build',
    CAPTURE = 'Capture',
    MOVE = 'Move',
    PROTECT = 'Protect'
}

--- 关联任务目标 (405)/(406)/(552)/(553), link_to_unit_table_or_name 和 link_to_waypoint_name 必须有且仅有一个不为nil
--- @param mission_id string
--- @param is_enable boolean
--- @param mission_object_category MissionObjectiveCategoryEnum | nil 如果为nil则不显示图片
--- @param link_to_unit_table_or_name SystemUnitTable | string | nil 关联到单位
--- @param link_to_waypoint_name string | nil 关联到路径点
MissionModule.link_mission_objective = function(mission_id, is_enable, mission_object_category, link_to_unit_table_or_name, link_to_waypoint_name)
    if type(mission_id) ~= 'string' then
        LoggerModule.error('MissionModule.link_mission_objective', 'mission_id must be a string')
        return
    end
    if type(mission_object_category) ~= 'string' and mission_object_category ~= nil then
        LoggerModule.error('MissionModule.link_mission_objective', 'mission_object_category must be a string or nil')
        return
    end
    if type(link_to_unit_table_or_name) ~= 'table' and type(link_to_unit_table_or_name) ~= 'string' and link_to_unit_table_or_name ~= nil then
        LoggerModule.error('MissionModule.link_mission_objective', 'link_to_unit_table_or_name must be a table or string or nil')
        return
    end
    if type(link_to_waypoint_name) ~= 'string' and link_to_waypoint_name ~= nil then
        LoggerModule.error('MissionModule.link_mission_objective', 'link_to_waypoint_name must be a string or nil')
        return
    end

    local is_enable_value = GameModule.to_ra3_boolean(is_enable)

    if link_to_unit_table_or_name == nil and link_to_waypoint_name == nil then
        LoggerModule.error('MissionModule.link_mission_objective', 'link_to_unit_table_or_name and link_to_waypoint_name cannot be nil at the same time')
        return
    elseif link_to_unit_table_or_name ~= nil and link_to_waypoint_name ~= nil then
        LoggerModule.error('MissionModule.link_mission_objective', 'link_to_unit_table_or_name and link_to_waypoint_name cannot be not nil at the same time')
        return
    elseif link_to_unit_table_or_name ~= nil then
        if mission_object_category == nil then
            ExecuteAction('LINK_MISSION_OBJECTIVE_TO_OBJECT', mission_id, link_to_unit_table_or_name, is_enable_value) -- (405)
        else
            ExecuteAction('LINK_MISSION_OBJECTIVE_TO_OBJECT_WITH_CATEGORY', mission_id, link_to_unit_table_or_name, is_enable_value, mission_object_category) -- (553)
        end
    else
        if mission_object_category == nil then
            ExecuteAction('LINK_MISSION_OBJECTIVE_TO_WAYPOINT', mission_id, link_to_waypoint_name, is_enable_value) -- (406)
        else
            ExecuteAction('LINK_MISSION_OBJECTIVE_TO_WAYPOINT_WITH_CATEGORY', mission_id, link_to_waypoint_name, is_enable_value, mission_object_category) -- (552)
        end
    end
end

--- @class MissionObjectStatusEnum
MissionObjectStatusEnum = {
    HIDDEN = 'Hidden',
    ACTIVE = 'Active',
    COMPLETED = 'Completed',
    FAILED = 'Failed'
}


--- 设置任务目标状态 (492)
--- @param mission_id string
--- @param status MissionObjectStatusEnum
MissionModule.set_mission_objective_status = function(mission_id, status)
    if type(mission_id) ~= 'string' then
        LoggerModule.error('MissionModule.set_mission_objective_status', 'mission_id must be a string')
        return
    end
    if type(status) ~= 'string' then
        LoggerModule.error('MissionModule.set_mission_objective_status', 'status must be a string')
        return
    end

    ExecuteAction('SET_MISSION_OBJECTIVE_STATUS', mission_id, status) -- (492)
end

