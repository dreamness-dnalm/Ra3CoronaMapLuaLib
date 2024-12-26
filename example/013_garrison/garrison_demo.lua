
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
    GarrisonModule.garrison(unit.name, created_unit.name)
end