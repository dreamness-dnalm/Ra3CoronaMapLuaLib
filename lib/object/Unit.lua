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
-- ---- 系统 -----

-- TODO: test
--- 给单位命名
--- @param name string
function Unit:set_name(name)
    if type(name) ~= "string" then
        LoggerModule.error("Unit:set_name", "name must be a string")
    end
    UnitModule.name_unit(self.unit_table, name)
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

-- ------ 单位所属 --------

--- 获取所属玩家, 不能再第一帧调用!
--- @return PlayerEnum
function Unit:get_owner_player()
    return PlayerModule.get_player_name(self.unit_table)
end

--- 设置所属玩家
--- @param player_name PlayerEnum
function Unit:set_owner_player(player_name)
    UnitModule.set_owner_player(self.unit_table, player_name)
end

-- TODO: test
--- 单位是否被玩家所建造
--- @param player_name PlayerEnum
--- @return boolean
function Unit:is_build_by_player(player_name)
    if type(player_name) ~= "string" then
        LoggerModule.error("Unit:is_build_by_player", "player_name must be a string")
    end
    return UnitModule.is_built_by_player(self.unit_table, player_name)
end


-- -------- 单位存活 --------

--- 删除单位
function Unit:delete()
    UnitModule.delete(self.unit_table)
end

--- 判断单位是否存活
--- @return boolean
function Unit:is_alive()
    return UnitModule.alive(self.unit_table)
end

-- -------- 单位使用技能 ---------

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

-- ------ 单位健康 -------

-- TODO: test
--- 获取单位的生命值
--- @return number
function Unit:get_health()
    return UnitHealthModule.get_health(self.unit_table)
end

-- TODO: test
--- 获取单位的初始生命值
--- @return number
function Unit:get_initial_health()
    return UnitHealthModule.get_initial_health(self.unit_table)
end

-- TODO: test
--- 设置单位生命值
--- @param health number
function Unit:set_health(health)
    UnitHealthModule.set_unit_health(self.unit_table, health)
end

-- TODO: test
--- 单位承受伤害
--- @param point number
function Unit:suffer_damage(point)
    UnitHealthModule.unit_suffer_damage(self.unit_table, point)
end

-- ------- 武器 ----------

--- 使用临时武器开火
--- @param weapon_name WeaponEnum 武器名字
--- @param x number 目标位置x
--- @param y number 目标位置y
--- @param z number 目标位置z
--- @param target_unit Unit|nil 目标单位table
function Unit:fire_with_temp_weapon(weapon_name, x, y, z, target_unit)
    if type(weapon_name) ~= "string" then
        LoggerModule.error("Unit:fire_with_temp_weapon", "weapon_name must be a string")
    end
    if type(x) ~= "number" or type(y) ~= "number" or type(z) ~= "number" then
        LoggerModule.error("Unit:fire_with_temp_weapon", "x, y, z must be a number")
    end
    if target_unit ~= nil and type(target_unit) ~= "table" then
        LoggerModule.error("Unit:fire_with_temp_weapon", "target_unit must be a table or nil")
    end
    if target_unit == nil then
        UnitWeaponMododule.fire_with_temp_weapon(self.unit_table, weapon_name, x, y, z, nil)
    else
        UnitWeaponMododule.fire_with_temp_weapon(self.unit_table, weapon_name, x, y, z, target_unit.unit_table)
    end
end

-- TODO: test
--- 设置单位武器弹药量
--- @param weapon_slot_id number 武器槽位id
--- @param weapon_ording number 武器排序
--- @param weapon_index number 武器索引
--- @param ammo_cnt number 弹药数量
function Unit:set_weapon_ammo_cnt(weapon_slot_id, weapon_ording, weapon_index, ammo_cnt)
    if type(weapon_slot_id) ~= "number" then
        LoggerModule.error("Unit:set_weapon_ammo_cnt", "weapon_slot_id must be a number")
        return
    end
    if type(weapon_ording) ~= "number" then
        LoggerModule.error("Unit:set_weapon_ammo_cnt", "weapon_ording must be a number")
        return
    end
    if type(weapon_index) ~= "number" then
        LoggerModule.error("Unit:set_weapon_ammo_cnt", "weapon_index must be a number")
        return
    end
    if type(ammo_cnt) ~= "number" then
        LoggerModule.error("Unit:set_weapon_ammo_cnt", "ammo_cnt must be a number")
        return
    end
    UnitWeaponMododule.set_weapon_ammo_cnt(self.unit_table, weapon_slot_id, weapon_ording, weapon_index, ammo_cnt)
end

-- TODO: test
--- 获取单位武器弹药量
--- @param weapon_slot_id number 武器槽位id
--- @param weapon_ording number 武器排序
--- @param weapon_index number 武器索引
--- @return number 弹药数量
function Unit:get_weapon_ammo_cnt(weapon_slot_id, weapon_ording, weapon_index)
    if type(weapon_slot_id) ~= "number" then
        LoggerModule.error("Unit:get_weapon_ammo_cnt", "weapon_slot_id must be a number")
        return
    end
    if type(weapon_ording) ~= "number" then
        LoggerModule.error("Unit:get_weapon_ammo_cnt", "weapon_ording must be a number")
        return
    end
    if type(weapon_index) ~= "number" then
        LoggerModule.error("Unit:get_weapon_ammo_cnt", "weapon_index must be a number")
        return
    end
    return UnitWeaponMododule.get_weapon_ammo_cnt(self.unit_table, weapon_slot_id, weapon_ording, weapon_index)
end

-- --------- highlight ----------

--- 单位白色闪烁
--- @param seconds number 闪烁时间
function Unit:highlight_white_flash(seconds)
    if type(seconds) ~= "number" then
        LoggerModule.error("Unit:highlight_white_flash", "seconds must be a number")
    end
    UnitHighlightModule.unit_white_flash(self.unit_table, seconds)
end

--- 单位闪烁
--- @param seconds number 闪烁时间
function Unit:highlight_flash(seconds)
    if type(seconds) ~= "number" then
        LoggerModule.error("Unit:highlight_flash", "seconds must be a number")
    end
    UnitHighlightModule.unit_flash(self.unit_table, seconds)
end

--- 为单位标注轮廓
--- @param outline_type UnitOutlineTypeEnum 轮廓类型
function Unit:highlight_outline(outline_type)
    if type(outline_type) ~= "string" then
        LoggerModule.error("Unit:highlight_outline", "outline_type must be a string")
    end
    UnitHighlightModule.unit_outline(self.unit_table, outline_type)
end

-- --------- 头顶文字 -----------

-- TODO: test
--- 在单位上方添加或更新文字
--- @param content string 文字内容
--- @param z_offset number z轴偏移量
--- @param color Color 颜色
function Unit:set_top_text(content, z_offset, color)
    UnitTopTextModule.set_or_update(self.id, content, z_offset, color.dec_value)
end

-- TODO: test
--- 删除单位顶部文字
function Unit:remove_top_text()
    UnitTopTextModule.remove(self.id)
end

-- --------- 物理信息 -----------

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





