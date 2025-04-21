--- UnitHelper.lua
--- Created by dreamness
--- DateTime: 10/13/2024 2:52 PM
---

--- 单位帮助类
UnitHelper = {}

UnitHelper.__unit_auto_number = 0

--- 获取一个不重复的名字
--- @return string
function UnitHelper.get_unit_auto_name()
    UnitHelper.__unit_auto_number = UnitHelper.__unit_auto_number + 1
    return 'name_temp_name__' .. UnitHelper.__unit_auto_number
end

--- 根据id获取Unit对象
--- @param id number
--- @return Unit
function UnitHelper.get_unit_from_id(id)
    return UnitHelper.build_unit(UnitModule.from_id(id), nil)
end

--- 根据名字获取Unit对象
--- @param name string
--- @return Unit
function UnitHelper.get_unit_from_name(name)
    return UnitHelper.build_unit(UnitModule.from_name(name), name)
end

--- 根据unit table获取Unit对象
--- @param unit_table SystemUnitTable
--- @return Unit
function UnitHelper.get_unit_from_table(unit_table)
    return UnitHelper.build_unit(unit_table, nil)
end

--- 构建单位对象
--- @param unit_table SystemUnitTable
--- @param name string|nil 单位名字
--- @return Unit
function UnitHelper.build_unit(unit_table, name)
    if unit_table == nil then
        return nil
    end
    local unit_id = UnitModule.to_id(unit_table)
    if unit_id == nil then
        return nil
    end
    local final_name = name
    if final_name == nil then
        final_name = 'name_temp_name__id_' .. tostring(unit_id)
        UnitModule.name_unit(final_name, unit_table)
    end
    

    local obj = { unit_table = unit_table, name = final_name, id = unit_id }

    settag(obj, _meta.tags.unit_tag)

    settagmethod(_meta.tags.unit_tag, "index", function(t, key)
        return Unit[key]
    end)

    return obj
end





