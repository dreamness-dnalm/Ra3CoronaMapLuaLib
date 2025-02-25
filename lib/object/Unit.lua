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

--- 给单位命名
--- @param name string
function Unit:set_name(name)
    if type(name) ~= "string" then
        LoggerModule.error("Unit:set_name", "name must be a string")
    end
    UnitModule.name_unit(name, self.unit_table)
    self.name = name
end

--- 判断两个unit是否为同一个单位
--- @param other_unit Unit
--- @return boolean
function Unit:equals(other_unit)
    if other_unit == nil then
        return nil
    end
    return self.id == other_unit.id
end

--- 单位是否是指定的物体
--- @param thing_name ThingEnum
--- @return boolean
function Unit:is_thing(thing_name)
    return MathUtil.dec_to_hex(GameModule.get_string_fast_hash(thing_name)) ==  MathUtil.dec_to_hex(UnitModule.get_instance_id(self.id))
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


-- -------- 单位存活 --------

--- 删除单位
function Unit:delete()
    UnitModule.delete(self.unit_table)
end

--- 杀死单位
function Unit:kill()
    UnitHealthModule.kill_unit(self.unit_table)
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

--- 移除单位状态
--- @param status StatusEnum|StatusEnum[] 状态 或 状态数组
function Unit:remove_status(statuses)
    if type(statuses) ~= 'table' and type(statuses) ~= 'string' then
        LoggerModule.error('Unit:remove_status', 'statuses type error: ' .. type(statuses))
        return
    end
    StatusModule.unit_change_status(self.unit_table, statuses, nil)
end

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

--- 移除BUFF
--- @param modifiers AttributeModifierEnum | AttributeModifierEnum[] 修改器数组
function Unit:remove_modifier(modifiers)
    if type(modifiers) ~= 'table' and type(modifiers) ~= 'string' then
        LoggerModule.error('Unit:remove_modifier', 'modifiers type error: ' .. type(modifiers))
        return
    end
    AttributeModifierModule.remove_modifier(self.unit_table, modifiers)
end

-- ------ 模型状态 ------

--- 添加模型状态
--- @param model_states ModuleStateEnum | ModuleStateEnum[] 模型状态 或 模型状态数组
--- @param duration_seconds number
function Unit:add_model_state(model_states, duration_seconds)
    if type(model_states) == 'string' then
        UnitModelStateModule.add_unit_model_state(self.unit_table, model_states, duration_seconds)
    elseif type(model_states) == 'table' then
        for i=1, getn(model_states) do
            local ms = model_states[i]
            if type(ms) == 'string' then
                UnitModelStateModule.add_unit_model_state(self.unit_table, ms, duration_seconds)
            else
                LoggerModule.error('Unit:add_model_state', 'bad model_state')
            end
        end
    else
        LoggerModule.error('Unit:add_model_state', 'bad model_states')
    end
end

--- 移除模型状态
--- @param model_states ModuleStateEnum | ModuleStateEnum[] 模型状态 或 模型状态数组
function Unit:remove_model_state(model_states)
    if type(model_states) == 'string' then
        UnitModelStateModule.remove_unit_model_state(self.unit_table, model_states)
    elseif type(model_states) == 'table' then
        for i=1, getn(model_states) do
            local ms = model_states[i]
            if type(ms) == 'string' then
                UnitModelStateModule.remove_unit_model_state(self.unit_table, ms)
            else
                LoggerModule.error('Unit:remove_model_state', 'bad model_state')
            end
        end
    else
        LoggerModule.error('Unit:remove_model_state', 'bad model_states')
    end
end

-- ------ 单位健康 -------

--- 获取单位的生命值
--- @return number
function Unit:get_health()
    return UnitHealthModule.get_health(self.unit_table)
end

--- 获取单位的最大生命值
--- @return number
function Unit:get_max_health()
    return UnitHealthModule.get_max_health(self.id)
end

--- 设置单位的最大生命值
--- @param max_health number
function Unit:set_max_health(max_health)
    UnitHealthModule.set_max_health(self.name, max_health)
end

--- 设置单位生命值
--- @param health number
function Unit:set_health(health)
    if type(health) ~= 'number' then
        LoggerModule.error('Unit:set_health', 'health should be number')
        return
    end
    local max_health = self:get_max_health()
    if health > max_health then
        self:set_health_percentage(100)
    else
        local percentage = health / max_health * 100
        self:set_health_percentage(percentage)
    end
end

--- 设置单位的生命值百分比
--- @param percentage number
function Unit:set_health_percentage(percentage)
    UnitHealthModule.set_unit_health_percentage(self.name, percentage)
end

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


-- ------- 进驻 ------

--- 进驻可进驻单位(建造,ifv等)
--- @param parent_unit Unit
function Unit:garrison_other_unit(parent_unit)
    if type(parent_unit) ~= "table" then
        LoggerModule.error("Unit:garrison_other_unit", "parent_unit must be a table")
    end
    GarrisonModule.garrison(parent_unit.name, self.name)
end

--- 离开可进驻单位(建造,ifv等)
function Unit:cancel_garrison()
    GarrisonModule.leave(self.unit_table)
end

--- 清空已进驻的单位
function Unit:empty_garrison_inside()
    GarrisonModule.empty(self.name)
end

--- 获取单位的父单位
--- @return Unit
function Unit:get_parent_unit()
    local parent_unit_table = GarrisonModule.get_parent_unit(self.unit_table)
    if parent_unit_table == nil then
        return nil
    end
    return UnitHelper.get_unit_from_table(parent_unit_table)
end

--- 获取子单位列表
--- @return Unit[], number
function Unit:get_child_units()
    local child_unit_tables, cnt = GarrisonModule.get_child_units(self.unit_table)
    local child_units = {}
    for i=1, cnt do
        local child_unit_table = child_unit_tables[i]
        local child_unit = UnitHelper.get_unit_from_table(child_unit_table)
        tinsert(child_units, child_unit)
    end
    return child_units, cnt
end

--- 升级 -------

--- 是否拥有升级
--- @param upgrade_name UpgradeEnum
--- @return boolean
function Unit:is_enabled_upgrade(upgrade_name)
    return UpgradeModule.unit_has_upgrade(self.unit_table, upgrade_name)
end

--- 允许/禁止单位升级
--- @param upgrade_name UpgradeEnum
--- @param is_allow boolean
function Unit:enable_upgrade(upgrade_name, is_allow)
    UpgradeModule.unit_enable_upgrade(self.unit_table, upgrade_name, is_allow)
end