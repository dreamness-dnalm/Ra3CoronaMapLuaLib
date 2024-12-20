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
-- todo 解析出更详细的数据
--- 获取单位的详细信息
--- @param unit_table SystemUnitTable 单位
--- @return table 单位详细信息, 坐标, 旋转, 缩放等
UnitPhysicsModule.get_transform_matrix = function(unit_table)
    if type(unit_table) ~= "table" then
        LoggerModule.error("UnitPhysicsModule.get_detail_matrix", "unit_table must be a table")
        return nil
    end
    return ObjectGetTransform(unit_table)
end

-- TODO: test, package
--- 设置单位的详细信息
--- @param unit_table SystemUnitTable 单位
--- @param matrix table 详细信息
UnitPhysicsModule.set_transform_matrix = function(unit_table, matrix)
    ObjectSetTransform(unit_table, matrix)
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

UnitPhysicsModule.__matrixCount = function(matrix1, matrix2)
    local matrixdata={{0,0,0},{0,0,0},{0,0,0}}
    for i = 1, 3, 1 do
        for j = 1, 3, 1 do
            for k = 1, 3, 1 do
                matrixdata[i][j]=matrixdata[i][j]+matrix1[i][k]*matrix2[k][j]
            end
        end
    end
    return matrixdata
end

UnitPhysicsModule.__getUnitMatrix_X = function(anglex)
    local nx=anglex-floor(anglex/360)*360
    local sina=MathUtil.sin(nx)
    local cosa=MathUtil.cos(nx)
    local matrixforx={{cosa,sina,0},{-sina,cosa,0},{0,0,1}}
    return matrixforx
end

UnitPhysicsModule.__getUnitMatrix_Y = function(anglex)
    local nx=anglex-floor(anglex/360)*360
    local sina=MathUtil.sin(nx)
    local cosa=MathUtil.cos(nx)
    local matrixfory={{cosa,0,sina},{0,1,0},{-sina,0,cosa}}
    return matrixfory
end

UnitPhysicsModule.__getUnitMatrix_Z = function(anglex)
    local nx=anglex-floor(anglex/360)*360
    local cosa=MathUtil.cos(nx)
    local sina=MathUtil.sin(nx)
    local matrixforz={{1,0,0},{0,cosa,-sina},{0,sina,cosa}}
    return matrixforz
end



-- TODO: test, package
--- 设置单位旋转角度
--- @param unit_table SystemUnitTable 单位
--- @param x number x
--- @param y number y
--- @param z number z
UnitPhysicsModule.set_rotate = function(unit_table, x, y, z)
    LoggerModule.debug("UnitPhysicsModule.set_rotate", "unit_table: " .. tostring(unit_table) .. ", x: " .. tostring(x) .. ", y: " .. tostring(y) .. ", z: " .. tostring(z))
    local matrix={{1,-0,0},{0,1,0},{-0,0,1}}
    if x-floor(x/360)*360~=0 then
        matrix= UnitPhysicsModule.__matrixCount(matrix, UnitPhysicsModule.__getUnitMatrix_X(x))
    end
    if y-floor(y/360)*360~=0 then
        matrix= UnitPhysicsModule.__matrixCount(matrix, UnitPhysicsModule.__getUnitMatrix_Y(y))
    end
    if z-floor(z/360)*360~=0 then
        matrix= UnitPhysicsModule.__matrixCount(matrix, UnitPhysicsModule.__getUnitMatrix_Z(z))
    end
    LoggerModule.debug("UnitPhysicsModule.set_rotate", "matrix: " .. tostring(matrix))
    local matrixobject=ObjectGetTransform(unit_table)
    local num=0
    for i = 1, 3, 1 do
        for j = 1, 3, 1 do
            num=num+1
            if num==4 or num==8 then
                num=num+1
            end
            matrixobject[num]=matrix[i][j]
        end
    end
    UnitPhysicsModule.set_transform_matrix(unit_table, matrixobject)
    LoggerModule.debug("UnitPhysicsModule.set_rotate", "end")
end