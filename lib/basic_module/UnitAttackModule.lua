UnitAttackModule = {}

--- 攻击单位 (34), (549)
--- @param attacker_unit_table_or_name SystemUnitTable|string
--- @param target_unit_table_or_name SystemUnitTable|string
--- @param is_force_attack boolean
UnitAttackModule.attack_unit = function(attacker_unit_table_or_name, target_unit_table_or_name, is_force_attack)
    if type(attacker_unit_table_or_name) ~= "string" and type(attacker_unit_table_or_name) ~= "table" then
        logger.error("UnitAttackModule.attack_unit", "attacker_unit_table_or_name must be a string or a table")
    end
    if type(target_unit_table_or_name) ~= "string" and type(target_unit_table_or_name) ~= "table" then
        logger.error("UnitAttackModule.attack_unit", "target_unit_table_or_name must be a string or a table")
    end

    if is_force_attack then
        ExecuteAction("NAMED_FORCE_ATTACK_NAMED", attacker_unit_table_or_name, target_unit_table_or_name) -- (549)
    else
        ExecuteAction("NAMED_ATTACK_NAMED", attacker_unit_table_or_name, target_unit_table_or_name) -- (34)
    end
end

--- 攻击路径点 (550)
--- @param attacker_unit_table_or_name SystemUnitTable|string
--- @param waypoint_name string
UnitAttackModule.attack_waypoint = function(attacker_unit_table_or_name, waypoint_name)
    if type(attacker_unit_table_or_name) ~= "string" and type(attacker_unit_table_or_name) ~= "table" then
        logger.error("UnitAttackModule.attack_waypoint", "attacker_unit_table_or_name must be a string or a table")
    end
    if type(waypoint_name) ~= "string" then
        logger.error("UnitAttackModule.attack_waypoint", "waypoint_name must be a string")
    end

    ExecuteAction("NAMED_FORCE_ATTACK_WAYPOINT", attacker_unit_table_or_name, waypoint_name) -- (550)
end

--- 捕猎 (52)
--- 注意: 对人类玩家无效
--- @param attacker_unit_table_or_name SystemUnitTable|string
UnitAttackModule.hunt = function(attacker_unit_table_or_name)
    if type(attacker_unit_table_or_name) ~= "string" and type(attacker_unit_table_or_name) ~= "table" then
        logger.error("UnitAttackModule.hunt", "attacker_unit_table_or_name must be a string or a table")
    end

    ExecuteAction("NAMED_HUNT", attacker_unit_table_or_name) -- (52)
end

--- 移动攻击到路径点 (415)
--- @param attacker_unit_table_or_name SystemUnitTable|string
--- @param waypoint_name string
UnitAttackModule.move_attack_to_waypoint = function(attacker_unit_table_or_name, waypoint_name)
    if type(attacker_unit_table_or_name) ~= "string" and type(attacker_unit_table_or_name) ~= "table" then
        logger.error("UnitAttackModule.move_attack_to_waypoint", "attacker_unit_table_or_name must be a string or a table")
    end
    if type(waypoint_name) ~= "string" then
        logger.error("UnitAttackModule.move_attack_to_waypoint", "waypoint_name must be a string")
    end

    ExecuteAction("ATTACK_MOVE_NAMED_UNIT_TO", attacker_unit_table_or_name, waypoint_name) -- (415)
end

--- 移动攻击到最近的某类型目标 (417)
--- @param attacker_unit_table_or_name SystemUnitTable|string
--- @param nearby_thing ThingEnum
UnitAttackModule.move_attack_to_nearest_thing = function(attacker_unit_table_or_name, nearby_thing)
    if type(attacker_unit_table_or_name) ~= "string" and type(attacker_unit_table_or_name) ~= "table" then  
        logger.error("UnitAttackModule.move_attack_to_nearest_thing", "attacker_unit_table_or_name must be a string or a table")
    end
    if type(nearby_thing) ~= "string" then
        logger.error("UnitAttackModule.move_attack_to_nearest_thing", "nearby_thing must be a string")
    end

    ExecuteAction("UNIT_ATTACK_MOVE_TOWARDS_NEAREST_OBJECT_TYPE", attacker_unit_table_or_name, nearby_thing) -- (417)
end

--- 获取单位目标单位
--- @param unit_table SystemUnitTable 单位table
--- @return SystemUnitTable 目标单位table
UnitAttackModule.get_target_unit = function(unit_table)
    if type(unit_table) ~= "table" then
        LoggerModule.error("UnitAttackModule.get_target_unit", "unit_table must be a table")
        return nil
    end
    return ObjectFindTarget(unit_table)
end



-- 无效
-- --- 攻击区域 (40), (41)
-- --- @param attacker_unit_table_or_name SystemUnitTable|string
-- --- @param area_name string
-- --- @param duration_seconds number|nil 整数
-- UnitAttackModule.attack_area = function(attacker_unit_table_or_name, area_name, duration_seconds)
--     if type(attacker_unit_table_or_name) ~= "string" and type(attacker_unit_table_or_name) ~= "table" then
--         logger.error("UnitAttackModule.attack_area", "attacker_unit_table_or_name must be a string or a table")
--     end
--     if type(area_name) ~= "string" then
--         logger.error("UnitAttackModule.attack_area", "area_name must be a string")
--     end

--     if type(duration_seconds) ~= "number" and duration_seconds ~= nil then
--         logger.error("UnitAttackModule.attack_area", "duration_seconds must be a number or nil")
--     end

--     if duration_seconds then
--         if not MathUtil.is_integer(duration_seconds) then
--             logger.error("UnitAttackModule.attack_area", "duration_seconds must be an integer")
--             return
--         end
--         ExecuteAction("NAMED_ATTACK_AREA_FOR_SECONDS", attacker_unit_table_or_name, area_name, duration_seconds) -- (41)
--     else
--         ExecuteAction("NAMED_ATTACK_AREA", attacker_unit_table_or_name, area_name) -- (40)
--     end
-- end


