UnitCreateHelper.create_unit_at_waypoint(
    UnitHelper.get_unit_auto_name(),
    ThingEnum.AlliedBaseDefenseAdvanced, -- 光谱塔
    TeamModule.from_player_name(PlayerEnum.Player_1),
    "Waypoint 3",
    nil, nil, nil
)

UnitCreateHelper.create_refinery(
    UnitHelper.get_unit_from_name("ore1"),
    FactionEnum.ALLIED,
    PlayerEnum.Player_1,
    "Waypoint 3"
)

UnitCreateHelper.create_refinery(
    UnitHelper.get_unit_from_name("ore2"),
    FactionEnum.CELESTIAL,
    PlayerEnum.Player_1,
    "Waypoint 3"
)

UnitCreateHelper.create_refinery(
    UnitHelper.get_unit_from_name("ore3"),
    FactionEnum.SOVIET,
    PlayerEnum.Player_1,
    "Waypoint 3"
)

UnitCreateHelper.create_refinery(
    UnitHelper.get_unit_from_name("ore4"),
    FactionEnum.JAPAN,
    PlayerEnum.Player_1,
    "Waypoint 3"
)


UnitCreateHelper.create_unit_with_garrison(
    ThingEnum.JapanLightTransportVehicle, -- 迅雷
    {ThingEnum.JapanEngineer, ThingEnum.SovietCommandoTech1, ThingEnum.SovietScoutVehicle}, -- 苏联工程师, 娜塔莎, 蜘蛛
    TeamModule.from_player_name(PlayerEnum.Player_1),
    "Waypoint 3"
)