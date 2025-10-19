WorldModule = {}

-- TODO: test, doc
--- 获取指定地点的地面高度
--- @param x number x
--- @param y number y
--- @return number 高度
WorldModule.get_terrain_height = function(x, y) 
    if type(x) ~= "number" or type(y) ~= "number" then
        LoggerModule.error("WorldModule.get_terrain_height", "x and y must be a number")
        return nil
    end
    return exTerrainGetHeightByPos(x, y)
end

-- TODO: test, doc
--- 获取指定地点的地面纹理名称
--- @param x number x
--- @param y number y
--- @return string 纹理名称
WorldModule.get_terrain_texture_name = function(x, y) 
    if type(x) ~= "number" or type(y) ~= "number" then
        LoggerModule.error("WorldModule.get_terrain_texture_name", "x and y must be a number")
        return nil
    end
    return exTerrainGetTextureNameByPos(x, y)
end
