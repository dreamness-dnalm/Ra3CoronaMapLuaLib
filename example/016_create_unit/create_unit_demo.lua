LoggerModule.setup(LoggerLevelEnum.DEBUG, {LoggerTargetEnum.DEBUG_LOG_FILE})

-- UnitCreateHelper.create_unit_at_waypoint(
--     UnitHelper.get_unit_auto_name(),
--     ThingEnum.AlliedBaseDefenseAdvanced, -- 光谱塔
--     TeamModule.from_player_name(PlayerEnum.Player_1),
--     "Waypoint 3",
--     nil, nil, nil
-- )

-- UnitCreateHelper.create_refinery(
--     UnitHelper.get_unit_from_name("ore1"),
--     FactionEnum.ALLIED,
--     PlayerEnum.Player_1,
--     "Waypoint 3"
-- )

-- UnitCreateHelper.create_refinery(
--     UnitHelper.get_unit_from_name("ore2"),
--     FactionEnum.CELESTIAL,
--     PlayerEnum.Player_1,
--     "Waypoint 3"
-- )

-- local u_s = UnitCreateHelper.create_refinery(
--     UnitHelper.get_unit_from_name("ore3"),
--     FactionEnum.SOVIET,
--     PlayerEnum.Player_1,
--     "Waypoint 3"
-- )


-- UnitCreateHelper.create_refinery(
--     UnitHelper.get_unit_from_name("ore4"),
--     FactionEnum.JAPAN,
--     PlayerEnum.Player_1,
--     "Waypoint 3"
-- )


-- UnitCreateHelper.create_unit_with_garrison(
--     ThingEnum.JapanLightTransportVehicle, -- 迅雷
--     {ThingEnum.JapanEngineer, ThingEnum.SovietCommandoTech1, ThingEnum.SovietScoutVehicle}, -- 苏联工程师, 娜塔莎, 蜘蛛
--     TeamModule.from_player_name(PlayerEnum.Player_1),
--     "Waypoint 3"
-- )

FogModule.reveal_map(PlayerEnum.Player_1, 1)


-- local u1 = UnitCreateHelper.create_unit_at_waypoint(
--     UnitHelper.get_unit_auto_name(),
--     ThingEnum.SovietAntiInfantryInfantry, 
--     TeamModule.from_player_name(PlayerEnum.Player_1),
--     "Waypoint 3",
--     nil, nil, nil
-- )

-- local u2 = UnitCreateHelper.create_unit_at_waypoint(
--     UnitHelper.get_unit_auto_name(),
--     ThingEnum.SovietAntiInfantryInfantry, 
--     TeamModule.from_player_name(PlayerEnum.Player_1),
--     "Waypoint 3",
--     nil, nil, nil
-- )

-- local u3 = UnitCreateHelper.create_unit_at_waypoint(
--     UnitHelper.get_unit_auto_name(),
--     ThingEnum.SovietAntiInfantryInfantry, 
--     TeamModule.from_player_name(PlayerEnum.Player_1),
--     "Waypoint 3",
--     nil, nil, nil
-- )

-- local u4 = UnitCreateHelper.create_unit_at_waypoint(
--     UnitHelper.get_unit_auto_name(),
--     ThingEnum.SovietAntiInfantryInfantry, 
--     TeamModule.from_player_name(PlayerEnum.Player_1),
--     "Waypoint 3",
--     nil, nil, nil
-- )

-- -- logger.error("test", '---- step1')

-- u1:add_attacher_by_name(AttachableThingEnum.Map_CustomAttaches01, "Waypoint 3")
-- u2:add_attacher_by_name(AttachableThingEnum.Map_CustomAttaches02, "Waypoint 3")
-- u4:add_attacher_by_name(AttachableThingEnum.Map_CustomAttaches04, "Waypoint 3")
-- u3:add_attacher_by_name("Map_CustomAttaches03", "Waypoint 3")
-- -- logger.error("test", '---- step2')

local u1 = UnitCreateHelper.create_unit_at_waypoint(
    UnitHelper.get_unit_auto_name(),
    "AlliedSuperWeaponAdvanced", 
    TeamModule.from_player_name(PlayerEnum.Player_1),
    "Waypoint 3",
    nil, nil, nil
)
u1:set_position(2357, 4416, 210)

u1:add_attacher_by_name(AttachableThingEnum.Map_CustomAttaches_TextureTanYa_Big, "Waypoint 3")

local u2 = UnitCreateHelper.create_unit_at_waypoint(
    UnitHelper.get_unit_auto_name(),
    "AlliedSuperWeaponAdvanced", 
    TeamModule.from_player_name(PlayerEnum.Player_1),
    "Waypoint 3",
    nil, nil, nil
)
u2:set_position(2657, 4416, 210)

local t2 = u2:add_attacher_by_name(AttachableThingEnum.Map_CustomAttaches_TextureTanYa_Big, "Waypoint 3")
-- t2:set_fixed_scale(5)
-- u2:set_fixed_scale(5)
t2:set_scale(15)