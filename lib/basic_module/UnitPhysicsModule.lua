--- UnitPhysicsModule.lua
--- Created by dreamness
--- DateTime: 8/10/2024 10:48 PM
---

UnitPhysicsModule = {}

--- 获取单位的位置
--- @param unit_table SystemUnitTable 单位
--- @return number, number, number x, y, z
UnitPhysicsModule.get_position = function(unit_table)
    if type(unit_table) ~= "table" then
        LoggerModule.error("UnitPhysicsModule.get_position", "unit_table must be a table")
        return nil, nil, nil
    end
    return ObjectGetPosition(unit_table)
end

--- 设置单位的位置
--- @param unit_table SystemUnitTable 单位
--- @param x number x
--- @param y number y
--- @param z number z
UnitPhysicsModule.set_position = function(unit_table, x, y, z)
    if type(unit_table) ~= "table" then
        LoggerModule.error("UnitPhysicsModule.set_position", "unit_table must be a table")
        return
    end
    if type(x) ~= "number" and type(y) ~= "number" then
        LoggerModule.error("UnitPhysicsModule.set_position", "x, y must be a number")
        return
    end
    if z == nil then
        ObjectSetPosition(unit_table, x, y)
    else
        ObjectSetPosition(unit_table, x, y, z)
    end
end

--- 移动到某个位置, 参数是整数
--- @param object_id number 单位id
--- @param x number x
--- @param y number y
--- @param z number z
UnitPhysicsModule.move_to = function(object_id, x, y, z)
    if type(object_id) ~= "number" then
        LoggerModule.error("UnitPhysicsModule.move_to", "object_id must be a number")
        return
    end
    if type(x) ~= "number" or (not MathUtil.is_integer(x)) then
        LoggerModule.error("UnitPhysicsModule.move_to", "x must be a number(int)")
        return
    end
    if type(y) ~= "number" or (not MathUtil.is_integer(y)) then
        LoggerModule.error("UnitPhysicsModule.move_to", "y must be a number(int)")
        return
    end
    if type(z) ~= "number" or (not MathUtil.is_integer(z)) then
        LoggerModule.error("UnitPhysicsModule.move_to", "z must be a number(int)")
        return
    end
    exObjectMoveTo(object_id, x, y, z)
end

--- 获取单位间的距离(2D)
--- @param unit_table_1 SystemUnitTable 单位1
--- @param unit_table_2 SystemUnitTable 单位2
--- @return number 距离
UnitPhysicsModule.get_distance_2D = function(unit_table_1, unit_table_2)
    if type(unit_table_1) ~= "table" and type(unit_table_2) ~= "table" then
        LoggerModule.error("UnitPhysicsModule.get_distance_2D", "unit_table_1 and unit_table_2 must be a table")
        return nil
    end
    return ObjectsDistance2D(unit_table_1, unit_table_2)
end

--- 获取单位间的距离(3D)
--- @param unit_table_1 SystemUnitTable 单位1
--- @param unit_table_2 SystemUnitTable 单位2
--- @return number 距离
UnitPhysicsModule.get_distance_3D = function(unit_table_1, unit_table_2)
    if type(unit_table_1) ~= "table" or type(unit_table_2) ~= "table" then
        LoggerModule.error("UnitPhysicsModule.get_distance_3D", "unit_table_1 and unit_table_2 must be a table")
        return nil
    end
    return ObjectsDistance3D(unit_table_1, unit_table_2)
end


-- TODO: package
--- 获取单位在前一帧的坐标（便于计算速度） (每秒15帧);
--- @param unit_table SystemUnitTable 单位
--- @return number, number, number x, y, z
UnitPhysicsModule.get_previous_position = function(unit_table)
    if type(unit_table) ~= "table" then
        LoggerModule.error("UnitPhysicsModule.get_previous_position", "unit_table must be a table")
    end
    return ObjectGetPreviousPosition(unit_table)
end

-- --- 使单位的朝向另一个单位 ((230))
-- --- 注意: 某些单位不可用
-- --- @param this_unit_name string 单位名称
-- --- @param other_unit_name string 单位名称
-- UnitPhysicsModule.face_to_unit = function(this_unit_name, other_unit_name)
--     -- LoggerModule.debug("UnitPhysicsModule.face_to_unit", "this_unit_name: " .. tostring(this_unit_name) .. ", face_to_unit: " .. tostring(other_unit_name))
--     if type(this_unit_name) ~= "string" or type(other_unit_name) ~= "string" then
--         LoggerModule.error("UnitPhysicsModule.face_to_unit", "thisUnitName and otherUnitName must be a string")
--         return
--     end
--     ExecuteAction("NAMED_FACE_NAMED", this_unit_name, other_unit_name)
--     -- LoggerModule.debug("UnitPhysicsModule.face_to_unit", "end")
-- end


