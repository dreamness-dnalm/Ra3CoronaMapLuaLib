--- HomogeneousCoordinatesUtil.lua
--- Created by dreamness
--- DateTime: 12/13/2024 10:06 PM

--- 齐次坐标的转换工具
HomogeneousCoordinatesUtil = {}

--- Ra3的单位转换矩阵转换为齐次坐标矩阵
--- @param m table
--- @return Matrix
HomogeneousCoordinatesUtil.system_matrix_to_homogeneous_coordinates = function(m)
    return {
        {m[1], m[2], m[3], m[4]},
        {m[5], m[6], m[7], m[8]},
        {m[9], m[10], m[11], m[12]},
        {0, 0, 0, 1}
    }
end

--- 齐次坐标矩阵转换为Ra3的单位转换矩阵
--- @param m Matrix
--- @return table
HomogeneousCoordinatesUtil.homogeneous_coordinates_to_system_matrix = function(m)
    local w = m[4][4]
    return {
        m[1][1], m[1][2], m[1][3], m[1][4],
        m[2][1], m[2][2], m[2][3], m[2][4],
        m[3][1], m[3][2], m[3][3], m[3][4],
    }
end

--- 复制矩阵(深拷贝)
--- @param m Matrix
--- @return Matrix
HomogeneousCoordinatesUtil.copy = function(m)
    return {
        {m[1][1], m[1][2], m[1][3], m[1][4]},
        {m[2][1], m[2][2], m[2][3], m[2][4]},
        {m[3][1], m[3][2], m[3][3], m[3][4]},
        {m[4][1], m[4][2], m[4][3], m[4][4]}
    }
end

--- 齐次坐标矩阵转换为变换矩阵
--- @param m Matrix
--- @return Matrix
HomogeneousCoordinatesUtil.get_transform_matrix_by_hc = function(m)
    if type(m) ~= "table" then
        LoggerModule.error("HomogeneousCoordinatesUtil.get_transform_matrix_by_hc", "m should be a table")
        return nil
    end
    return {
        {m[1][1], m[1][2], m[1][3]},
        {m[2][1], m[2][2], m[2][3]},
        {m[3][1], m[3][2], m[3][3]},
    }
end

--- 获取齐次坐标矩阵的平移矩阵
--- @param vec Vector
--- @return Matrix
HomogeneousCoordinatesUtil.get_translation_matrix_by_vec = function(vec)
    if type(vec) ~= "table" then
        LoggerModule.error("HomogeneousCoordinatesUtil.get_translation_matrix_by_vec", "vec should be a table")
        return nil
    end
    if getn(vec) ~= 3 then
        LoggerModule.error("HomogeneousCoordinatesUtil.get_translation_matrix_by_vec", "vec should have length 3")
        return nil
    end
    return {
        {1, 0, 0, vec[1]},
        {0, 1, 0, vec[2]},
        {0, 0, 1, vec[3]},
        {0, 0, 0, 1}
    }
end

--- 根据齐次坐标矩阵获取单位的x, y, z轴的方向向量
--- @param m Matrix
--- @return Vector, Vector, Vector 分别为x, y, z轴的方向向量
HomogeneousCoordinatesUtil.get_axis_vecs_by_hc = function(m)
    return VectorUtil.to_unit_vec({m[1][1], m[1][2], m[1][3]}),
        VectorUtil.to_unit_vec({m[2][1], m[2][2], m[2][3]}),
        VectorUtil.to_unit_vec({m[3][1], m[3][2], m[3][3]})
end 

--- 获取当前的方向向量
--- @param m Matrix
--- @param origin_vec Vector
--- @return Vector
HomogeneousCoordinatesUtil.get_direction_vec = function(m)
    if type(m) ~= "table" then
        LoggerModule.error("HomogeneousCoordinatesUtil.get_direction_vec", "m should be a table")
        return nil
    end
    local transform_matrix = HomogeneousCoordinatesUtil.get_transform_matrix_by_hc(m)
    return MatrixUtil.dot_vector(transform_matrix, {1, 0, 0})
end

--- 获取平移到原点的齐次坐标矩阵
--- @param m Matrix
--- @return Matrix
HomogeneousCoordinatesUtil.get_move_origin_translation_matrix_by_hc = function(m)
    return HomogeneousCoordinatesUtil.get_translation_matrix_by_vec({-m[1][4], -m[2][4], -m[3][4]})
