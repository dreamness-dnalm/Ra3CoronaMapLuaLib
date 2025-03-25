RadarEventModule = {}

--- @class RadarEventTypeEnum
RadarEventTypeEnum = {
    INFORMATION = 'Information',
    CONTRUSTION = 'Construction',
    UPGRADE = 'Upgrade',
    UNDER_ATTACK = 'Under_Attack',
    INFILTRATION = 'Infiltration',
    BANNER = 'Banner',
}


--- 创建雷达事件 (172)/(173)/(80)， at_unit_table_or_name 和 at_team_name 必须有且仅有一个不为nil
--- @param radar_event_type RadarEventTypeEnum 雷达事件类型
--- @param at_unit_table_or_name SystemUnitTable | string | nil 在单位上创建雷达事件
--- @param at_team_name string | nil 在队伍上创建雷达事件
--- @param position_vec Vector | nil 在指定坐标上创建雷达事件
RadarEventModule.create_radar_event = function(radar_event_type, at_unit_table_or_name, at_team_name, position_vec)
    if type(radar_event_type) ~= 'string' then
        LoggerModule.error('RadarEventModule.create_radar_event', 'radar_event_type must be a string')
        return
    end
    if type(at_unit_table_or_name) ~= 'table' and type(at_unit_table_or_name) ~= 'string' and at_unit_table_or_name ~= nil then
        LoggerModule.error('RadarEventModule.create_radar_event', 'at_unit_table_or_name must be a table or string or nil')
        return
    end
    if type(at_team_name) ~= 'string' and at_team_name ~= nil then
        LoggerModule.error('RadarEventModule.create_radar_event', 'at_team_name must be a string or nil')
        return
    end
    if type(position_vec) ~= 'table' and position_vec ~= nil then
        LoggerModule.error('RadarEventModule.create_radar_event', 'position_vec must be a table or nil')
        return
    end

    if at_unit_table_or_name == nil and at_team_name == nil and position_vec == nil then
        LoggerModule.error('RadarEventModule.create_radar_event', 'at_unit_table_or_name, at_team_name and position_vec cannot be nil at the same time')
        return
    elseif at_unit_table_or_name ~= nil and at_team_name ~= nil and position_vec ~= nil then
        LoggerModule.error('RadarEventModule.create_radar_event', 'at_unit_table_or_name, at_team_name and position_vec cannot be not nil at the same time')
        return
    elseif at_unit_table_or_name ~= nil then
        ExecuteAction('OBJECT_CREATE_RADAR_EVENT', at_unit_table_or_name, radar_event_type) -- (172)
    elseif at_team_name ~= nil then
        ExecuteAction('TEAM_CREATE_RADAR_EVENT', at_team_name, radar_event_type) -- (173)
    elseif position_vec ~= nil then
        local pos_table = {X=position_vec[1], Y=position_vec[2], Z=position_vec[3]}
        ExecuteAction('RADAR_CREATE_EVENT', pos_table, radar_event_type) -- (80)
    end
end 


