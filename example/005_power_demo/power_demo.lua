--- power_demo.lua
--- Created by dreamness
--- DateTime: 12/31/2024 11:56 AM


LoggerModule.setup(LoggerLevelEnum.INFO, {LoggerTargetEnum.PUBLIC_BOARD})

LoggerModule.info("DemoPower", "Power Consumed: " .. tostring(PowerModule.get_player_power_consumed(PlayerEnum.Player_1)))
LoggerModule.info("DemoPower", "Power Produced: " .. tostring(PowerModule.get_player_power_produced(PlayerEnum.Player_1)))
LoggerModule.info("DemoPower", "Is Power Enough: " .. tostring(PowerModule.is_player_has_power(PlayerEnum.Player_1)))
LoggerModule.info("DemoPower", "Power Excess: " .. tostring(PowerModule.get_player_power_excess(PlayerEnum.Player_1, nil)))

PowerModule.set_base_power(PlayerEnum.Player_1, 1000)
LoggerModule.info("DemoPower", "AFTER SET BASE POWER")

LoggerModule.info("DemoPower", "Power Consumed: " .. tostring(PowerModule.get_player_power_consumed(PlayerEnum.Player_1)))
LoggerModule.info("DemoPower", "Power Produced: " .. tostring(PowerModule.get_player_power_produced(PlayerEnum.Player_1)))
LoggerModule.info("DemoPower", "Is Power Enough: " .. tostring(PowerModule.is_player_has_power(PlayerEnum.Player_1)))