-- --- 使单位的朝向路径点 (231)
-- --- @param unit_table_or_name SystemUnitTable|string 单位名称
-- --- @param waypoint_name string 路径点名称
-- UnitPhysicsModule.face_to_waypoint = function(unit_table_or_name, waypoint_name)
--     LoggerModule.debug("UnitPhysicsModule.unitFaceToWaypoint", "unitName: " .. tostring(unit_table_or_name) .. ", wayPointName: " .. tostring(waypoint_name))
--     if type(unit_table_or_name) ~= "string" and type(unit_table_or_name) ~= "table" then
--         LoggerModule.error("UnitPhysicsModule.face_to_waypoint", "unit_table_or_name must be a string or table")
--         return
--     end
--     if type(waypoint_name) ~= "string" then
--         LoggerModule.error("UnitPhysicsModule.face_to_waypoint", "wayPointName must be a string")
--         return
--     end
--     ExecuteAction("NAMED_FACE_WAYPOINT", unit_table_or_name, waypoint_name)
--     LoggerModule.debug("UnitPhysicsModule.face_to_waypoint", "end")
-- end

-- ------------ 以下为齐次坐标系相关 ------------

--- 获取单位的齐次坐标矩阵
--- @param unit_table SystemUnitTable 单位
--- @return Matrix
UnitPhysicsModule.get_homogeneous_coordinates = function(unit_table)
    if type(unit_table) ~= "table" then
        LoggerModule.error("UnitPhysicsModule.get_detail_matrix", "unit_table must be a table")
        return nil
    end
    return HomogeneousCoordinatesUtil.system_matrix_to_homogeneous_coordinates(ObjectGetTransform(unit_table))
end

--- 设置单位的详细信息
--- @param unit_table SystemUnitTable 单位
--- @param hc_matrix Matrix 详细信息
UnitPhysicsModule.set_homogeneous_coordinates = function(unit_table, hc_matrix)
    if type(unit_table) ~= "table" then
        LoggerModule.error("UnitPhysicsModule.set_detail_matrix", "unit_table must be a table")
        return
    end
    if type(hc_matrix) ~= "table" then
        LoggerModule.error("UnitPhysicsModule.set_detail_matrix", "hc_matrix must be a table")
        return
    end
    ObjectSetTransform(unit_table, HomogeneousCoordinatesUtil.homogeneous_coordinates_to_system_matrix(hc_matrix))
end

--- 平移单位(全局坐标)
--- @param unit_table SystemUnitTable 单位
--- @param vec Vector
UnitPhysicsModule.translate = function(unit_table, vec)
    if type(unit_table) ~= "table" then
        LoggerModule.error("UnitPhysicsModule.translate", "unit_table must be a table")
        return
    end
    if type(vec) ~= "table" then
        LoggerModule.error("UnitPhysicsModule.translate", "vec must be a table")
        return
    end

    local hc = UnitPhysicsModule.get_homogeneous_coordinates(unit_table)
    hc = MatrixUtil.dot(HomogeneousCoordinatesUtil.get_translation_matrix_by_vec(vec), hc)
    UnitPhysicsModule.set_homogeneous_coordinates(unit_table, hc)
end

--- 平移单位(相对坐标)
--- @param unit_table SystemUnitTable 单位
--- @param vec Vector
UnitPhysicsModule.translate_relatively = function(unit_table, vec)
    if type(unit_table) ~= "table" then
        LoggerModule.error("UnitPhysicsModule.translate_relatively", "unit_table must be a table")
        return
    end
    if type(vec) ~= "table" then
        LoggerModule.error("UnitPhysicsModule.translate_relatively", "vec must be a table")
        return
    end

    -- left_sub_unit_hc = MatrixUtil.dot(
    --     HomogeneousCoordinatesUtil.get_translation_matrix_by_vec(
    --         MatrixUtil.dot_vector(transform_matrix, {0, DemoRorate.config.left_right_sub_unit_distance, 0})
    --     ),
    --     left_sub_unit_hc
    -- )
    local hc = UnitPhysicsModule.get_homogeneous_coordinates(unit_table)
    hc = MatrixUtil.dot(
        HomogeneousCoordinatesUtil.get_translation_matrix_by_vec(
            MatrixUtil.dot_vector(HomogeneousCoordinatesUtil.get_transform_matrix_by_hc(hc), vec)
        ), 
        hc
    )
    UnitPhysicsModule.set_homogeneous_coordinates(unit_table, hc)
end



