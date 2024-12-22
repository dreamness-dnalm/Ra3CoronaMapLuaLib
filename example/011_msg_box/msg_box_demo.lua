--- msg_box_demo.lua
--- Created by dreamness
--- DateTime: 12/22/2024 19:05 PM

LoggerModule.setup(LoggerLevelEnum.DEBUG, {LoggerTargetEnum.PUBLIC_BOARD})

MsgBoxModule.show_msg_caption("MSG:TITLE", 10, nil)

UnitHelper.get_unit_from_name('test_unit')
    :show_msg_box("MSG:UNIT_MSG", 10, ButtonTextureEnum.Button_AlliedAntiGroundAircraft_on)

SchedulerModule.delay_call(function()
    UnitHelper.get_unit_from_name('test_unit'):remove_msg_box()
end, 15 * 5)

local unit1 = UnitHelper.get_unit_from_name('test_unit')
unit1:set_name('test_unit2')
LoggerModule.info("MsgBoxDemo", tostring(UnitHelper.get_unit_from_name('test_unit').id))
LoggerModule.info("MsgBoxDemo", tostring(UnitHelper.get_unit_from_name('test_unit2').id))
    