UnitRallyModule = {}

--- 设置单位集结点
--- @param object_id number 单位id
--- @param x number 集结点x坐标
--- @param y number 集结点y坐标
--- @param z number 集结点z坐标
UnitRallyModule.set_rally_pos = function(object_id, x, y, z)
    if type(object_id) ~= "number" then
        LoggerModule.error("UnitRallyModule.set_rally_pos", "unit_id must be a number")
        return
    end
    exObjectSetRallyPointPos(object_id, x, y, z)
end

--- 获取单位集结点
--- @param object_id number 单位id
--- @return number x, number y, number z 集结点x,y,z坐标
UnitRallyModule.get_rally_pos = function(object_id)
    if type(object_id) ~= "number" then
        LoggerModule.error("UnitRallyModule.get_rally_pos", "object_id must be a number")
        return nil, nil, nil
    end
    local pos = exObjectGetRallyPointPos(object_id)
    if pos == nil then
        LoggerModule.error("UnitRallyModule.get_rally_pos", "object_id must be a number")
        return nil, nil, nil
    end
    return pos[1], pos[2], pos[3]
end