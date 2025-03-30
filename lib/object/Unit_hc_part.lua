-- ------------------  齐次坐标相关 ------------------

--- 获取单位的齐次坐标矩阵
--- @return Matrix
function Unit:get_homogeneous_coordinates()
    return UnitPhysicsModule.get_homogeneous_coordinates(self.unit_table)
end

--- 设置单位的齐次坐标矩阵
--- @param matrix Matrix
function Unit:set_homogeneous_coordinates(matrix)
    if type(matrix) ~= "table" then
        LoggerModule.error("Unit:set_homogeneous_coordinates", "matrix must be a table")
        return nil
    end
    UnitPhysicsModule.set_homogeneous_coordinates(self.unit_table, matrix)
end

--- 平移单位(全局坐标)
--- @param vec Vector
function Unit:translate(vec)
    if type(vec) ~= "table" then
        LoggerModule.error("Unit:translate", "vec must be a table")
        return
    end
    UnitPhysicsModule.translate(self.unit_table, vec)
end

--- 平移单位(相对坐标)
--- @param vec Vector
function Unit:translate_relative(vec)
    if type(vec) ~= "table" then
        LoggerModule.error("Unit:translate_relative", "vec must be a table")
        return
    end
    UnitPhysicsModule.translate_relatively(self.unit_table, vec)
end

--- 欧拉角旋转, 具体的旋转方向可使用右手定则确定
--- @param roll_angle number
--- @param pitch_angle number
--- @param yaw_angle number
function Unit:rotate_by_euler(roll_angle, pitch_angle, yaw_angle)
    if type(roll_angle) ~= "number" or type(pitch_angle) ~= "number" or type(yaw_angle) ~= "number" then
        LoggerModule.error("Unit:rotate_by_euler", "roll_angle, pitch_angle, yaw_angle must be a number")
        return
    end
    UnitPhysicsModule.rotate_by_euler(self.unit_table, roll_angle, pitch_angle, yaw_angle)
end

--- 缩放单位
--- @param scale number 缩放比例
function Unit:set_scale(scale)
    if type(scale) ~= "number" then
        LoggerModule.error("Unit:set_scale", "scale must be a number")
        return
    end
    UnitPhysicsModule.set_scale(self.unit_table, scale)    
end

--- 获取单位的缩放比例
--- @return number 在x轴的缩放比例, number 在y轴的缩放比例, number 在z轴的缩放比例
function Unit:get_scale()
    return UnitPhysicsModule.get_scale(self.unit_table)
end

--- 单位镜像, 模型可能会出问题!
--- @param x boolean 是否在x轴镜像
--- @param y boolean 是否在y轴镜像
--- @param z boolean 是否在z轴镜像
function Unit:set_mirror(x, y, z)
    UnitPhysicsModule.set_mirror(self.unit_table, x, y, z)
end

--- 获取单位的方向向量
--- @return Vector
function Unit:get_direction_vec()
    return UnitPhysicsModule.get_direction_vec(self.unit_table)
end