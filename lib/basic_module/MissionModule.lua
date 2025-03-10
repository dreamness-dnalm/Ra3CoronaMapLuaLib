

--- @class RadarEventTypeEnum
RadarEventTypeEnum = {
    INFORMATION = 'Information',
    CONTRUSTION = 'Construction',
    UPGRADE = 'Upgrade',
    UNDER_ATTACK = 'Under_Attack',
    INFILTRATION = 'Infiltration',
    BANNER = 'Banner',
}



MissionModule = {}

-- TODO: test
--- 创建雷达事件 (172)/(173)， at_unit_table_or_name 和 at_team_name 必须有且仅有一个不为nil
--- @param rader_event_type RadarEventTypeEnum 雷达事件类型
--- @param at_unit_table_or_name SystemUnitTable | string | nil 在单位上创建雷达事件
--- @param at_team_name string | nil 在队伍上创建雷达事件
MissionModule.create_radar_event = function(rader_event_type, at_unit_table_or_name, at_team_name)
    if type(rader_event_type) ~= 'string' then
        LoggerModule.error('MissionModule.create_radar_event', 'rader_event_type must be a string')
        return
    end
    if type(at_unit_table_or_name) ~= 'table' and type(at_unit_table_or_name) ~= 'string' and at_unit_table_or_name ~= nil then
        LoggerModule.error('MissionModule.create_radar_event', 'at_unit_table_or_name must be a table or string or nil')
        return
    end
    if type(at_team_name) ~= 'string' and at_team_name ~= nil then
        LoggerModule.error('MissionModule.create_radar_event', 'at_team_name must be a string or nil')
        return
    end

    if at_unit_table_or_name == nil and at_team_name == nil then
        LoggerModule.error('MissionModule.create_radar_event', 'at_unit_table_or_name and at_team_name cannot be nil at the same time')
        return
    elseif at_unit_table_or_name ~= nil and at_team_name ~= nil then
        LoggerModule.error('MissionModule.create_radar_event', 'at_unit_table_or_name and at_team_name cannot be not nil at the same time')
        return
    elseif at_unit_table_or_name ~= nil then
        ExecuteAction('OBJECT_CREATE_RADAR_EVENT', at_unit_table_or_name, rader_event_type) -- (172)
    else
        ExecuteAction('TEAM_CREATE_RADAR_EVENT', at_team_name, rader_event_type) -- (173)
    end
end 


-- TODO: test
---显示/隐藏任务目标 (403)/(404)
--- @param mission_map_str_key_behind string
--- @param is_show boolean
MissionModule.show_mission_objective = function(mission_map_str_key_behind, is_show)
    if type(mission_map_str_key_behind) ~= 'string' then
        LoggerModule.error('MissionModule.show_mission_objective', 'mission_map_str_key_behind must be a string')
        return
    end

    if is_show then
        ExecuteAction('SHOW_MISSION_OBJECTIVE', mission_map_str_key_behind) -- (403)
    else
        ExecuteAction('HIDE_MISSION_OBJECTIVE', mission_map_str_key_behind) -- (404)
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

-- TODO: test
--- 关联任务目标 (405)/(406)/(552)/(553), link_to_unit_table_or_name 和 link_to_waypoint_name 必须有且仅有一个不为nil
--- @param mission_map_str_key_behind string
--- @param is_enable boolean
--- @param mission_object_category MissionObjectiveCategoryEnum | nil 如果为nil则不显示图片
--- @param link_to_unit_table_or_name SystemUnitTable | string | nil 关联到单位
--- @param link_to_waypoint_name string | nil 关联到路径点
MissionModule.link_mission_objective = function(mission_map_str_key_behind, is_enable, mission_object_category, link_to_unit_table_or_name, link_to_waypoint_name)
    if type(mission_map_str_key_behind) ~= 'string' then
        LoggerModule.error('MissionModule.link_mission_objective', 'mission_map_str_key_behind must be a string')
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
            ExecuteAction('LINK_MISSION_OBJECTIVE_TO_OBJECT', mission_map_str_key_behind, link_to_unit_table_or_name, is_enable_value) -- (405)
        else
            ExecuteAction('LINK_MISSION_OBJECTIVE_TO_OBJECT_WITH_CATEGORY', mission_map_str_key_behind, link_to_unit_table_or_name, is_enable_value, mission_object_category) -- (553)
        end
    else
        if mission_object_category == nil then
            ExecuteAction('LINK_MISSION_OBJECTIVE_TO_WAYPOINT', mission_map_str_key_behind, link_to_waypoint_name, is_enable_value) -- (406)
        else
            ExecuteAction('LINK_MISSION_OBJECTIVE_TO_WAYPOINT_WITH_CATEGORY', mission_map_str_key_behind, link_to_waypoint_name, is_enable_value, mission_object_category) -- (552)
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


-- TODO: test
--- 设置任务目标状态 (492)
--- @param mission_map_str_key_behind string
--- @param status MissionObjectStatusEnum
MissionModule.set_mission_objective_status = function(mission_map_str_key_behind, status)
    if type(mission_map_str_key_behind) ~= 'string' then
        LoggerModule.error('MissionModule.set_mission_objective_status', 'mission_map_str_key_behind must be a string')
        return
    end
    if type(status) ~= 'string' then
        LoggerModule.error('MissionModule.set_mission_objective_status', 'status must be a string')
        return
    end

    ExecuteAction('SET_MISSION_OBJECTIVE_STATUS', mission_map_str_key_behind, status) -- (492)
end

--- TODO: test
--- 任务自动保存存档 (554)
--- @param text_map_str string
MissionModule.auto_save = function(text_map_str)
    if type(text_map_str) ~= 'string' then
        LoggerModule.error('MissionModule.auto_save', 'text_map_str must be a string')
        return
    end

    ExecuteAction('CAMPAIGN_CREATE_AUTO_SAVE', text_map_str) -- (554)
end