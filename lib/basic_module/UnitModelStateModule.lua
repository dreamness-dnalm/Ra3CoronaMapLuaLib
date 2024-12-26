--- UnitModelStateModule.lua
--- Created by dreamness
--- DateTime: 9/7/2024 3:55 PM
---


UnitModelStateModule = {}

-- todo test
--- 设置单位的模型状态 (547)
--- @param unitName string 单位名
--- @param modelStateName string 模型状态名
--- @param durationSeconds number|nil 持续时间
UnitModelStateModule.addUnitModelState = function(unitName, modelStateName, durationSeconds)
    logger.debug("modelStateFuncs.setUnitModelState", "unitName: " .. tostring(unitName) .. ", modelStateName: " .. tostring(modelStateName) .. ", durationSeconds: " .. tostring(durationSeconds))
    if type(unitName) ~= "string" then
        logger.error("modelStateFuncs.setUnitModelState", "unitName must be a string")
        return
    end
    if type(modelStateName) ~= "string" then
        logger.error("modelStateFuncs.setUnitModelState", "modelStateName must be a string")
        return
    end
    if type(durationSeconds) ~= "number" and type(durationSeconds) ~= nil then
        logger.error("modelStateFuncs.setUnitModelState", "durationSeconds must be a number or nil")
        return
    end
    if durationSeconds == nil then
        ExecuteAction("UNIT_SET_MODELCONDITION_GENERIC", unitName, modelStateName)
    else
        ExecuteAction("UNIT_SET_MODELCONDITION_GENERIC", unitName, modelStateName, durationSeconds)
    end
    logger.debug("modelStateFuncs.setUnitModelState", "end")
end

-- todo test
--- 移除单位的模型状态 (328)
--- @param unitName string 单位名
--- @param modelStateName string 模型状态名
UnitModelStateModule.removeUnitModelState = function(unitName, modelStateName)
    logger.debug("modelStateFuncs.removeUnitModelState", "unitName: " .. tostring(unitName) .. ", modelStateName: " .. tostring(modelStateName))
    if type(unitName) ~= "string" then
        logger.error("modelStateFuncs.removeUnitModelState", "unitName must be a string")
        return
    end
    if type(modelStateName) ~= "string" then
        logger.error("modelStateFuncs.removeUnitModelState", "modelStateName must be a string")
        return
    end
    ExecuteAction("UNIT_CLEAR_MODELCONDITION", unitName, modelStateName)
    logger.debug("modelStateFuncs.removeUnitModelState", "end")
end