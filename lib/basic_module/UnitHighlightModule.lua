--- HighlightModule.lua
--- Created by dreamness
--- DateTime: 12/21/2024 10:11 PM

--- 单位高亮模块
UnitHighlightModule = {}

--- 单位白色闪烁 (194) unit_white_flash和unit_flash差不多
--- @param unit_name_or_table SystemUnitTable|string 单位名或单位table
--- @param seconds number 闪烁时间
UnitHighlightModule.unit_white_flash = function(unit_name_or_table, seconds)
    if type(unit_name_or_table) ~= "table" and type(unit_name_or_table) ~= "string" then
        LoggerModule.error('UnitHighlightModule.unit_white_flash', 'unit_name_or_table should be table or string')
        return
    end
    if type(seconds) ~= "number" then
        LoggerModule.error('UnitHighlightModule.unit_white_flash', 'seconds should be number')
        return
    end
    ExecuteAction("NAMED_FLASH_WHITE", unit_name_or_table, ceil(seconds))
end

-- 单位闪烁 (70) unit_white_flash和unit_flash差不多
--- @param unit_name_or_table SystemUnitTable|string 单位名或单位table
--- @param seconds number 闪烁时间
UnitHighlightModule.unit_flash = function(unit_name_or_table, seconds)
    if type(unit_name_or_table) ~= "table" and type(unit_name_or_table) ~= "string" then
        LoggerModule.error('UnitHighlightModule.unit_flash', 'unit_name_or_table should be table or string')
        return
    end
    if type(seconds) ~= "number" then
        LoggerModule.error('UnitHighlightModule.unit_flash', 'seconds should be number')
        return
    end
    ExecuteAction("NAMED_FLASH", unit_name_or_table, ceil(seconds))
end

--- @class UnitOutlineTypeEnum
UnitOutlineTypeEnum = {
    NONE = "NONE",
    YELLOW = "SELECTED",
    WHITE = "HOVER_SELECT",
    RED = "HOVER_ATTACK"
}

--- 为单位标注轮廓 (512)
--- @param unit_name_or_table SystemUnitTable|string 单位名或单位table
--- @param outline_type UnitOutlineTypeEnum 轮廓类型 
UnitHighlightModule.unit_outline = function(unit_name_or_table, outline_type)
    if type(unit_name_or_table) ~= "table" and type(unit_name_or_table) ~= "string" then
        LoggerModule.error('UnitHighlightModule.unit_outline', 'unit_name_or_table should be table or string')
        return
    end
    if type(outline_type) ~= "string" then
        LoggerModule.error('UnitHighlightModule.unit_outline', 'outline_type should be string')
        return
    end
    ExecuteAction("NAMED_OUTLINE", unit_name_or_table, outline_type)
end

