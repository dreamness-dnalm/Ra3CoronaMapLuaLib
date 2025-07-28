AreaModule = {}


-- TODO: test, doc
--- 单位是否在指定区域  [9]
--- @param unit_table_or_name string | table 单位名称或单位表
--- @param area_name string 区域名称
--- @return boolean
AreaModule.is_unit_in_area = function(unit_table_or_name, area_name)
    if type(unit_table_or_name) ~= 'string' and type(unit_table_or_name) ~= 'table' then
        logger.error("AreaModule.is_unit_in_area", "unit_table_or_name is not a string or table")
        return nil
    end
    if type(area_name) ~= 'string' then
        logger.error("AreaModule.is_unit_in_area", "area_name is not a string")
        return nil
    end

    return GameModule.from_ra3_boolean(EvaluateCondition('NAMED_INSIDE_AREA', unit_table_or_name, area_name)) -- [9]
end







