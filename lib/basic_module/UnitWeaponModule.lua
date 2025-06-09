--- UnitWeaponMododule.lua
--- Created by dreamness
--- DateTime: 8/15/2024 10:42 PM
---

--- 武器模块
UnitWeaponMododule = {}

--- 在单位身上创建并发射一个临时武器
--- @param unit_table SystemUnitTable 单位table
--- @param weapon_name WeaponEnum 武器名字
--- @param x number 目标位置x
--- @param y number 目标位置y
--- @param z number 目标位置z
--- @param target_unit_table SystemUnitTable|nil 目标单位table
UnitWeaponMododule.fire_with_temp_weapon = function(unit_table, weapon_name, x, y, z, target_unit_table)
    if type(unit_table) ~= "table" then
        LoggerModule.error("UnitWeaponMododule.fire_with_temp_weapon", "unitTable must be a table")
        return
    end
    if type(weapon_name) ~= "string" then
        LoggerModule.error("UnitWeaponMododule.fire_with_temp_weapon", "weaponName must be a string")
        return
    end

    if type(x) ~= "number" or type(y) ~= "number" or type(z) ~= "number" then
        LoggerModule.error("UnitWeaponMododule.fire_with_temp_weapon", "x, y, z must be a number")
        return
    end

    if target_unit_table ~= nil and type(target_unit_table) ~= "table" then
        LoggerModule.error("UnitWeaponMododule.fire_with_temp_weapon", "target_unit_table must be a table or nil")
        return
    end
    local targetPos = {X = x, Y = y, Z = z}
    local ret, err = ObjectCreateAndFireTempWeaponToTarget(unit_table, weapon_name, targetPos, target_unit_table)
    if not ret then
        LoggerModule.error("UnitWeaponMododule.fire_with_temp_weapon", "create temp weapon failed: " .. tostring(err))
        return
    end
end


-- TODO: test
--- 设置单位武器弹药量
--- @param unit_table SystemUnitTable 单位table
--- @param weapon_slot_id number 武器槽位id
--- @param weapon_ording number 武器排序
--- @param weapon_index number 武器索引
--- @param ammo_cnt number 弹药数量
UnitWeaponMododule.set_weapon_ammo_cnt = function(unit_table, weapon_slot_id, weapon_ording, weapon_index, ammo_cnt)
    if type(unit_table) ~= "table" then
        LoggerModule.error("UnitWeaponMododule.set_weapon_ammo_cnt", "unit_table must be a table")
        return
    end
    if type(weapon_slot_id) ~= "number" then
        LoggerModule.error("UnitWeaponMododule.set_weapon_ammo_cnt", "weapon_slot_id must be a number")
        return
    end
    if type(weapon_ording) ~= "number" then
        LoggerModule.error("UnitWeaponMododule.set_weapon_ammo_cnt", "weapon_ording must be a number")
        return
    end
    if type(weapon_index) ~= "number" then
        LoggerModule.error("UnitWeaponMododule.set_weapon_ammo_cnt", "weapon_index must be a number")
        return
    end
    if type(ammo_cnt) ~= "number" then
        LoggerModule.error("UnitWeaponMododule.set_weapon_ammo_cnt", "ammo_cnt must be a number")
        return
    end

    ObjectSetWeaponSetUpdateWeaponCurrentAmmoCount(unit_table, weapon_slot_id, weapon_ording, weapon_index, ammo_cnt)
end


-- TODO: test
--- 获取单位武器弹药量
--- @param unit_table SystemUnitTable 单位table
--- @param weapon_slot_id number 武器槽位id
--- @param weapon_ording number 武器排序
--- @param weapon_index number 武器索引
--- @return number 弹药数量
UnitWeaponMododule.get_weapon_ammo_cnt = function(unit_table, weapon_slot_id, weapon_ording, weapon_index)
    if type(unit_table) ~= "table" then
        LoggerModule.error("UnitWeaponMododule.get_weapon_ammo_cnt", "unit_table must be a table")
        return nil
    end
    if type(weapon_slot_id) ~= "number" then
        LoggerModule.error("UnitWeaponMododule.get_weapon_ammo_cnt", "weapon_slot_id must be a number")
        return nil
    end
    if type(weapon_ording) ~= "number" then
        LoggerModule.error("UnitWeaponMododule.get_weapon_ammo_cnt", "weapon_ording must be a number")
        return nil
    end
    if type(weapon_index) ~= "number" then
        LoggerModule.error("UnitWeaponMododule.get_weapon_ammo_cnt", "weapon_index must be a number")
        return nil
    end

    return ObjectGetWeaponSetUpdateWeaponCurrentAmmoCount(unit_table, weapon_slot_id, weapon_ording, weapon_index)
end


-- TODO: test
--- 获取单位武器最大弹药量
--- @param unit_table SystemUnitTable 单位table
--- @param weapon_slot_id number 武器槽位id
--- @param weapon_ording number 武器排序
--- @param weapon_index number 武器索引
--- @return number 最大弹药量
UnitWeaponMododule.get_weapon_max_ammo_cnt = function(unit_table, weapon_slot_id, weapon_ording, weapon_index)
    if type(unit_table) ~= "table" then
        LoggerModule.error("UnitWeaponMododule.get_weapon_max_ammo_cnt", "unit_table must be a table")
        return nil
    end
    if type(weapon_slot_id) ~= "number" then
        LoggerModule.error("UnitWeaponMododule.get_weapon_max_ammo_cnt", "weapon_slot_id must be a number")
        return nil
    end
    if type(weapon_ording) ~= "number" then
        LoggerModule.error("UnitWeaponMododule.get_weapon_max_ammo_cnt", "weapon_ording must be a number")
        return nil
    end
    if type(weapon_index) ~= "number" then
        LoggerModule.error("UnitWeaponMododule.get_weapon_max_ammo_cnt", "weapon_index must be a number")
        return nil
    end

    return ObjectGetWeaponSetUpdateWeaponMaxAmmoCount(unit_table, weapon_slot_id, weapon_ording, weapon_index)
end
