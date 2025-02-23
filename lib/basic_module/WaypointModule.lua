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