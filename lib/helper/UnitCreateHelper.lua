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
--- @return Unit
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


--- 在矿脉上建造矿场
--- @param ore_node_unit Unit 矿脉unit
--- @param faction_name FactionEnum
--- @param player_name PlayerEnum
--- @param waypoint_name string
--- @return Unit
function UnitCreateHelper.create_refinery(ore_node_unit, faction_name, player_name, waypoint_name)
    if type(ore_node_unit) ~= "table" then
        LoggerModule.error("UnitCreateHelper.create_refinery", "ore_node_unit must be a table")
        return
    end
    if type(faction_name) ~= "string" then
        LoggerModule.error("UnitCreateHelper.create_refinery", "faction_name must be a string")
        return
    end
    if type(player_name) ~= "string" then
        LoggerModule.error("UnitCreateHelper.create_refinery", "player_name must be a string")
        return
    end
    if type(waypoint_name) ~= "string" then
        LoggerModule.error("UnitCreateHelper.create_refinery", "waypoint_name must be a string")
        return
    end

    local refinery_thing = ''
    if faction_name == FactionEnum.ALLIED then
        refinery_thing = 'AlliedRefinery'
    elseif faction_name == FactionEnum.SOVIET then
        refinery_thing = 'SovietRefinery'
    elseif faction_name == FactionEnum.CELESTIAL then
        refinery_thing = 'CelestialRefinery'
    elseif faction_name == FactionEnum.JAPAN then
        refinery_thing = 'JapanRefinery'
    else
        LoggerModule.error('UnitCreateHelper.create_refinery', 'unknown faction')
        return
    end

    local pos_vec = ore_node_unit:get_position_vec()
    local direction_vec = ore_node_unit:get_direction_vec()
    
    local angle = VectorUtil.angle(direction_vec, {1, 0, 0})
    if angle ~= angle then
        angle = 0
    end

    if VectorUtil.cross2({direction_vec[1], direction_vec[2]}, {1, 0}) < 0 then
        angle = -angle
    end

    angle = 180 - angle
    pos_vec = VectorUtil.add(pos_vec, VectorUtil.multiply(direction_vec, 180))

    local refinery_unit = UnitCreateHelper.create_unit_at_waypoint(
    UnitHelper.get_unit_auto_name(),
    refinery_thing,
    TeamModule.from_player_name(player_name),
    waypoint_name,
    nil, nil, nil)

    refinery_unit:set_position_by_vec(pos_vec)
    refinery_unit:rotate_by_euler(0, 0, angle)
    return refinery_unit
end


--- 创建有乘客的单位
--- @param parent_thing_name ThingEnum
--- @param child_thing_names ThingEnum[]
--- @param team_name TeamEnum
--- @param waypoint_name string
--- @return Unit 母单位, Unit[] 子单位列表
function UnitCreateHelper.create_unit_with_garrison(parent_thing_name, child_thing_names, team_name, waypoint_name)
    if type(parent_thing_name) ~= "string" then
        LoggerModule.error("UnitCreateHelper.create_unit_with_garrison", "parent_thing_name must be a string")
        return
    end
    if type(child_thing_names) ~= "table" then
        LoggerModule.error("UnitCreateHelper.create_unit_with_garrison", "child_thing_names must be a table")
        return
    end
    if type(team_name) ~= "string" then
        LoggerModule.error("UnitCreateHelper.create_unit_with_garrison", "team_name must be a string")
        return
    end
    if type(waypoint_name) ~= "string" then
        LoggerModule.error("UnitCreateHelper.create_unit_with_garrison", "waypoint_name must be a string")
        return
    end

    local parent_unit = UnitCreateHelper.create_unit_at_waypoint(
        UnitHelper.get_unit_auto_name(),
        parent_thing_name,
        team_name,
        waypoint_name,
        nil, nil, nil
    )

    local child_units = {}

    for i = 1, getn(child_thing_names) do
        local child_thing_name = child_thing_names[i]
        local child_unit = UnitCreateHelper.create_unit_at_waypoint(
            UnitHelper.get_unit_auto_name(),
            child_thing_name,
            team_name,
            waypoint_name,
            nil, nil, nil
        )
        child_unit:garrison_other_unit(parent_unit)
        tinsert(child_units, child_unit)
    end

    return parent_unit, child_units
    
end