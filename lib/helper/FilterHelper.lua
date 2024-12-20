--- FilterHelper.lua
--- Created by dreamness
--- DateTime: 10/18/2024 5:31 PM
---

--- @class FilterBuilder
--- @field rule FilterRuleEnum[]
--- @field relationships FilterRelationshipEnum[]
--- @field include_things ThingEnum[]
--- @field exclude_things ThingEnum[]
--- @field include_statuses StatusEnum[]
--- @field exclude_statuses StatusEnum[]
--- @field include_kind_ofs KinkOfEnum[]
--- @field exclude_kind_ofs KinkOfEnum[]
FilterBuilder = {}

--- @class FilterHelper
FilterHelper = {}

-- TODO: test
--- 新建Filter构建器
--- @return FilterBuilder
FilterHelper.new_filter_builder = function()
    --- @type FilterBuilder
    local obj = {}
    settag(obj, _meta.tags.filter_builder_tag)
    settagmethod(_meta.tags.filter_builder_tag, "index", function(t, key)
        return FilterBuilder[key]
    end)
    return obj
end

-- TODO: test
--- 创建区域配置
--- @param center_x number 中心x
--- @param center_y number 中心y
--- @param center_z number 中心z
--- @param radius number 半径
--- @param area_dist_type areaDistTypeEnum 区域距离类型
--- @return AreaConfig
FilterHelper.new_area_config = function(center_x, center_y, center_z, radius, area_dist_type)
    return FilterModule.create_area_config(center_x, center_y, center_z, radius, area_dist_type)
end

-- TODO: test
--- 创建Filter构建器
--- @return Filter
function FilterBuilder:build()
    local system_filter = FilterModule.create_filter(
            self.rule,
            self.relationships,
            self.include_kind_ofs,
            self.exclude_kind_ofs,
            self.include_statuses,
            self.exclude_statuses,
            self.include_things,
            self.exclude_things
    )

    local obj = { system_filter = system_filter }
    settag(obj, _meta.tags.filter_tag)
    settagmethod(_meta.tags.filter_tag, "index", function(t, key)
        return Filter[key]
    end)
    return obj
end

-- TODO: test
--- 添加包含的单位
--- @param units ThingEnum[]|string 单位名字数组或单位名字
--- @return FilterBuilder
function FilterBuilder:add_include_things(things)
    if self.include_things == nil then
        self.include_things = {}
    end
    if type(things) == 'string' then
        tinsert(self.include_things, things)
    elseif type(things) == 'table' then
        for i = 1, getn(things) do
            tinsert(self.include_things, things[i])
        end
    else
        LoggerModule.error('FilterBuilder:add_include_things', 'things type error: ' .. type(things))
    end
    return self
end

-- TODO: test
--- 添加排除的单位
--- @param units ThingEnum[]|string 单位名字数组或单位名字
--- @return FilterBuilder
function FilterBuilder:add_exclude_things(things)
    if self.exclude_things == nil then
        self.exclude_things = {}
    end
    if type(things) == 'string' then
        tinsert(self.exclude_things, things)
    elseif type(things) == 'table' then
        for i = 1, getn(things) do
            tinsert(self.exclude_things, things[i])
        end
    else
        LoggerModule.error('FilterBuilder:add_exclude_things', 'things type error: ' .. type(things))
    end
    return self
end

-- TODO: test
--- 添加包含的状态
--- @param statuses StatusEnum[]|string 状态数组或状态
--- @return FilterBuilder
function FilterBuilder:add_include_statuses(statuses)
    if self.include_statuses == nil then
        self.include_statuses = {}
    end
    if type(statuses) == 'string' then
        tinsert(self.include_statuses, statuses)
    elseif type(statuses) == 'table' then
        for i = 1, getn(statuses) do
            tinsert(self.include_statuses, statuses[i])
        end
    else
        LoggerModule.error('FilterBuilder:add_include_statuses', 'statuses type error: ' .. type(statuses))
    end
    return self
end

-- TODO: test
--- 添加排除的状态
--- @param statuses StatusEnum[]|string 状态数组或状态
--- @return FilterBuilder
function FilterBuilder:add_exclude_statuses(statuses)
    if self.exclude_statuses == nil then
        self.exclude_statuses = {}
    end
    if type(statuses) == 'string' then
        tinsert(self.exclude_statuses, statuses)
    elseif type(statuses) == 'table' then
        for i = 1, getn(statuses) do
            tinsert(self.exclude_statuses, statuses[i])
        end
    else
        LoggerModule.error('FilterBuilder:add_exclude_statuses', 'statuses type error: ' .. type(statuses))
    end
    return self
end

-- TODO: test
--- 添加包含的种类(kind of)
--- @param kind_ofs string[]|string 种类数组或种类
--- @return FilterBuilder
function FilterBuilder:add_include_kind_ofs(kind_ofs)
    if self.include_kind_ofs == nil then
        self.include_kind_ofs = {}
    end
    if type(kind_ofs) == 'string' then
        tinsert(self.include_kind_ofs, kind_ofs)
    elseif type(kind_ofs) == 'table' then
        for i = 1, getn(kind_ofs) do
            tinsert(self.include_kind_ofs, kind_ofs[i])
        end
    else
        LoggerModule.error('FilterBuilder:add_include_kind_ofs', 'kind_ofs type error: ' .. type(kind_ofs))
    end
    return self
end

-- TODO: test
--- 添加排除的种类(kind of)
--- @param kind_ofs string[]|string 种类数组或种类
--- @return FilterBuilder
function FilterBuilder:add_exclude_kind_ofs(kind_ofs)
    if self.exclude_kind_ofs == nil then
        self.exclude_kind_ofs = {}
    end
    if type(kind_ofs) == 'string' then
        tinsert(self.exclude_kind_ofs, kind_ofs)
    elseif type(kind_ofs) == 'table' then
        for i = 1, getn(kind_ofs) do
            tinsert(self.exclude_kind_ofs, kind_ofs[i])
        end
    else
        LoggerModule.error('FilterBuilder:add_exclude_kind_ofs', 'kind_ofs type error: ' .. type(kind_ofs))
    end
    return self
end

-- TODO: test
--- 添加关系过滤
--- @param relationships FilterRelationshipEnum[]|string 关系数组或关系
--- @return FilterBuilder
function FilterBuilder:add_relationships(relationships)
    if self.relationships == nil then
        self.relationships = {}
    end
    if type(relationships) == 'string' then
        tinsert(self.relationships, relationships)
    elseif type(relationships) == 'table' then
        for i = 1, getn(relationships) do
            tinsert(self.relationships, relationships[i])
        end
    else
        LoggerModule.error('FilterBuilder:add_relationships', 'relationships type error: ' .. type(relationships))
    end
    return self
end

-- TODO: test
--- 添加规则过滤
--- @param rule FilterRuleEnum
--- @return FilterBuilder
function FilterBuilder:set_rule(rule)
    if rule == nil then
        self.rule = nil
    elseif type(rule) == 'string' then
        self.rule = rule
    else
        LoggerModule.error('FilterBuilder:add_rule', 'rule type error: ' .. type(rule))
    end
    return self
end