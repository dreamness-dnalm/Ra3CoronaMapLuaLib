--- Filter.lua
--- Created by dreamness
--- DateTime: 10/18/2024 5:30 PM
---

--- 过滤器对象
--- @class Filter
--- @field system_filter x
Filter = {}

--- 过滤单位
--- @param area_config AreaConfig 区域配置
--- @param relation_reference_unit Unit 单位
--- @return Unit[], number
function Filter:filter_units(area_config, relation_reference_unit)
    local filter = self.system_filter
    local reference_table_table = nil
    if relation_reference_unit ~= nil then
        reference_table_table = relation_reference_unit.unit_table
        if reference_table_table == nil then
            LoggerModule.error("Filter:filter_units", "Unit.unit_table should be not be nil")
            return nil, nil
        end
    end
    local unit_tables, cnt = FilterModule.filter_units(reference_table_table, area_config, filter)
    if unit_tables == nil then
        LoggerModule.error("Filter:filter_units", "filter_units failed")
        return nil, nil
    end
    local units = {}
    for i = 1, cnt do
        local unit = UnitHelper.get_unit_from_table(unit_tables[i])
        if unit == nil then
            LoggerModule.error("Filter:filter_units", "build_unit failed")
        else
            tinsert(units, unit)
        end
    end
    return units, getn(units)
end

--- 单位是否通过过滤器
--- @param unit Unit 单位
--- @param reference_unit Unit 参考单位
function Filter:is_pass(unit, relation_reference_unit)
    if unit == nil then
        return nil
    end

    local filter = self.system_filter
    local reference_table_table = nil
    if relation_reference_unit ~= nil then
        reference_table_table = relation_reference_unit.unit_table
    end
    return FilterModule.is_unit_pass_filter(reference_table_table, unit.unit_table, filter)

end