MissionHotSpotModule = {}


--- 设置任务热点可见性 (508)
--- @param hot_spot_name string 热点名称
--- @param is_visible boolean 是否可见
MissionHotSpotModule.set_visible = function(hot_spot_name, is_visible)
    if type(hot_spot_name) ~= 'string' then
        LoggerModule.error('MissionHotSpotModule.set_visible', 'hot_spot_name must be a string')
        return
    end

    ExecuteAction('SET_MISSION_HOT_SPOT_VISIBILITY', hot_spot_name, GameModule.to_ra3_boolean(is_visible)) -- (508)
end

--- 关联任务热点 (506)/(507), link_to_unit_table_or_name和link_to_waypoint_name不能同时为nil
--- @param hot_spot_name string 热点名称
--- @param is_enable boolean 是否启用
--- @param link_to_unit_table_or_name SystemUnitTable | string | nil 关联到单位
--- @param link_to_waypoint_name string | nil 关联到路径点
MissionHotSpotModule.link = function(hot_spot_name, is_enable, link_to_unit_table_or_name, link_to_waypoint_name)
    if type(hot_spot_name) ~= 'string' then
        LoggerModule.error('MissionHotSpotModule.link', 'hot_spot_name must be a string')
        return
    end
    if type(link_to_unit_table_or_name) ~= 'table' and type(link_to_unit_table_or_name) ~= 'string' and link_to_unit_table_or_name ~= nil then
        LoggerModule.error('MissionHotSpotModule.link', 'link_to_unit_table_or_name must be a table or string or nil')
        return
    end
    if type(link_to_waypoint_name) ~= 'string' and link_to_waypoint_name ~= nil then
        LoggerModule.error('MissionHotSpotModule.link', 'link_to_waypoint_name must be a string or nil')
        return
    end

    if link_to_unit_table_or_name == nil and link_to_waypoint_name == nil then
        LoggerModule.error('MissionHotSpotModule.link', 'link_to_unit_table_or_name and link_to_waypoint_name cannot be nil at the same time')
        return
    elseif link_to_unit_table_or_name ~= nil and link_to_waypoint_name ~= nil then
        LoggerModule.error('MissionHotSpotModule.link', 'link_to_unit_table_or_name and link_to_waypoint_name cannot be not nil at the same time')
        return
    elseif link_to_unit_table_or_name ~= nil then
        ExecuteAction('LINK_MISSION_HOT_SPOT_TO_OBJECT', hot_spot_name, link_to_unit_table_or_name, GameModule.to_ra3_boolean(is_enable)) -- (506)
    else
        ExecuteAction('LINK_MISSION_HOT_SPOT_TO_WAYPOINT', hot_spot_name, link_to_waypoint_name, GameModule.to_ra3_boolean(is_enable)) -- (507)
    end
end

-- 不可用
-- --- 启用/禁用任务热点 (514)
-- --- @param hot_spot_name string 热点名称
-- --- @param is_enable boolean 是否启用
-- MissionHotSpotModule.enable = function(hot_spot_name, is_enable)
--     if type(hot_spot_name) ~= 'string' then
--         LoggerModule.error('MissionHotSpotModule.enable', 'hot_spot_name must be a string')
--         return
--     end

--     ExecuteAction('SET_MISSION_HOT_SPOT_ACTIVENESS', hot_spot_name, GameModule.to_ra3_boolean(is_enable)) -- (514)
-- end

--- 任务热点是否被激活 [144]
--- @param hot_spot_name string 热点名称
--- @return boolean 是否被激活
MissionHotSpotModule.is_active = function(hot_spot_name)
    return GameModule.from_ra3_boolean(EvaluateCondition('MISSION_HOT_SPOT_ACTIVE', hot_spot_name))
end
