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
--- @return boolean 是否存活 1 存活 / nil 死亡
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


--- 注册单位创建事件
--- @param thing ThingEnum
UnitModule.register_create_event = function(thing)
    if type(thing) ~= "string" then
        LoggerModule.error("UnitModule.register_create_event", "thing must be a string")
        return
    end
    exObjectRegisterCreateEvent(thing)
end

--- 注册单位创建事件回调 
--- @param func function 回调函数(created_obj_id, created_Obj_instance_id, owner_player_name)
UnitModule.register_create_event_callback = function(func)
    if type(func) ~= "function" then
        LoggerModule.error("UnitModule.register_create_event_callback", "func must be a function")
        return
    end
    globals().onUnitCreateEvent = func
end


--- 设置单位清雾距离
--- @param unit_id number 单位id
--- @param distance number 距离, 需要是整数
UnitModule.set_fog_clearing_distance = function(unit_id, distance)
    if type(unit_id) ~= "number" then
        LoggerModule.error("UnitModule.set_fog_clearing_distance", "unit_id must be a number")
        return
    end
    if type(distance) ~= "number" then
        LoggerModule.error("UnitModule.set_fog_clearing_distance", "distance must be a number")
        return
    end
    if not MathUtil.is_integer(distance) then
        LoggerModule.error("UnitModule.set_fog_clearing_distance", "distance must be an integer")
        return
    end
    exObjectSetShroudClearingDistance(unit_id, distance)
end

--- 设置单位视线距离
--- @param unit_id number 单位id
--- @param distance number 距离, 需要是整数
UnitModule.set_vision_range = function(unit_id, distance)
    if type(unit_id) ~= "number" then
        LoggerModule.error("UnitModule.set_vision_range", "unit_id must be a number")
        return
    end
    if type(distance) ~= "number" then
        LoggerModule.error("UnitModule.set_vision_range", "distance must be a number")
        return
    end
    if not MathUtil.is_integer(distance) then
        LoggerModule.error("UnitModule.set_vision_range", "distance must be an integer")
        return
    end
    exObjectSetVisionRange(unit_id, distance)
end

--- 获取当前物体正在控制的单位的id  (此函数针对有控制技能的物体， 例如 JapanPsychicInhibitor )
--- @param unit_id number 单位id
--- @return number 单位的id
UnitModule.get_temporary_owned_unit_id = function(unit_id)
    return exObjectGetTemporaryOwnedObjectId(unit_id)
end