--- 欧拉角旋转, 具体的旋转方向可使用右手定则确定
--- @param unit_table SystemUnitTable 单位
--- @param roll_angle number
--- @param pitch_angle number
--- @param yaw_angle number
UnitPhysicsModule.rotate_by_euler = function(unit_table, roll_angle, pitch_angle, yaw_angle)
    local hc = UnitPhysicsModule.get_homogeneous_coordinates(unit_table)
    local x_dir_vec, y_dir_vec, z_dir_vec = HomogeneousCoordinatesUtil.get_axis_vecs_by_hc(hc)

    hc = MatrixUtil.dot(
        HomogeneousCoordinatesUtil.get_move_back_translation_matrix_by_hc(hc),
        HomogeneousCoordinatesUtil.get_rotation_matrix_by_vec(x_dir_vec, roll_angle),
        HomogeneousCoordinatesUtil.get_rotation_matrix_by_vec(y_dir_vec, pitch_angle),
        HomogeneousCoordinatesUtil.get_rotation_matrix_by_vec(z_dir_vec, yaw_angle),
        HomogeneousCoordinatesUtil.get_move_origin_translation_matrix_by_hc(hc),
        hc
    )

    UnitPhysicsModule.set_homogeneous_coordinates(unit_table, hc)
end


--- 缩放单位
--- @param unit_table SystemUnitTable 单位
--- @param scale number 缩放比例
UnitPhysicsModule.set_scale = function(unit_table, scale)
    if type(unit_table) ~= "table" then
        LoggerModule.error("UnitPhysicsModule.scale", "unit_table must be a table")
        return
    end
    if type(scale) ~= "number" then
        LoggerModule.error("UnitPhysicsModule.scale", "scale must be a number")
        return
    end

    LoggerModule.debug("UnitPhysicsModule.scale", "unit_table: " .. tostring(unit_table) .. ", scale: " .. tostring(scale))
    local hc = UnitPhysicsModule.get_homogeneous_coordinates(unit_table)

    LoggerModule.debug("UnitPhysicsModule.scale", "hc: " .. MatrixUtil.m_tostring(hc))

    hc = MatrixUtil.dot(
        HomogeneousCoordinatesUtil.get_move_back_translation_matrix_by_hc(hc),
        HomogeneousCoordinatesUtil.get_uniform_scale_matrix(scale),
        HomogeneousCoordinatesUtil.get_move_origin_translation_matrix_by_hc(hc),
        hc
    )

    LoggerModule.debug("UnitPhysicsModule.scale", "hc: " .. MatrixUtil.m_tostring(hc))
    
    UnitPhysicsModule.set_homogeneous_coordinates(unit_table, hc)
end

--- 获取单位缩放比例
--- @param unit_table SystemUnitTable 单位
--- @return number, number, number 分别在x, y, z轴的缩放比例
UnitPhysicsModule.get_scale = function(unit_table)
    if type(unit_table) ~= "table" then
        LoggerModule.error("UnitPhysicsModule.get_scale", "unit_table must be a table")
        return nil, nil, nil
    end
    local hc = UnitPhysicsModule.get_homogeneous_coordinates(unit_table)
    return HomogeneousCoordinatesUtil.get_scale_by_hc(hc)
end

--- 单位镜像, 模型可能会出问题!
--- @param unit_table SystemUnitTable 单位
--- @param x boolean 是否在x轴镜像
--- @param y boolean 是否在y轴镜像
--- @param z boolean 是否在z轴镜像
UnitPhysicsModule.set_mirror = function(unit_table, x, y, z)
    if type(unit_table) ~= "table" then
        LoggerModule.error("UnitPhysicsModule.set_mirror", "unit_table must be a table")
        return
    end

    local hc = UnitPhysicsModule.get_homogeneous_coordinates(unit_table)

    hc = MatrixUtil.dot(
        HomogeneousCoordinatesUtil.get_move_back_translation_matrix_by_hc(hc),
        HomogeneousCoordinatesUtil.get_mirror_matrix(x, y, z),
        HomogeneousCoordinatesUtil.get_move_origin_translation_matrix_by_hc(hc),
        hc
    )
    
    UnitPhysicsModule.set_homogeneous_coordinates(unit_table, hc)
end

--- 获取单位的方向向量
--- @param unit_table SystemUnitTable 单位
--- @return Vector
UnitPhysicsModule.get_direction_vec = function(unit_table)
    if type(unit_table) ~= "table" then
        LoggerModule.error("UnitPhysicsModule.get_direction_vec", "unit_table must be a table")
        return nil
    end
    local hc = UnitPhysicsModule.get_homogeneous_coordinates(unit_table)
    return HomogeneousCoordinatesUtil.get_direction_vec(hc)
end