
--- 攻击单位
--- @param target_unit Unit
--- @param is_force_attack boolean
function Unit:attack_unit(target_unit, is_force_attack)
    UnitAttackModule.attack_unit(self.unit_table, target_unit.unit_table, is_force_attack)
end


--- 攻击路径点
--- @param waypoint_name string
function Unit:attack_waypoint(waypoint_name)
    UnitAttackModule.attack_waypoint(self.unit_table, waypoint_name)
end

--- 捕猎
--- 注意: 对人类玩家无效
function Unit:hunt()
    UnitAttackModule.hunt(self.unit_table)
end

--- 移动攻击到路径点
--- @param waypoint_name string
function Unit:move_attack_to_waypoint(waypoint_name)
    UnitAttackModule.move_attack_to_waypoint(self.unit_table, waypoint_name)
end

--- 移动攻击到最近的某类型目标
--- @param nearby_thing ThingEnum
function Unit:move_attack_to_nearest_thing(nearby_thing)
    UnitAttackModule.move_attack_to_nearest_thing(self.unit_table, nearby_thing)
end

-- 无效
-- --- 攻击区域
-- --- @param area_name string
-- --- @param duration_seconds number|nil
-- function Unit:attack_area(area_name, duration_seconds)
--     UnitAttackModule.attack_area(self.unit_table, area_name, duration_seconds)
-- end





