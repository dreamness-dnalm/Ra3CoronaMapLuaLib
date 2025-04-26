WaypointModule = {}

--- 修改Waypoint点的坐标位置  坐标都需要是整数
--- @param waypoint_name string
--- @param x number
--- @param y number
--- @param z number
WaypointModule.set_position = function(waypoint_name, x, y, z)
    if type(waypoint_name) ~= "string" then
        LoggerModule.error("WaypointModule.set_position", "waypoint_name must be a string")
        return
    end
    if type(x) ~= "number" or (not MathUtil.is_integer(x)) then
        LoggerModule.error("WaypointModule.set_position", "x must be a number(int)")
        return
    end
    if type(y) ~= "number" or (not MathUtil.is_integer(y)) then
        LoggerModule.error("WaypointModule.set_position", "y must be a number(int)")
        return
    end
    if type(z) ~= "number" or (not MathUtil.is_integer(z)) then
        LoggerModule.error("WaypointModule.set_position", "z must be a number(int)")
        return
    end
    exWaypointSetPos(waypoint_name, x, y, z)
end

--- 获取指定路径点的位置
--- @param waypoint_name string 路径点名称
--- @return number x, number y, number z 路径点x,y,z坐标, 如果非法返回nil
WaypointModule.get_position = function(waypoint_name)
    if type(waypoint_name) ~= "string" then
        LoggerModule.error("WaypointModule.get_position", "waypoint_name must be a string")
        return nil, nil, nil
    end
    local pos = exWaypointGetPos(waypoint_name)
    if pos == nil then
        LoggerModule.error("WaypointModule.get_position", "error waypoint_name: " .. tostring(waypoint_name))
        return nil, nil, nil
    end
    local x, y, z = pos[1], pos[2], pos[3]
    if x == -1 and y == -1 and z == -1 then
        LoggerModule.error("WaypointModule.get_position", "error waypoint_name: " .. tostring(waypoint_name))
        return nil, nil, nil
    end
    return x, y, z
end

