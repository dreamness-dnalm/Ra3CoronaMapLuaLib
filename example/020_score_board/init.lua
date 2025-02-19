LoggerModule.setup(LoggerLevelEnum.DEBUG, {LoggerTargetEnum.DEBUG_LOG_FILE})

DemoScoreBoard = {}

DemoScoreBoard.infantry_filter = FilterHelper.new_filter_builder()
    :set_rule(FilterRuleEnum.ANY)
    :add_include_kind_ofs(KindOfEnum.INFANTRY)
    :build()

DemoScoreBoard.vechicle_filter = FilterHelper.new_filter_builder()
    :set_rule(FilterRuleEnum.ANY)
    :add_include_kind_ofs(KindOfEnum.VEHICLE)
    :build()

DemoScoreBoard.building_filter = FilterHelper.new_filter_builder()
    :set_rule(FilterRuleEnum.ANY)
    :add_include_kind_ofs(KindOfEnum.STRUCTURE)
    :build()    

-- 必须要显式地启用记分板
ScoreBoardModule.set_visible(1, nil)

-- 设置记分板标题
ScoreBoardModule.set_title('单位数量统计', nil)

-- 每秒更新一次记分板内容
SchedulerModule.call_every_x_frame(
    function()
        local _, infantry_cnt = DemoScoreBoard.infantry_filter:filter_units(nil, nil)
        local _, vechicle_cnt = DemoScoreBoard.vechicle_filter:filter_units(nil, nil)
        local _, building_cnt = DemoScoreBoard.building_filter:filter_units(nil, nil)
        local score_board_tbl = {
            {'单位类型', '数量'},
            {'步兵', tostring(infantry_cnt)},
            {'车辆', tostring(vechicle_cnt)},
            {'建筑', tostring(building_cnt)}
        }
        
        -- 设置记分板内容
        ScoreBoardModule.set_table_content(score_board_tbl, nil)
    end,
    15,
    nil
)

-- 可用于清空记分板内容
-- ScoreBoardModule.clear(nil)