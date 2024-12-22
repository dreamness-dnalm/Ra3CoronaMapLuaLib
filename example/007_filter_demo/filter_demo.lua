--- filter_demo.lua
--- Created by dreamness
--- DateTime: 12/21/2024 07:00 PM

--- 过滤器演示

DemoFilter = {}

-- 建议过滤器提前定义好, 避免每帧重复创建

-- 使用链式调用创建过滤器, 请放心, 所有都是有提示和自动补全的
DemoFilter.unit_filter = FilterHelper.new_filter_builder() -- 通过FilterHelper创建一个过滤器构建器
    :set_rule(FilterRuleEnum.ALL) 
    :add_relationships(FilterRelationshipEnum.SAME_PLAYER)
    :add_include_things(ThingEnum.AlliedMiner) 
    :add_include_things({ThingEnum.AlliedMCV, ThingEnum.AlliedMCV_Enhanced})
    :add_exclude_kind_ofs({KindOfEnum.AIRCRAFT, KindOfEnum.VEHICLE})
    :add_include_kind_ofs({KindOfEnum.SELECTABLE, KindOfEnum.EGG})
    :add_include_statuses(StatusEnum.HIJACKED)
    :add_exclude_statuses({StatusEnum.NO_ATTACK, StatusEnum.UNPACKING})
    :build()

function DemoFilter:do_filter()
    -- 获取一个参考单位
    local refer_unit = UnitHelper.get_unit_from_name('test_unit')
    local x, y, z = refer_unit:get_position()
    
    -- 创建filter的过滤区域
    local area = FilterHelper.new_area_config(x, y, z, 100, AreaDistTypeEnum.EXTENTS_3D)

    -- 过滤单位
    -- 如果全图过滤, 可以不传入area参数
    -- 如果在过滤器中设置了关系(relationships), 必须传入第二个参数(用于关系判断)
    -- 返回值为过滤后的单位列表(Unit)和单位数量
    local units, unit_cnt = DemoFilter.unit_filter:filter_units(area, refer_unit)

     -- 判断一个单位是否通过过滤器
    local is_pass = DemoFilter.unit_filter:is_pass(units[1], refer_unit)

    -- 删除过滤到的单位
    for i = 1, unit_cnt do
        local unit = units[i]
        unit:delete()
    end
end
