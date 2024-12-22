--- AttributeModifierModule.lua
--- Created by dreamness
--- DateTime: 8/9/2024 11:49 PM
---

--- buff属性
AttributeModifierModule = {}

AttributeModifierModule.__attributeModifierObjectCache = {}

---添加属性修改器
--- @param unit_table SystemUnitTable 单位
--- @param modifiers AttributeModifierEnum | AttributeModifierEnum[] 修改器数组
--- @param frame_cnt number 帧数
AttributeModifierModule.add_modifier = function (unit_table, modifiers, frame_cnt)
    if type(unit_table) ~= "table" then
        LoggerModule.error("AttributeModifierModule.add_Modifier", "unit_table should be table")
        return
    end
    if type(modifiers) ~= "table" and type(modifiers) ~= 'string' then
        LoggerModule.error("AttributeModifierModule.add_Modifier", "modifiers should be table or string")
        return
    end

    local m = modifiers
    if type(m) == 'string' then
        m = {m}
    end

    for i = 1, getn(m) do
        local modifier = m[i]
        if frame_cnt == nil or frame_cnt <= 0 then
            ObjectLoadAttributeModifier(unit_table, modifier)
        else
            ObjectLoadAttributeModifier(unit_table, modifier, frame_cnt)
        end
    end
end

-- TODO: test
---移除属性修改器
--- @param unit_table SystemUnitTable 单位
--- @param modifiers AttributeModifierEnum | AttributeModifierEnum[] 修改器数组
AttributeModifierModule.remove_modifier = function (unit_table, modifiers)
    if type(unit_table) ~= "table" then
        LoggerModule.error("AttributeModifierModule.remove_modifier", "unit_table should be table")
        return
    end
    if type(modifiers) ~= "table" or type(modifiers) ~= 'string' then
        LoggerModule.error("AttributeModifierModule.remove_modifier", "modifiers should be table or string")
        return
    end

    local m = modifiers
    if type(modifiers) == 'string' then
        m = {modifiers}
    end

    for i = 1, getn(m) do
        local modifier = m[i]
        ObjectUnloadAttributeModifier(unit_table, modifier)
    end
end

-- -- TODO: test
-- --- 获取AttributeModifier对象
-- --- @param attribute_modifier_name AttributeModifierEnum 属性修改器名称
-- AttributeModifierModule.get_attribute_modifier_object = function(attribute_modifier_name)
--     if type(attribute_modifier_name) ~= 'string' then
--         LoggerModule.error("AttributeModifierModule.get_attribute_modifier_object", "attribute_modifier_name should be string")
--         return nil
--     end
--     return FindAttributeModifier(attribute_modifier_name)
-- end


-- -- TODO: test
-- --- 查询某个属性及加成, 反复查询 AttributeModifier 可能比较消耗性能, 因此可以提前获取 AttributeModifier 对象，然后反复使用。
-- --- @param unit_table table 单位
-- --- @param attribute_name AttributeModifierEnum 属性名称
-- --- @param ignore_modifier_names AttributeModifierEnum[] 忽略的 buff/debuff属性名称
-- --- @return number 属性值, 无加成会返回 1。假如有 20% 的加成，会返回 1.2。假如出现错误会返回 nil
-- AttributeModifierModule.get_add_rate = function(unit_table, attribute_name, ignore_modifier_names)
--     if type(unit_table) ~= "table" then
--         LoggerModule.error("AttributeModifierModule.get_add_rate", "unit_table should be table")
--         return nil
--     end
--     if type(attribute_name) ~= "string" then
--         LoggerModule.error("AttributeModifierModule.get_add_rate", "attribute_name should be string")
--         return nil
--     end
--     if type(ignore_modifier_names) ~= "table" then
--         LoggerModule.error("AttributeModifierModule.get_add_rate", "ignore_modifier_names should be table")
--         return nil
--     end

--     local ignore_modifiers = {}
--     for i = 1, getn(ignore_modifier_names) do
--         local modifier_name = ignore_modifier_names[i]
--         -- 如果获取不到modifier对象, 则在对象缓存中存储'-1', 保证以后不再重试
--         if modifier_name ~= nil then
--             if AttributeModifierModule.__attributeModifierObjectCache[modifier_name] == nil then
--                 local obj = AttributeModifierModule.get_attribute_modifier_object(modifier_name)
--                 if obj == nil then
--                     AttributeModifierModule.__attributeModifierObjectCache[modifier_name] = -1
--                 else
--                     AttributeModifierModule.__attributeModifierObjectCache[modifier_name] = obj
--                 end
--             end
--             if AttributeModifierModule.__attributeModifierObjectCache[modifier_name] ~= -1 then
--                 ignore_modifiers[modifier_name] = AttributeModifierModule.__attributeModifierObjectCache[modifier_name]
--             end
--         end
--     end
--     return ObjectGetAttributeModifier(unit_table, attribute_name, ignore_modifier_names)
-- end
