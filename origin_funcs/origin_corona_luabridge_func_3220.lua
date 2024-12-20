--- origin_corona_luabridge_func_3220.lua
--- Created by dreamness
--- DateTime: 12/15/2024 02:58 AM

-- TODO: test, package
-- 检测当前单位的目标是否是右键目标
-- 更严谨的说法是，检测单位当前的目标是否是单位 AI 索敌模块的右键目标
-- 假如单位没有目标，或者单位 AI 没有索敌模块，或者单位索敌模块没有右键目标，会返回 nil
-- 假如单位目标与右键目标不同，也会返回 nil
-- 假如单位目标就是单位 AI 索敌模块的右键目标，会返回 1
--- @param unit_table SystemUnitTable
--- @return boolean
function ObjectIsTargetAssignedTarget(unit_table) end

-- TODO: test, package
--- 设置单位索敌时的自定义数据
--- 但是它不会影响当前的目标，也不会影响右键目标
--- 因此，设置了这个过滤器之后，可能需要手动重置目标，
--- 或者在 XML 里设置较短的 ReAcquireDelay，迫使单位重新索敌
--- @param unit_table SystemUnitTable
--- @param config_table table 包含字段: CustomFilter(可选：自定义索敌过滤器，不符合该过滤器的单位不会被索敌到), PreferredTargetId(优先索敌目标的 id), CompareFilterList(可选：自定义索敌排序器，符合这些过滤器的单位会按照列表中的顺序被优先索敌)
function ObjectSetCustomTargetChooserData(unit_table, config_table) end

-- TODO: test, package
--- 设置单位的目标为右键目标
--- 这个函数可能造成不可预料的副作用，请谨慎使用
--- @param unit_table SystemUnitTable
--- @param target_unit_table SystemUnitTable|nil 如果为 nil，会清除目标
function ObjectSetAssignedTarget(unit_table, target_unit_table) end

-- TODO: test, package
--- 每一次调用，都会返回从上一次调用到这次调用的时间间隔，单位是纳秒
--- @return number
function HighResolutionClock() end

--- @class SystemVirtualDamageTable
--- @field AttackerId number
--- @field projectileId number
--- @field damage number
--- @field startFrame number
--- @field durationInFrames number

-- TODO: test, package
--- 获取单位的虚拟伤害（对于支持虚拟伤害的攻击者，用于避免、或故意造成火力溢出）, 目标必须拥有 ActiveBody 或者其他支持伤害的 Body 组件
--- @param unit_table SystemUnitTable
--- @return SystemVirtualDamageTable
function ObjectGetVirtualDamages(unit_table) end

-- TODO: test, package
--- 设置并替换单位的虚拟伤害
--- @param unit_table SystemUnitTable
--- @param virtual_damage_list SystemVirtualDamageTable[]
function ObjectSetVirtualDamages(unit_table, virtual_damage_list) end

-- TODO: test, package
--- 添加单位的虚拟伤害
--- @param unit_table SystemUnitTable
--- @param virtual_damage SystemVirtualDamageTable
function ObjectAddVirtualDamage(unit_table, virtual_damage) end