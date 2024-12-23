--- UnitPhysicsModule.lua
--- Created by dreamness
--- DateTime: 8/10/2024 10:48 PM
---

UnitPhysicsModule = {}

-- TODO: test, package
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

-- TODO: test, package
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

-- TODO: test, package
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

-- TODO: test, package
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






-- TODO: test, package
--- 获取单位在前一帧的坐标（便于计算速度） (每秒15帧);
--- @param unit_table SystemUnitTable 单位
--- @return number, number, number x, y, z
UnitPhysicsModule.get_previous_position = function(unit_table)
    if type(unit_table) ~= "table" then
        LoggerModule.error("UnitPhysicsModule.get_previous_position", "unit_table must be a table")
    end
    return ObjectGetPreviousPosition(unit_table)
end

-- TODO: test, package
--- 使单位的朝向另一个单位 ((230))
--- @param this_unit_name string 单位名称
--- @param other_unit_name string 单位名称
UnitPhysicsModule.face_to_unit = function(this_unit_name, other_unit_name)
    LoggerModule.debug("UnitPhysicsModule.face_to_unit", "this_unit_name: " .. tostring(this_unit_name) .. ", face_to_unit: " .. tostring(other_unit_name))
    if type(this_unit_name) ~= "string" or type(other_unit_name) ~= "string" then
        LoggerModule.error("UnitPhysicsModule.face_to_unit", "thisUnitName and otherUnitName must be a string")
        return
    end
    ExecuteAction("NAMED_FACE_NAMED", this_unit_name, other_unit_name)
    LoggerModule.debug("UnitPhysicsModule.face_to_unit", "end")
end


-- TODO: test, package
--- 使单位的朝向路径点 (231)
--- @param unit_table_or_name SystemUnitTable|string 单位名称
--- @param waypoint_name string 路径点名称
UnitPhysicsModule.face_to_waypoint = function(unit_table_or_name, waypoint_name)
    LoggerModule.debug("UnitPhysicsModule.unitFaceToWaypoint", "unitName: " .. tostring(unit_table_or_name) .. ", wayPointName: " .. tostring(waypoint_name))
    if type(unit_table_or_name) ~= "string" or type(waypoint_name) ~= "string" then
        LoggerModule.error("UnitPhysicsModule.face_to_waypoint", "unitName and wayPointName must be a string")
        return
    end
    ExecuteAction("NAMED_FACE_WAYPOINT", unit_table_or_name, waypoint_name)
    LoggerModule.debug("UnitPhysicsModule.face_to_waypoint", "end")
end

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

--- 平移单位
--- @param unit_table SystemUnitTable 单位
--- @param x number x
--- @param y number y
--- @param z number z
UnitPhysicsModule.translate = function(unit_table, x, y, z)
    if type(unit_table) ~= "table" then
        LoggerModule.error("UnitPhysicsModule.translate", "unit_table must be a table")
        return
    end
    if type(x) ~= "number" and type(y) ~= "number" and type(z) ~= "number" then
        LoggerModule.error("UnitPhysicsModule.translate", "x, y, z must be a number")
        return
    end

    local hc = UnitPhysicsModule.get_homogeneous_coordinates(unit_table)
    hc = MatrixUtil.dot(HomogeneousCoordinatesUtil.get_translation_matrix(x, y, z), hc)
    UnitPhysicsModule.set_homogeneous_coordinates(unit_table, hc)
end

-- -- TODO: test, package
-- --- 绕x/y/z轴旋转
-- --- @param unit_table SystemUnitTable 单位
-- --- @param x_angle number 绕x轴角度
-- --- @param y_angle number 绕y轴角度
-- --- @param z_angle number 绕z轴角度
-- UnitPhysicsModule.rotation_by_axis = function(unit_table, x_angle, y_angle, z_angle)
--     local hc = UnitPhysicsModule.get_homogeneous_coordinates(unit_table)
--     local return_back_matrix = HomogeneousCoordinatesUtil.get_return_back_from_origin_translation_matrix_by_hc(hc)

--     hc = MatrixUtil.dot(hc, HomogeneousCoordinatesUtil.get_return_origin_translation_matrix_by_hc(hc))
--     hc = MatrixUtil.dot(hc, HomogeneousCoordinatesUtil.get_rotate_matrix_by_vec({0, 0, 1}, z_angle))
--     hc = MatrixUtil.dot(hc, HomogeneousCoordinatesUtil.get_rotate_matrix_by_vec({0, 1, 0}, y_angle))
--     hc = MatrixUtil.dot(hc, HomogeneousCoordinatesUtil.get_rotate_matrix_by_vec({1, 0, 0}, x_angle))
--     hc = MatrixUtil.dot(hc, return_back_matrix)
    
--     UnitPhysicsModule.set_homogeneous_coordinates(unit_table, hc)
-- end

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

UnitPhysicsModule.rotate_to_target_vec = function(unit_table, target_vec)
    local hc = UnitPhysicsModule.get_homogeneous_coordinates(unit_table)
    local x_dir_vec, y_dir_vec, z_dir_vec = HomogeneousCoordinatesUtil.get_axis_vecs_by_hc(hc)

    local angle = VectorUtil.angle(z_dir_vec, target_vec)
    local axis = VectorUtil.cross_product(z_dir_vec, target_vec)

    hc = MatrixUtil.dot(
        HomogeneousCoordinatesUtil.get_move_back_translation_matrix_by_hc(hc),
        HomogeneousCoordinatesUtil.get_rotation_matrix_by_vec(axis, angle),
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


    local hc = UnitPhysicsModule.get_homogeneous_coordinates(unit_table)

    hc = MatrixUtil.dot(
        HomogeneousCoordinatesUtil.get_move_back_translation_matrix_by_hc(hc),
        HomogeneousCoordinatesUtil.get_uniform_scale_matrix(scale),
        HomogeneousCoordinatesUtil.get_move_origin_translation_matrix_by_hc(hc),
        hc
    )
    
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