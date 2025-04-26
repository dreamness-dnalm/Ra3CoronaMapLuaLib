UnitAttachModule = {}


--- 获取单位附着物体
--- @param unit_table SystemUnitTable 单位table
--- @return SystemUnitTable[] 附着物体列表, number 附着物体数量
UnitAttachModule.get_attachers = function(unit_table)
    return ObjectGetAttachers(unit_table)
end

--- 获取单位被附着物体
--- @param unit_table SystemUnitTable 单位table
--- @return SystemUnitTable[], number
UnitAttachModule.get_attachee = function(unit_table)
    return ObjectGetAttachees(unit_table)
end

--- 将一个可附着物体 附着到 其他物体 
--- @param object_id number 可附着物体id（也即必须有attach模块物体）
--- @param be_attached_object_id number 被附着物体id（可以是任何物体）
UnitAttachModule.attach_to_object = function(object_id, be_attached_object_id)
    exObjectAttachToObject(object_id, be_attached_object_id)
end


