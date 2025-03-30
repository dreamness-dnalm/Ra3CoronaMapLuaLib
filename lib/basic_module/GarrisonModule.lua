--- GarrisonModule.lua
--- Created by dreamness
--- DateTime: 9/7/2024 3:26 PM
---

GarrisonModule = {}

--- 使单位进入另一个单位 ((428))
--- @param parent_unit_name string
--- @param child_unit_name string
GarrisonModule.garrison = function(parent_unit_name, child_unit_name)
    -- LoggerModule.debug("GarrisonModule.garrison", "parent_unit_name: " .. tostring(parent_unit_name) .. ", child_unit_name: " .. tostring(child_unit_name))
    if type(parent_unit_name) ~= "string" then
        LoggerModule.error("GarrisonModule.garrson", "parent_unit_name must be a string")
        return
    end
    if type(child_unit_name) ~= "string" then
        LoggerModule.error("GarrisonModule.garrson", "child_unit_name must be a string")
        return
    end
    ExecuteAction("NAMED_GARRISON_SPECIFIC_BUILDING_INSTANTLY", child_unit_name, parent_unit_name)
    -- LoggerModule.debug("GarrisonModule.garrison", "end")
end

--- 清空建筑 ((91))
--- @param parent_unit_name string
GarrisonModule.empty = function(parent_unit_name)
    -- LoggerModule.debug("GarrisonModule.empty", "parent_unit_name: " .. tostring(parent_unit_name))
    if type(parent_unit_name) ~= "string" then
        LoggerModule.error("GarrisonModule.empty", "parent_unit_name must be a string")
        return
    end
    ExecuteAction("EXIT_SPECIFIC_BUILDING", parent_unit_name)
    -- LoggerModule.debug("GarrisonModule.empty", "end")
end

--- 使单位离开建筑 (96)
--- @param child_unit_name_or_table string | SystemUnitTable
GarrisonModule.leave = function(child_unit_name_or_table)
    if type(child_unit_name_or_table) ~= "string" and type(child_unit_name_or_table) ~= 'table' then
        LoggerModule.error("GarrisonModule.leave", "child_unit_name_or_table must be a string or table")
        return
    end
    ExecuteAction("NAMED_EXIT_BUILDING", child_unit_name_or_table)
    -- LoggerModule.debug("GarrisonModule.leave", "end")
end

--- 获取单位的父单位
--- @param child_unit_table table
--- @return SystemUnitTable
GarrisonModule.get_parent_unit = function(child_unit_table)
    -- LoggerModule.debug("GarrisonModule.get_parent_unit", "child_unit_table: " .. tostring(child_unit_table))
    if type(child_unit_table) ~= "table" then
        LoggerModule.error("GarrisonModule.get_parent_unit", "child_unit_table must be a table")
        return nil
    end
    local ret = ObjectGetContainerObject(child_unit_table)
    -- LoggerModule.debug("GarrisonModule.get_parent_unit", "end")
    return ret
end

--- 获取单位的子单位
--- @param parent_unit_table table
--- @return Unit[] units, number cnt
GarrisonModule.get_child_units = function(parent_unit_table)
    -- LoggerModule.debug("GarrisonModule.get_child_units", "parent_unit_table: " .. tostring(parent_unit_table))
    if type(parent_unit_table) ~= "table" then
        LoggerModule.error("GarrisonModule.get_child_units", "parent_unit_table must be a table")
        return nil, 0
    end
    local ret1, ret2 = ObjectGetContainedPassengers(parent_unit_table)
    -- LoggerModule.debug("GarrisonModule.get_child_units", "end")
    return ret1, ret2
end
