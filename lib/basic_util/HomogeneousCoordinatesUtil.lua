--- HomogeneousCoordinatesUtil.lua
--- Created by dreamness
--- DateTime: 12/13/2024 10:06 PM

--- 齐次坐标的转换工具
HomogeneousCoordinatesUtil = {}

--- Ra3的单位转换矩阵转换为齐次坐标矩阵
--- @param m table
--- @return Matrix
function HomogeneousCoordinatesUtil.transform_matrix_to_homogeneous_coordinates(m)
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
function HomogeneousCoordinatesUtil.homogeneous_coordinates_to_transform_matrix(m)
    local w = m[4][4]
    return {
        m[1][1], m[1][2], m[1][3], m[1][4],
        m[2][1], m[2][2], m[2][3], m[2][4],
        m[3][1], m[3][2], m[3][3], m[3][4],
    }
end