-- --------- 物理信息 -----------

--- 获取单位坐标
--- @return number, number, number x, y, z
function Unit:get_position()
    return UnitPhysicsModule.get_position(self.unit_table)
end

--- 获取单位坐标向量
--- @return Vector
function Unit:get_position_vec()
    local x, y, z = self:get_position()
    return {x, y, z}
end

--- 单位移动到指定坐标, 参数为整数. 涉及到游戏状态机, 慎用
--- @param x number x
--- @param y number y
--- @param z number z
function Unit:move_to(x, y, z)
    if type(x) ~= "number" then
        LoggerModule.error("Unit:move_to", "x must be a number")
        return
    end
    if type(y) ~= "number" then
        LoggerModule.error("Unit:move_to", "y must be a number")
        return
    end
    if type(z) ~= "number" then
        LoggerModule.error("Unit:move_to", "z must be a number")
        return
    end
    UnitPhysicsModule.move_to(self.id, x, y, z)
end

--- 设置单位坐标
--- @param x number x
--- @param y number y
--- @param z number|nil z, 可以缺省为nil
function Unit:set_position(x, y, z)
    if type(x) ~= "number" then
        LoggerModule.error("Unit:set_position", "x must be a number")
        return
    end
    if type(y) ~= "number" then
        LoggerModule.error("Unit:set_position", "y must be a number")
        return
    end
    if type(z) ~= "number" and z ~= nil then
        LoggerModule.error("Unit:set_position", "z must be a number or nil")
        return
    end
    UnitPhysicsModule.set_position(self.unit_table, x, y, z)
end

--- 设置单位坐标向量
--- @param vec Vector
function Unit:set_position_by_vec(vec)
    if type(vec) ~= "table" then
        LoggerModule.error("Unit:set_position_by_vec", "vec must be a table")
        return
    end
    if getn(vec) ~= 3 then
        LoggerModule.error("Unit:set_position_by_vec", "vec must have length 3")
        return
    end
    UnitPhysicsModule.set_position(self.unit_table, vec[1], vec[2], vec[3])
end

--- 获取与另一个单位的2D距离
--- @param other_unit Unit
--- @return number
function Unit:get_distance_2D(other_unit)
    return UnitPhysicsModule.get_distance_2D(self.unit_table, other_unit.unit_table)
end

--- 获取与另一个单位的3D距离
--- @param other_unit Unit
--- @return number
function Unit:get_distance_3D(other_unit)
    return UnitPhysicsModule.get_distance_3D(self.unit_table, other_unit.unit_table)
end

-- --- 使单位面向路径点
-- --- 注: 不是所有单位都有效
-- --- @param waypoint_name string 路径点名字
-- function Unit:fact_to_waypoint(waypoint_name)
--     UnitPhysicsModule.face_to_waypoint(self.unit_table, waypoint_name)
-- end

-- --- 使单位面向另一个单位
-- --- 注: 不是所有单位都有效
-- --- @param other_unit Unit
-- function Unit:face_to_unit(other_unit)
--     UnitPhysicsModule.face_to_unit(self.name, other_unit.name)
-- end

