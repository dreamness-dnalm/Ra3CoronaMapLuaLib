--- UnitModule.lua
--- Created by dreamness
--- DateTime: 10/13/2024 2:48 PM
---


UnitModule = {}

--- 根据单位的命名获取unit table
--- @param name string 单位的名字
--- @return SystemUnitTable
UnitModule.from_name = function(name)
    return GetObjectByScriptName(name)
end

--- 根据单位的id获取unit table
--- @param id number 单位的id
--- @return SystemUnitTable
UnitModule.from_id = function(id)
    return GetObjectById(id)
end

--- 获取单位的唯一id
--- @param unitTable SystemUnitTable 单位table
--- @return number
UnitModule.to_id = function(unit_table)
    return ObjectGetId(unit_table)
end

-- TODO: package
--- 获取单位的instance_id(instance_id=fast_hash(thing_name))
--- @param object_id number 单位的id
--- @return number
UnitModule.get_instance_id = function(object_id)
    return exObjectGetInstanceId(object_id)
end

--- 判断两个unit table是否为同一个单位
--- @param unitTable1 SystemUnitTable 单位table
--- @param unitTable2 SystemUnitTable 单位table
--- @return boolean
UnitModule.equals = function(unitTable1, unitTable2)
    return ObjectsIsSame(unitTable1, unitTable2)
end

--- 检测单位是否存活;
--- 和 EvaluateCondition("NAMED_NOT_DESTROYED", self) 是等价的, 但更快;
--- @param unitTable SystemUnitTable 单位
--- @return boolean 是否存活, 1 存活, nil 死亡
UnitModule.alive = function(unitTable)
    return ObjectIsAlive(unitTable)
end

--- 生成单位并命名 (35)
--- @param name string 单位名
--- @param thing string 单位名
--- @param team_name string 队伍名/playerName
--- @param waypoint_name string 路径点名
UnitModule.create_and_name_unit_at_waypoint = function(name, thing, team_name, waypoint_name)
    -- LoggerModule.debug("UnitModule.create_and_name_unit_at_waypoint", "name: " .. tostring(name) .. ", thing: " .. tostring(thing) .. ", teamName: " .. tostring(team_name) .. ", waypointName: " .. tostring(waypoint_name))
    if type(name) ~= "string" then
        LoggerModule.error("UnitModule.create_and_name_unit_at_waypoint", "name must be a string")
        return
    end
    if type(thing) ~= "string" then
        LoggerModule.error("UnitModule.create_and_name_unit_at_waypoint", "thing must be a string")
        return
    end
    if type(team_name) ~= "string" then
        LoggerModule.error("UnitModule.create_and_name_unit_at_waypoint", "team_name must be a string")
        return
    end
    if type(waypoint_name) ~= "string" then
        LoggerModule.error("UnitModule.create_and_name_unit_at_waypoint", "waypoint_name must be a string")
        return
    end
    ExecuteAction("CREATE_NAMED_ON_TEAM_AT_WAYPOINT", name, thing, team_name, waypoint_name)
end

--- 删除单位 (64)
--- @param unit_table_or_name SystemUnitTable|string 单位table|name
UnitModule.delete = function(unit_table_or_name)
    if type(unit_table_or_name) ~= "string" and type(unit_table_or_name) ~= "table" then
        LoggerModule.error("unitFuncs.delete", "unit_table_or_name must be a string or table")
    end
    ExecuteAction("NAMED_DELETE", unit_table_or_name)
end

-- -- TODO: test, package
-- --- 在单位上生成子物体((527))
-- --- @param unit_name string 单位名
-- --- @param thing string 物体名
-- --- @param team_name string 队伍名
-- --- @param parent_unit_name string 父单位名
-- UnitModule.createSubUnit = function(unit_name, thing, team_name, parent_unit_name)
--     if type(unit_name) ~= "string" then
--         LoggerModule.error("unitFuncs.createSubUnit", "unitName must be a string")
--     end
--     if type(thing) ~= "string" then
--         LoggerModule.error("unitFuncs.createSubUnit", "thing must be a string")
--     end
--     if type(team_name) ~= "string" then
--         LoggerModule.error("unitFuncs.createSubUnit", "team_name must be a string")
--     end
--     if type(parent_unit_name) ~= "string" then
--         LoggerModule.error("unitFuncs.createSubUnit", "parent_unit_name must be a string")
--     end
--     ExecuteAction("UNIT_SPAWN_NAMED_OBJECT_ON_TEAM_AT_NAMED_OBJECT_LOCATION", unit_name, thing, team_name, parent_unit_name)
-- end

--- 给单位命名 （278)
--- @param name string 单位名
--- @param unit_table SystemUnitTable 单位table
UnitModule.name_unit = function(name, unit_table)
    if type(unit_table) ~= "table" then
        LoggerModule.error("unitFuncs.nameUnit", "unit_table must be a table")
    end
    if type(name) ~= "string" then
        LoggerModule.error("unitFuncs.nameUnit", "name must be a string")
    end
    ExecuteAction("SET_UNIT_REFERENCE", name, unit_table)
end

--- 设置单位所属玩家 (77)
--- @param unit_table_or_name table|string unitTable | unit_name
--- @param player_name string playerEnum
UnitModule.set_owner_player = function(unit_table_or_name, player_name)
    LoggerModule.debug("UnitModule.set_owner_player", "unit_table_or_name: " .. tostring(unit_table_or_name) .. ", player_name: " .. tostring(player_name))
    if type(unit_table_or_name) ~= "string" and type(unit_table_or_name) ~= "table" then
        LoggerModule.error("UnitModule.set_owner_player", "unit_table_or_name must be a table or string")
    end

    if type(player_name) ~= "string" then
        LoggerModule.error("UnitModule.set_owner_player", "player_name must be a string")
    end
    ExecuteAction("NAMED_TRANSFER_OWNERSHIP_PLAYER", unit_table_or_name, player_name)
    LoggerModule.debug("UnitModule.set_owner_player", "finished")
end
