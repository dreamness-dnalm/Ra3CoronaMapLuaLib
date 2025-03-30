--- UnitHealthModule.lua
--- Created by dreamness
--- DateTime: 10/21/2024 08:22 PM

--- 单位生命值模块
UnitHealthModule = {}

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

--- 获取单位的最大生命值
--- @param unit_table number 单位id
--- @return number
UnitHealthModule.get_max_health = function(unit_table)
    if type(unit_table) ~= "number" then
        LoggerModule.error('UnitHealthModule.get_max_health', 'unit_table should be table')
        return
    end
    return ObjectGetInitialHealth(unit_table)
end

--- 设置单位的最大生命值 ((551))
--- @param unit_name string 单位名
--- @param max_health number 最大生命值
UnitHealthModule.set_max_health = function(unit_name, max_health)
    if type(unit_name) ~= "string" then
        LoggerModule.error('UnitHealthModule.set_max_health', 'unit_name should be string')
        return
    end
    if type(max_health) ~= "number" then
        LoggerModule.error('UnitHealthModule.set_max_health', 'max_health should be number')
        return
    end
    ExecuteAction("NAMED_SET_MAX_HEALTH", unit_name, max_health, GameModule.to_ra3_boolean(nil))
end

--- 设置单位生命值百分比 (486)
--- @param unit_name string 
--- @param percentage number 百分比
UnitHealthModule.set_unit_health_percentage = function(unit_name, percentage)
    if type(unit_name) ~= "string" then
        LoggerModule.error('UnitHealthModule.set_unit_health_percentage', 'unit_name should be string')
        return
    end
    if type(percentage) ~= "number" then
        LoggerModule.error('UnitHealthModule.set_unit_health_percentage', 'percentage should be number')
        return
    end
    ExecuteAction("UNIT_SET_HEALTH", unit_name, percentage)
end

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

--- 杀死单位 (67)
--- @param unit_name_or_table SystemUnitTable|string
UnitHealthModule.kill_unit = function(unit_name_or_table)
    if type(unit_name_or_table) ~= "table" then
        LoggerModule.error('UnitHealthModule.kill_unit', 'unit_name_or_table should be table')
        return
    end
    ExecuteAction("NAMED_KILL", unit_name_or_table)
end

--- 注册单位死亡事件
--- @param thing ThingEnum
UnitHealthModule.register_unit_die_event = function(thing)
    if type(thing) ~= "string" then
        LoggerModule.error("UnitHealthModule.register_unit_die_event", "thing must be a string")
        return
    end
    exObjectRegisterDieEvent(thing)
end

--- 注册单位死亡事件回调
--- @param func function func(dying_object_id, attacker_object_id, dying_object_instance_id, attacker_object_instance_id, owner_player_name)
--- dying_object_id 即将死亡的物体id
--- attacker_object_id 攻击者id 注意不一定有攻击者，这时这个参数是nil
--- dying_object_instance_id 死亡物体的InstanceId  (每种单位都有唯一的InstanceId)
--- attacker_object_instance_id 攻击者的InstanceId  注意不一定有攻击者，这时这个参数是nil
UnitHealthModule.register_die_event_callback = function(func)
    if type(func) ~= "function" then
        LoggerModule.error("UnitHealthModule.register_die_event_callback", "func must be a function")
        return
    end
    globals().onUnitDieEvent = func
end