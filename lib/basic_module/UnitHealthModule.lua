--- UnitHealthModule.lua
--- Created by dreamness
--- DateTime: 10/21/2024 08:22 PM

--- 单位生命值模块
UnitHealthModule = {}

-- TODO: test
--- 获取单位的生命值
--- @param unit_table SystemUnitTable 单位table
--- @return number
UnitHealthModule.get_health = function(unit_table)
    if type(unit_table) ~= "table" then
        LoggerModule.error('UnitHealthModule.get_health', 'unit_table should be table')
        return
    end
    return ObjectGetCurrentHealth(unit_table)
end

-- TODO: test
--- 获取单位的初始生命值
--- @param unit_table SystemUnitTable 单位table
--- @return number
UnitHealthModule.get_initial_health = function(unit_table)
    if type(unit_table) ~= "table" then
        LoggerModule.error('UnitHealthModule.get_initial_health', 'unit_table should be table')
        return
    end
    return ObjectGetInitialHealth(unit_table)
end

-- TODO: test, package
--- 设置单位生命值百分比 [489]
--- @param unit_name_or_table SystemUnitTable|string 
--- @param percentage number 百分比
UnitHealthModule.set_unit_health_percentage = function(unit_name_or_table, percentage)
    if type(unit_name_or_table) ~= "table" and type(unit_name_or_table) ~= "string" then
        LoggerModule.error('UnitHealthModule.set_unit_health_percentage', 'unit_name_or_table should be table or string')
        return
    end
    if type(percentage) ~= "number" then
        LoggerModule.error('UnitHealthModule.set_unit_health_percentage', 'percentage should be number')
        return
    end
    ExecuteAction("SET_UNIT_HEALTH_PERCENTAGE_TO_COUNTER", unit_name_or_table, percentage)
end

-- TODO: test
--- 设置单位生命值
--- @param unit_table SystemUnitTable
--- @param health number
UnitHealthModule.set_unit_health = function(unit_table, health)
    if type(unit_table) ~= "table" then
        LoggerModule.error('UnitHealthModule.set_unit_health', 'unit_table should be table')
        return
    end
    if type(health) ~= "number" then
        LoggerModule.error('UnitHealthModule.set_unit_health', 'health should be number')
        return
    end
    local initialHealth = UnitHealthModule.get_initial_health(unit_table)
    local healthPercentage = floor(health / initialHealth * 100)
    UnitHealthModule.set_unit_health_percentage(healthPercentage)
end

-- TODO: test
--- 单位承受伤害 (63)
--- @param unit_name_or_table SystemUnitTable|string
--- @param point number
UnitHealthModule.unit_suffer_damage = function(unit_name_or_table, point)
    if type(unit_name_or_table) ~= "table" and type(point) ~= 'number' then
        LoggerModule.error('UnitHealthModule.unit_suffer_damage', 'unit_name_or_table should be table or string')
        return
    end
    if type(point) ~= 'number' then
        LoggerModule.error('UnitHealthModule.unit_suffer_damage', 'point should be number')
        return
    end

    ExecuteAction("NAMED_DAMAGE", unit_name_or_table, point)
end

-- TODO: test
--- 杀死单位 (67)
--- @param unit_name_or_table SystemUnitTable|string
UnitHealthModule.kill_unit = function(unit_name_or_table)
    if type(unit_name_or_table) ~= "table" then
        LoggerModule.error('UnitHealthModule.kill_unit', 'unit_name_or_table should be table')
        return
    end
    ExecuteAction("NAMED_KILL", unit_name_or_table)
end
