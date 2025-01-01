--- PowerModule.lua
--- Created by dreamness
--- DateTime: 12/15/2024 11:35 PM

--- 电力模块
PowerModule = {}

--- 获取玩家生产的电力
--- @param player_name PlayerEnum 玩家名
--- @return number
PowerModule.get_player_power_produced = function(player_name)
    if type(player_name) ~= "string" then
        LoggerModule.error("PowerModule.get_player_power_produced", "player_name must be a string")
    end
    return exPlayerGetProducePower(player_name)
end

--- 获取玩家消耗的电力
--- @param player_name PlayerEnum 玩家名
--- @return number
PowerModule.get_player_power_consumed = function(player_name)
    if type(player_name) ~= "string" then
        LoggerModule.error("PowerModule.get_player_power_consumed", "player_name must be a string")
    end
    return exPlayerGetConsumePower(player_name)
end

--- 设置基础电力 (487)
--- @param player_name PlayerEnum
--- @param value number
PowerModule.set_base_power = function(player_name, value)
    if type(player_name) ~= "string" then
        LoggerModule.error("PowerModule.set_base_power", "player_name must be a string")
        return nil
    end
    if type(value) ~= "number" then
        LoggerModule.error("PowerModule.set_base_power", "value must be a number")
        return nil
    end

    return ExecuteAction("PLAYER_SET_BASE_POWER", player_name, value)
end

--- 玩家是否电力充足 [27]
--- @param player_name PlayerEnum
--- @return boolean
PowerModule.is_player_has_power = function(player_name)
    if type(player_name) ~= "string" then
        LoggerModule.error("PowerModule.isPlayerHasPower", "player_name must be a string")
        return nil
    end
    return EvaluateCondition("PLAYER_HAS_POWER", player_name)
end

--- 玩家有富余的电, 比较运算 [63]
--- @param player_name PlayerEnum
--- @param comparison string
--- @param value number
--- @return boolean
PowerModule.power_excess_compare = function(player_name, comparison, value)
    if type(player_name) ~= "string" then
        LoggerModule.error("PowerModule.powerExcessCompare", "player_name must be a string")
        return nil
    end
    if type(comparison) ~= "string" then
        LoggerModule.error("PowerModule.powerExcessCompare", "comparison must be a string")
        return nil
    end
    if type(value) ~= "number" then
        LoggerModule.error("PowerModule.powerExcessCompare", "value must be a number")
        return nil
    end

    return GameModule.from_ra3_boolean(EvaluateCondition("PLAYER_EXCESS_POWER_COMPARE_VALUE", player_name, comparison, value))
end

--- 获取玩家富余电力值
--- @param player_name PlayerEnum
--- @return number
PowerModule.get_player_power_excess = function(player_name)
    if type(player_name) ~= "string" then
        LoggerModule.error("PowerModule.get_player_power_excess", "player_name must be a string")
    end
    return PowerModule.get_player_power_produced(player_name) - PowerModule.get_player_power_consumed(player_name)
end

--- (遗弃的)获取玩家富余电力值 需要确保玩家存在
--- @param player_name PlayerEnum
--- @param last_excess_power number
--- @return number
PowerModule.__deprecated_get_player_power_excess = function(player_name, last_excess_power)
    LoggerModule.debug("PowerModule.__deprecated_get_player_power_excess", "start")
    if type(player_name) ~= "string" then
        LoggerModule.error("PowerModule.__deprecated_get_player_power_excess", "player_name must be a string")
    end
    if last_excess_power == nil then
        last_excess_power = 50
    end
    if type(last_excess_power) ~= "number" then
        LoggerModule.error("PowerModule.__deprecated_get_player_power_excess", "last_excess_power must be a number")
    end

    if PowerModule.power_excess_compare(player_name, "==", last_excess_power) then
        return last_excess_power
    end


    local left_value = last_excess_power
    local right_value = last_excess_power
    local mid_value = last_excess_power

    -- 寻找范围
    if PowerModule.power_excess_compare(player_name, ">", last_excess_power) then
        --LoggerModule.info("PowerModule.get_player_power_excess", "start find right_value")
        repeat
            right_value = right_value + 200
            --LoggerModule.info("PowerModule.get_player_power_excess", "right_value: " .. right_value)
        until PowerModule.power_excess_compare(player_name, "<=", right_value)
        left_value = right_value - 200

        mid_value = right_value
    else
        --LoggerModule.info("PowerModule.get_player_power_excess", "start find left_value")
        repeat
            left_value = left_value - 200
            --LoggerModule.info("PowerModule.get_player_power_excess", "left_value: " .. left_value)
        until PowerModule.power_excess_compare(player_name, ">=", left_value)
        right_value = left_value + 200

        mid_value = left_value
    end

    -- 二分查找
    while PowerModule.power_excess_compare(player_name, "~=", mid_value) do
        mid_value = floor((left_value + right_value) / 2 / 5) * 5 -- 保证是5的倍数
        --LoggerModule.info("PowerModule.get_player_power_excess", "mid_value: " .. mid_value .. ", leftValue: " .. leftValue .. ", rightValue: " .. rightValue)
        if PowerModule.power_excess_compare(player_name, "<", mid_value) then
            right_value = mid_value - 5
        elseif PowerModule.power_excess_compare(player_name, ">", mid_value) then
            left_value = mid_value + 5
        end
    end
    LoggerModule.debug("PowerModule.__deprecated_get_player_power_excess", "done")
    return mid_value
end
