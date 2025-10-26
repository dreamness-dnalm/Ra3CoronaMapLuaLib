
-- LuaLib_DisableSaveFeature 
-- if true, then the lua lib will never take over the save feature

if LuaLib_DisableSaveFeature then
    exDisableWBScript("lua_lib_auto_load.lua")
end


if _meta == nil then
    local libs = {
            -- _meta
    '_meta.lua',

            -- basic_module
    'AbilityModule.lua',
    'AllegianceModule.lua',
    'ArchiveModule.lua',
    'AreaModule.lua',
    'AttributeModifierModule.lua',
    'AudioModule.lua',
    'BuildModule.lua',
    'CameraModule.lua',
    'ChatMsgModule.lua',
    'CounterModule.lua',
    'DialogModule.lua',
    'FilterModule.lua',
    'FloatingTextModule.lua',
    'FogModule.lua',
    'FreezeTimeModule.lua',
    'GameModule.lua',
    'GarrisonModule.lua',
    'KeyboardModule.lua',
    'LoggerModule.lua',
    'MissionHotSpotModule.lua',
    'MissionModule.lua',
    'MoneyModule.lua',
    'MouseModule.lua',
    'MsgBoxModule.lua',
    'OreModule.lua',
    'PlayerModule.lua',
    'PowerModule.lua',
    'ProductionQueueModule.lua',
    'ProtocolModule.lua',
    'PublicBoardModule.lua',
    'RadarEventModule.lua',
    'SchedulerModule.lua',
    'SchedulerModuleRunner.lua',
    'ScoreBoardModule.lua',
    'SpecialPowerModule.lua',
    'StatusModule.lua',
    'TeamAttackModule.lua',
    'TeamModule.lua',
    'ThreatLevelModule.lua',
    'TopButtonModule.lua',
    'UIModule.lua',
    'UnitAttachModule.lua',
    'UnitAttackModule.lua',
    'UnitHealthModule.lua',
    'UnitHighlightModule.lua',
    'UnitModelStateModule.lua',
    'UnitModule.lua',
    'UnitPhysicsModule.lua',
    'UnitRallyModule.lua',
    'UnitTopButtonModule.lua',
    'UnitTopTextModule.lua',
    'UnitWeaponModule.lua',
    'UpgradeModule.lua',
    'WaypointModule.lua',
    'WorldModule.lua',

            -- basic_util
    'ColorUtil.lua',
    'FP.lua',
    'HomogeneousCoordinatesUtil.lua',
    'MathUtil.lua',
    'MatrixUtil.lua',
    'SerializeUtil.lua',
    'StringUtil.lua',
    'TableUtil.lua',
    'VectorUtil.lua',

            -- enums
    'AbilityEnum.lua',
    'AttachableThingEnum.lua',
    'AttributeModifierEnum.lua',
    'ButtonTextureEnum.lua',
    'EvaSoundEnum.lua',
    'FactionEnum.lua',
    'KindOfEnum.lua',
    'ModelStateEnum.lua',
    'MusicEnum.lua',
    'PlayerEnum.lua',
    'ProtocolEnum.lua',
    'SoundEnum.lua',
    'SpecialPowerEnum.lua',
    'StatusEnum.lua',
    'ThingEnum.lua',
    'UpgradeEnum.lua',
    'WaypointEnum.lua',
    'WeaponEnum.lua',

            -- helper
    'ChatLuaHelper.lua',
    'EventHelper.lua',
    'FilterHelper.lua',
    'PlayerHelper.lua',
    'RamdomHelper.lua',
    'TeamHelper.lua',
    'UnitCreateHelper.lua',
    'UnitHelper.lua',
    'WinAndFailedHelper.lua',

            -- object
    'Filter.lua',
    'Player.lua',
    'Team.lua',
    'Team_attack_part.lua',
    'Unit.lua',
    'Unit_attach_part.lua',
    'Unit_attack_part.lua',
    'Unit_hc_part.lua',
    'Unit_physics_part.lua',
    'Unit_ui_part.lua',

    }

    for i = 1, getn(libs) do
        exEnableWBScript(libs[i])
    end
end

