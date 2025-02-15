
LoggerModule.setup(LoggerLevelEnum.DEBUG, {LoggerTargetEnum.DEBUG_LOG_FILE})

local filter = FilterHelper.new_filter_builder()
    :add_include_things("AlliedAntiAirVehicleTech1")
    :add_exclude_statuses("CONTAINER_OCCUPIED")
    :build()

local units, unit_count = filter:filter_units(nil, nil)
for i = 1, unit_count do
    local unit = units[i]
    local player_name = unit:get_owner_player()
    local created_unit = UnitCreateHelper.create_unit_at_waypoint(
        UnitHelper.get_unit_auto_name(),
        "AlliedAntiVehicleInfantry",
        TeamModule.from_player_name(player_name),
        "Waypoint 3",
        nil, nil, nil
    )
    created_unit:garrison_other_unit(unit)
    -- unit:empty_garrison_inside()
    -- -- created_unit:cancel_garrison()
    -- LoggerModule.info("garrison_deom.lua", tostring( created_unit:get_parent_unit():equals(unit)))
    -- LoggerModule.info("garrison_deom.lua", tostring( unit:is_thing("AlliedAntiAirVehicleTech1")))
    -- local child_units, child_unit_count = unit:get_child_units()
    -- LoggerModule.info("garrison_deom.lua", "child cnt: " .. tostring( child_unit_count))
    -- for j = 1, child_unit_count do
    --     local child_unit = child_units[j]
    --     LoggerModule.info("garrison_deom.lua", tostring(child_unit:equals(created_unit)))
    -- end
end