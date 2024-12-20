--- SpecialPowerModule
--- Created by dreamness
--- DateTime: 2024/11/24 23:42
---

SpecialPowerModule = {}

-- TODO: test
--- 特殊能力是否准备好了 [64]
--- @param player_name string 玩家名
--- @param special_power_name SpecialPowerEnum 特殊能力名
SpecialPowerModule.is_ready = function(player_name, special_power_name)
    if type(player_name) ~= "string" then
        LoggerModule.error("SpecialPowerModule.is_ready", "player_name must be a string")
    end
    if type(special_power_name) ~= "string" then
        LoggerModule.error("SpecialPowerModule.is_ready", "special_power_name must be a string")
    end
    return EvaluateCondition("SKIRMISH_SPECIAL_POWER_READY", player_name, special_power_name)
end

