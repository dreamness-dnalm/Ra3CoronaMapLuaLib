--- FilterModule.lua
--- Created by dreamness
--- DateTime: 8/10/2024 12:58 AM
---


--- @class AreaDistTypeEnum
AreaDistTypeEnum = {
    CENTER_2D = "CENTER_2D",
    EXTENTS_3D = "EXTENTS_3D",
    -- todo what's this?
    SPHERE = "SPHERE"
}

--- @class SystemFilter


FilterModule = {}

--- 筛选filter的目标单位
--- @param unit_table table|nil 用于关系参考的单位table
--- @param area_config_table AreaConfig 区域配置table
--- @param filter SystemFilter|nil 
--- @return SystemUnitTable[] 单位集合, number 单位数量
FilterModule.filter_units = function(unit_table, area_config_table, filter)
    return ObjectFindObjects(unit_table, area_config_table, filter)
end

--- @class FilterRuleEnum
FilterRuleEnum = {
    ANY = "ANY",
    ALL = "ALL",
    NONE = "NONE"
}

--- @class FilterRelationshipEnum
FilterRelationshipEnum = {
    ENEMIES = "ENEMIES",
    NEUTRAL = "NEUTRAL",
    SELF = "SELF",
    SAME_PLAYER = "SAME_PLAYER",
    ALLIES = "ALLIES",
}

--- 创建filter
--- @param filter_config table
--- @return SystemFilter
FilterModule.create_filter_by_config = function(filter_config)
    -- filterConfig = {
    --     Rule = rule,
    --     Relationship = nil,
    --     Include = nil,
    --     Exclude = nil,
    --     StatusBitFlags = nil,
    --     StatusBitFlagsExclude = nil,
    --     IncludeThing = include_things,
    --     ExcludeThing = exclude_things
    -- }
    -- LoggerModule.debug("FilterModule.create_filter_by_config", "Rule: " .. tostring(filter_config.Rule))
    -- LoggerModule.debug("FilterModule.create_filter_by_config", "Relationship: " .. tostring(filter_config.Relationship))
    -- LoggerModule.debug("FilterModule.create_filter_by_config", "Include: " .. tostring(filter_config.Include))
    -- LoggerModule.debug("FilterModule.create_filter_by_config", "Exclude: " .. tostring(filter_config.Exclude))
    -- LoggerModule.debug("FilterModule.create_filter_by_config", "StatusBitFlags: " .. tostring(filter_config.StatusBitFlags))
    -- LoggerModule.debug("FilterModule.create_filter_by_config", "StatusBitFlagsExclude: " .. tostring(filter_config.StatusBitFlagsExclude))
    -- LoggerModule.debug("FilterModule.create_filter_by_config", "IncludeThing: " .. tostring(filter_config.IncludeThing))
    -- LoggerModule.debug("FilterModule.create_filter_by_config", "ExcludeThing: " .. tostring(filter_config.ExcludeThing))


    return CreateObjectFilter(filter_config)
end

--- 创建filter
--- @param rule FilterRuleEnum|nil filterRuleEnum
--- @param relationships FilterRelationshipEnum[]|nil 关系
--- @param include_kind_ofs KindOfEnum[]|nil 包含单位种类
--- @param exclude_kind_ofs KindOfEnum[]|nil 排除单位种类
--- @param include_statuses StatusEnum[]|nil 包含状态
--- @param exclude_statuses StatusEnum[]|nil 排除状态
--- @param include_things ThingEnum[]|nil 包含单位
--- @param exclude_things ThingEnum[]|nil 排除单位
--- @return SystemFilter
FilterModule.create_filter = function(rule, relationships, include_kind_ofs, exclude_kind_ofs, include_statuses, exclude_statuses, include_things, exclude_things)
    local filterConfig = {
        Rule = rule,
        Relationship = nil,
        Include = nil,
        Exclude = nil,
        StatusBitFlags = nil,
        StatusBitFlagsExclude = nil,
        IncludeThing = include_things,
        ExcludeThing = exclude_things
    }
    if relationships ~= nil then
        filterConfig.Relationship = StringUtil.make_string(relationships, " ")
    end
    if include_kind_ofs ~= nil then
        filterConfig.Include = StringUtil.make_string(include_kind_ofs, " ")
    end
    if exclude_kind_ofs ~= nil then
        filterConfig.Exclude = StringUtil.make_string(exclude_kind_ofs, " ")
    end
    if include_statuses ~= nil then
        filterConfig.StatusBitFlags = StringUtil.make_string(include_statuses, " ")
    end
    if exclude_statuses ~= nil then
        filterConfig.StatusBitFlagsExclude = StringUtil.make_string(exclude_statuses, " ")
    end
    return FilterModule.create_filter_by_config(filterConfig)
end

--- @class AreaConfig
--- @field X number 中心x
--- @field Y number 中心y
--- @field Z number 中心z
--- @field Radius number 半径
--- @field DistType AreaDistTypeEnum 区域距离类型

--- 创建区域配置
--- @param center_x number 中心x
--- @param center_y number 中心y
--- @param center_z number 中心z
--- @param radius number 半径
--- @param area_dist_type AreaDistTypeEnum 区域距离类型
--- @return AreaConfig
FilterModule.create_area_config = function(center_x, center_y, center_z, radius, area_dist_type)
   return {
         X = center_x, Y = center_y, Z = center_z,
         Radius = radius,
         DistType = area_dist_type
   }
end

--- 单位是否通过筛选器
--- @param unit_table SystemUnitTable
--- @param relation_reference_unit_table SystemUnitTable
--- @param filter SystemFilter
FilterModule.is_unit_pass_filter = function(unit_table, relation_reference_unit_table, filter)
    return ObjectTestTargetObjectWithFilter(unit_table, relation_reference_unit_table, filter)
end