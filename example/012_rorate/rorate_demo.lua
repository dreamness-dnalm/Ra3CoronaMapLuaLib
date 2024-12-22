--- rorate_demo.lua
--- Created by dreamness
--- DateTime: 12/22/2024 22:52 PM

LoggerModule.setup(LoggerLevelEnum.DEBUG, {LoggerTargetEnum.CHAT_MSG})

-- local unit1 = UnitHelper.get_unit_from_name('unit1')
-- UnitPhysicsModule.translation(unit1, 0, 0, 100)

local unit2 = UnitHelper.get_unit_from_name('unit1')
UnitPhysicsModule.translation(unit2.unit_table, 0, 0, 100)
-- -- UnitPhysicsModule.set_scale(unit2.unit_table, 0.8)
-- UnitPhysicsModule.set_mirror(unit2.unit_table, 1, 0, 0)

UnitPhysicsModule.rotate_by_euler(unit2.unit_table, 0, 40, 40)
LoggerModule.info("DemoRorate", "finished.")