end

--- 获取从原点平移回去的齐次坐标矩阵
--- @param m Matrix
--- @return Matrix
HomogeneousCoordinatesUtil.get_move_back_translation_matrix_by_hc = function(m)
    return HomogeneousCoordinatesUtil.get_translation_matrix_by_vec({m[1][4], m[2][4], m[3][4]})
end


--- 获取齐次坐标矩阵的缩放矩阵
--- @param x number x轴缩放比例
--- @param y number y轴缩放比例
--- @param z number z轴缩放比例
--- @return Matrix
HomogeneousCoordinatesUtil.get_scale_matrix = function(x, y, z)
    return {
        {x, 0, 0, 0},
        {0, y, 0, 0},
        {0, 0, z, 0},
        {0, 0, 0, 1}
    }
end

--- 获取齐次坐标矩阵的等比缩放矩阵
--- @param s number 缩放比例
--- @return Matrix
HomogeneousCoordinatesUtil.get_uniform_scale_matrix = function(s)
    return HomogeneousCoordinatesUtil.get_scale_matrix(s, s, s)
end

--- 获取齐次坐标矩阵的缩放比例
--- @param m Matrix
--- @return number, number, number 分别在x, y, z轴的缩放比例
HomogeneousCoordinatesUtil.get_scale_by_hc = function(m)
    return VectorUtil.norm({m[1][1], m[1][2], m[1][3]}),
        VectorUtil.norm({m[2][1], m[2][2], m[2][3]}),
        VectorUtil.norm({m[3][1], m[3][2], m[3][3]})
end

--- 获取绕任意向量旋转的矩阵
--- @param vec Vector 向量
--- @param angle number 角度(度数)
HomogeneousCoordinatesUtil.get_rotation_matrix_by_vec = function(vec, angle)
    local x = vec[1]
    local y = vec[2]
    local z = vec[3]
    local c = MathUtil.cos(angle)
    local s = MathUtil.sin(angle)
    local t = 1 - c
    return {
        {t * x * x + c, t * x * y - s * z, t * x * z + s * y, 0},
        {t * x * y + s * z, t * y * y + c, t * y * z - s * x, 0},
        {t * x * z - s * y, t * y * z + s * x, t * z * z + c, 0},
        {0, 0, 0, 1}
    }
end



--- 镜像矩阵
--- @param x boolean 是否x轴镜像
--- @param y boolean 是否y轴镜像
--- @param z boolean 是否z轴镜像
--- @return Matrix
HomogeneousCoordinatesUtil.get_mirror_matrix = function(x, y, z)
    local x_v = 1
    local y_v = 1
    local z_v = 1
    if x then
        x_v = -1
    end
    if y then
        y_v = -1
    end
    if z then
        z_v = -1
    end

    return {
        {x_v, 0, 0, 0},
        {0, y_v, 0, 0},
        {0, 0, z_v, 0},
        {0, 0, 0, 1}
    }
end

--- 根据齐次坐标矩阵获取位置
--- @param m Matrix
--- @return Vector
HomogeneousCoordinatesUtil.get_position_vec_by_hc = function(m)
    return {m[1][4], m[2][4], m[3][4]}
end

--- 设置位置
--- @param m Matrix
--- @param vec Vector
--- @return Matrix
HomogeneousCoordinatesUtil.set_position_vec = function(m, vec)
    m[1][4] = vec[1]
    m[2][4] = vec[2]
    m[3][4] = vec[3]
    return m
end

--- 合并矩阵和位置向量
--- @param transform_matrix Matrix
--- @param position_vector Vector
--- @return Matrix
HomogeneousCoordinatesUtil.merge = function(transform_matrix, position_vector)
    return {
        {transform_matrix[1][1], transform_matrix[1][2], transform_matrix[1][3], position_vector[1]},
        {transform_matrix[2][1], transform_matrix[2][2], transform_matrix[2][3], position_vector[2]},
        {transform_matrix[3][1], transform_matrix[3][2], transform_matrix[3][3], position_vector[3]},
        {0, 0, 0, 1}
    }
end
