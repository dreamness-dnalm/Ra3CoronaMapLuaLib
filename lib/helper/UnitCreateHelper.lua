--- UnitCreateHelper.lua
--- Created by dreamness
--- DateTime: 10/13/2024 07:31 PM


--- 单位创建帮助类
UnitCreateHelper = {}

--- 在路径点创建单位
--- @param unit_name string 单位名字
--- @param thing ThingEnum
--- @param team_name TeamEnum
--- @param waypoint_name string 路径点名字
--- @param attrs AttributeModifierEnum | AttributeModifierEnum[] | nil
--- @param attrs_frame_cnt number | nil
--- @param statuses StatusEnum | StatusEnum[] | nil
UnitCreateHelper.create_unit_at_waypoint = function(unit_name, thing, team_name, waypoint_name, attrs, attrs_frame_cnt, statuses)
    if type(unit_name) ~= "string" then
        LoggerModule.error("UnitCreateHelper.create_unit_at_waypoint", "unit_name must be a string")
        return
    end
    if type(thing) ~= "string" then
        LoggerModule.error("UnitCreateHelper.create_unit_at_waypoint", "thing must be a string")
        return
    end

    if type(team_name) ~= "string" then
        LoggerModule.error("UnitCreateHelper.create_unit_at_waypoint", "team_name must be a string")
        return
    end

    if type(waypoint_name) ~= "string"  then
        LoggerModule.error("UnitCreateHelper.create_unit_at_waypoint", "waypoint_name must be a string")
        return
    end

    if attrs ~= nil and type(attrs) ~= "table" and type(attrs) ~= "string" then
        LoggerModule.error("UnitCreateHelper.create_unit_at_waypoint", "attrs must be a table, string or nil")
        return
    end

    if attrs_frame_cnt ~= nil and type(attrs_frame_cnt) ~= "number" then
        LoggerModule.error("UnitCreateHelper.create_unit_at_waypoint", "attrs_frame_cnt must be a number or nil")
        return
    end

    if statuses ~= nil and type(statuses) ~= "table" and type(statuses) ~= "string" then
        LoggerModule.error("UnitCreateHelper.create_unit_at_waypoint", "statuses must be a table, string or nil")
        return
    end
    
    UnitModule.create_and_name_unit_at_waypoint(unit_name, thing, team_name, waypoint_name, attrs, statuses)
    local unit = UnitHelper.get_unit_from_name(unit_name)
    if attrs ~= nil then
        unit:add_modifier(attrs, attrs_frame_cnt)
    end
    if statuses ~= nil then
        unit:add_status(statuses)
    end
    return unit
end

