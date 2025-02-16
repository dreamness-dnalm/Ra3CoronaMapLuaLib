--- UnitModelStateModule.lua
--- Created by dreamness
--- DateTime: 9/7/2024 3:55 PM
---


UnitModelStateModule = {}

--- 设置单位的模型状态 (547)
--- @param unit_name_table string|SystemUnitTable 单位名
--- @param model_state_name string 模型状态名
--- @param duration_seconds number|nil 持续时间
UnitModelStateModule.add_unit_model_state = function(unit_name_table, model_state_name, duration_seconds)
    -- LoggerModule.debug("UnitModelStateModule.setUnitModelState", "unitName: " .. tostring(unit_name) .. ", modelStateName: " .. tostring(model_state_name) .. ", durationSeconds: " .. tostring(duration_seconds))
    if type(unit_name_table) ~= "string" and type(unit_name_table) ~= 'table' then
        LoggerModule.error("UnitModelStateModule.add_unit_model_state", "unit_name must be a string or table")
        return
    end
    if type(model_state_name) ~= "string" then
        LoggerModule.error("UnitModelStateModule.add_unit_model_state", "model_state_name must be a string")
        return
    end
    if type(duration_seconds) ~= "number" and type(duration_seconds) ~= nil then
        LoggerModule.error("UnitModelStateModule.add_unit_model_state", "duration_seconds must be a number or nil")
        return
    end
    if duration_seconds == nil then
        ExecuteAction("UNIT_SET_MODELCONDITION_GENERIC", unit_name_table, model_state_name)
    else
        ExecuteAction("UNIT_SET_MODELCONDITION_GENERIC", unit_name_table, model_state_name, duration_seconds)
    end
    -- LoggerModule.debug("UnitModelStateModule.add_unit_model_state", "end")
end

--- 移除单位的模型状态 (328)
--- @param unit_name_or_table string|SystemUnitTable 单位名
--- @param model_state_name string 模型状态名
UnitModelStateModule.remove_unit_model_state = function(unit_name_or_table, model_state_name)
    -- LoggerModule.debug("UnitModelStateModule.remove_unit_model_state", "unitName: " .. tostring(unitName) .. ", modelStateName: " .. tostring(modelStateName))
    if type(unit_name_or_table) ~= "string" and type(unit_name_or_table) ~= 'table' then
        LoggerModule.error("UnitModelStateModule.remove_unit_model_state", "unit_name must be a string or table")
        return
    end
    if type(model_state_name) ~= "string" then
        LoggerModule.error("UnitModelStateModule.remove_unit_model_state", "model_state_name must be a string")
        return
    end
    ExecuteAction("UNIT_CLEAR_MODELCONDITION", unit_name_or_table, model_state_name)
    -- LoggerModule.debug("UnitModelStateModule.remove_unit_model_state", "end")
end