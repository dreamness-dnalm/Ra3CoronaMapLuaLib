--- ProductionQueueModule.lua
--- Created by dreamness
--- DateTime: 12/15/2024 03:15 PM

--- 生产队列模块
ProductionQueueModule = {}

--- @class ProductionQueueItemTypeEnum
ProductionQueueItemTypeEnum = {
    Object = "Object",
    Upgrade = "Upgrade"
}

--- @class ProductionQueueItem
--- @field Type ProductionQueueItemTypeEnum
--- @field InstanceId number 正在建造的单位或者升级的哈希值, 使用GameModule.get_string_fast_hash获取
--- @field ProductionPercentage number 0-100
--- @field ProductionFrames number
--- @field BuildCost number

--- @class ProductionQueueInfo
--- @field Id number
--- @field ModuleId number XML 里模块 ID 的哈希值, 使用GameModule.get_string_fast_hash获取
--- @field QueueLength number
--- @field Queue ProductionQueueItem[]


--- 获取生产队列
--- @param unit_table SystemUnitTable 单位table
--- @return ProductionQueueInfo[] 生产队列列表, number 队列数量
ProductionQueueModule.get_queues = function(unit_table)
    LoggerModule.debug("ProductionQueueModule.get_queues", "start")
    if type(unit_table) ~= "table" then
        LoggerModule.error("ProductionQueueModule.get_queues", "unit_table must be a table, but " .. type(unit_table) .. " given")
    end

    local productions, count = ObjectGetProductionQueues(unit_table)
    LoggerModule.debug("ProductionQueueModule.get_queues", "end")
    -- 插件bug, 如果不这样写无法正常类型标注

    --- @type ProductionQueueInfo[]
    local ret1 = productions
    --- @type number
    local ret2 = count    
    return ret1, ret2
end

