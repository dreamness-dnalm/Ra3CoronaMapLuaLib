--- Unit.lua
--- Created by dreamness
--- DateTime: 10/14/2024 11:27 PM
---

--- 单位对象
--- @class Unit
--- @field id number
--- @field name string
--- @field unit_table SystemUnitTable
Unit = {}

-- ------ 单位所属 --------

--- 获取所属玩家, 不能再第一帧调用!
--- @return PlayerEnum
function Unit:get_owner_player()
    return PlayerModule.get_player_name(self.unit_table)
end

-- TODO: test
--- 设置所属玩家
--- @param player_name PlayerEnum
function Unit:set_owner_player(player_name)
    UnitModule.set_owner_player(self.unit_table, player_name)
end

-- -------- 单位基本操作 --------

-- TODO: test
--- 删除单位
function Unit:delete()
    UnitModule.delete(self.unit_table)
end

-- TODO: test
--- 判断单位是否存活
--- @return boolean
function Unit:is_alive()
    return UnitModule.alive(self.unit_table)
end

-- -------- 单位使用技能 ---------

-- TODO: test
--- 单位使用技能
--- @param ability_name AbilityEnum 技能名
function Unit:use_ability(ability_name)
    if type(ability_name) ~= "string" then
        LoggerModule.error("Unit:use_ability", "ability_name must be a string")
    end
    AbilityModule.unit_use_ability(self.unit_table, ability_name)
end

-- TODO: test
--- 单位使用技能在指定路径点
--- @param ability_name AbilityEnum 技能名
--- @param waypoint string 路径点
function Unit:use_ability_at_waypoint(ability_name, waypoint)
    if type(ability_name) ~= "string" then
        LoggerModule.error("Unit:use_ability_at_waypoint", "ability_name must be a string")
    end
    if type(waypoint) ~= "string" then
        LoggerModule.error("Unit:use_ability_at_waypoint", "waypoint must be a string")
    end
    AbilityModule.unit_use_ability_at_waypoint(self.unit_table, ability_name, waypoint)
end

-- TODO: test
--- 单位使用技能在指定单位, 需要指定单位名字!!
--- @param ability_name AbilityEnum 技能名
--- @param target_unit Unit 目标单位
function Unit:use_ability_on_unit(ability_name, target_unit)
    if type(ability_name) ~= "string" then
        LoggerModule.error("Unit:use_ability_on_unit", "ability_name must be a string")
    end
    if target_unit == nil then
        LoggerModule.error("Unit:use_ability_on_unit", "target_unit must be a Unit")
    end
    if type(target_unit.name) ~= "string" then
        LoggerModule.error("Unit:use_ability_on_unit", "target_unit.name must be a string")
    end
    if type(self.name) ~= "string" then
        LoggerModule.error("Unit:use_ability_on_unit", "self.name must be a string")
    end
    AbilityModule.unit_use_ability_on_unit(self.name, ability_name, target_unit.name)
end

-- -------- 单位状态 --------

--- 设置单位状态
--- @param status StatusEnum|StatusEnum[] 状态 或 状态数组
function Unit:add_status(statuses)
    if type(statuses) ~= 'table' and type(statuses) ~= 'string' then
        LoggerModule.error('Unit:add_status', 'statuses type error: ' .. type(statuses))
        return
    end
    StatusModule.unit_change_status(self.unit_table, statuses, 1)
end

-- TODO: test
--- 移除单位状态
--- @param status StatusEnum|StatusEnum[] 状态 或 状态数组
function Unit:remove_status(statuses)
    if type(statuses) ~= 'table' and type(statuses) ~= 'string' then
        LoggerModule.error('Unit:remove_status', 'statuses type error: ' .. type(statuses))
        return
    end
    StatusModule.unit_change_status(self.unit_table, statuses, nil)
end

-- TODO: test
--- 判断单位是否拥有状态
--- @param status StatusEnum 状态
--- @return boolean
function Unit:is_has_status(status)
    return StatusModule.is_unit_has_status(self.unit_table, status)
end

-- ------ 单位属性修改器(BUFF) -------

-- TODO: test
--- 添加BUFF
--- @param modifiers AttributeModifierEnum | AttributeModifierEnum[] 修改器数组
--- @param frame_cnt number 帧数
function Unit:add_modifier(modifiers, frame_cnt)
    if type(modifiers) ~= 'table' and type(modifiers) ~= 'string' then
        LoggerModule.error('Unit:add_Modifier', 'modifiers type error: ' .. type(modifiers))
        return
    end
    AttributeModifierModule.add_modifier(self.unit_table, modifiers, frame_cnt)
end

-- TODO: test
--- 移除BUFF
--- @param modifiers AttributeModifierEnum | AttributeModifierEnum[] 修改器数组
function Unit:remove_modifier(modifiers)
    if type(modifiers) ~= 'table' and type(modifiers) ~= 'string' then
        LoggerModule.error('Unit:remove_modifier', 'modifiers type error: ' .. type(modifiers))
        return
    end
    AttributeModifierModule.remove_modifier(self.unit_table, modifiers)
end


-- --------- 未归类 -----------

-- TODO: test
--- 在单位上方添加或更新文字
--- @param content string 文字内容
--- @param z_offset number z轴偏移量
function Unit:set_top_text(content, z_offset, color)
    UnitTopTextModule.set_or_update(self.id, content, z_offset, color)
end

-- TODO: test
--- 删除单位顶部文字
function Unit:remove_top_text()
    UnitTopTextModule.remove(self.id)
end

-- TODO: test
--- 判断两个unit是否为同一个单位
--- @param other_unit Unit
--- @return boolean
function Unit:equals(other_unit)
    if other_unit == nil then
        return nil
    end
    return self.id == other_unit.id
end

-- TODO: test
--- 获取单位坐标
--- @return number, number, number x, y, z
function Unit:get_position()
    return UnitPhysicsModule.get_position(self.unit_table)
end

-- TODO: test
--- 设置单位坐标
--- @param x number x
--- @param y number y
--- @param z number|nil z, 可以缺省为nil
function Unit:set_position(x, y, z)
    UnitPhysicsModule.set_position(self.unit_table, x, y, z)
end

-- TODO: test
--- 获取与另一个单位的2D距离
--- @param other_unit Unit
--- @return number
function Unit:get_distance_2d(other_unit)
    return UnitPhysicsModule.get_distance_2D(self.unit_table, other_unit.unit_table)
end

-- TODO: test
--- 获取与另一个单位的3D距离
--- @param other_unit Unit
--- @return number
function Unit:get_distance_3D(other_unit)
    return UnitPhysicsModule.get_distance_3D(self.unit_table, other_unit.unit_table)
end

-- TODO: test
--- 使单位面向路径点
--- @param waypoint_name string 路径点名字
function Unit:fact_to_waypoint(waypoint_name)
    UnitPhysicsModule.face_to_waypoint(self.unit_table, waypoint_name)
end

-- TODO: test
--- 使单位面向另一个单位
--- @param other_unit Unit
function Unit:face_to_unit__require_name(other_unit)
    UnitPhysicsModule.face_to_unit(self.name, other_unit.name)
end

-- TODO: test
--- 设置单位旋转角度
--- @param x_angle number x轴角度
--- @param y_angle number y轴角度
--- @param z_angle number z轴角度
function Unit:set_rotate(x_angle, y_angle, z_angle)
    UnitPhysicsModule.set_rotate(self.unit_table, x_angle, y_angle, z_angle)
end






