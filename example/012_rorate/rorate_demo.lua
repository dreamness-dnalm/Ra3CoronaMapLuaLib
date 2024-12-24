--- rorate_demo.lua
--- Created by dreamness
--- DateTime: 12/22/2024 22:52 PM

LoggerModule.setup(LoggerLevelEnum.DEBUG, {LoggerTargetEnum.DEBUG_LOG_FILE})

-- local unit1 = UnitHelper.get_unit_from_name('unit1')
-- unit1:translate(0, 0, 300)
-- unit1:rotate_by_euler(30, 30, 30)
-- unit1:set_scale(2)
-- local sx, sy, sz = unit1:get_scale()
-- LoggerModule.info('rorate_demo', '' .. sx .. ' ' .. sy .. ' ' .. sz)
-- unit1:set_mirror(1, 1, 0)

-- local unit2 = UnitHelper.get_unit_from_name('unit3')
-- local direction_vec = unit2:get_direction_vec()
-- LoggerModule.info('rorate_demo', 'step1')
-- LoggerModule.info('rotate_demo', 'direction_vec: ' .. tostring(direction_vec))
-- LoggerModule.info('rorate_demo', 'direction_vec: ' .. VectorUtil.to_string(direction_vec))

DemoRorate = {}

DemoRorate.config = {
    spaw_waypoint = 'Waypoint 3',
    height = 200,
    left_right_sub_unit_distance = 100,
    start_position = {2300, 4500, 0},
    scale = 2
}

local team_name = TeamModule.from_player_name(PlayerEnum.Player_1)

DemoRorate.main_unit = UnitCreateHelper.create_unit_at_waypoint('main_unit', ThingEnum.JapanMiner, team_name, DemoRorate.config.spaw_waypoint, nil, nil, nil)
DemoRorate.left_sub_unit = UnitCreateHelper.create_unit_at_waypoint('left_sub_unit', ThingEnum.AlliedMCV, team_name, DemoRorate.config.spaw_waypoint, nil, nil, nil)
DemoRorate.right_sub_unit = UnitCreateHelper.create_unit_at_waypoint('right_sub_unit', ThingEnum.AlliedMCV, team_name, DemoRorate.config.spaw_waypoint, nil, nil, nil)

-- DemoRorate.main_unit:set_position_by_vec(DemoRorate.config.start_position)
DemoRorate.main_unit:translate(0, 0, DemoRorate.config.height)

function DemoRorate:update()
    LoggerModule.info('rorate_demo', 'step 1')
    local main_unit = DemoRorate.main_unit
    local left_sub_unit = DemoRorate.left_sub_unit
    local right_sub_unit = DemoRorate.right_sub_unit
    LoggerModule.info('rorate_demo', 'step 2')
    local base_hc = main_unit:get_homogeneous_coordinates()
    LoggerModule.info('rorate_demo', 'step 3')
    -- local main_unit_pos_vec = HomogeneousCoordinatesUtil.get_position_vec_by_hc(base_hc)
    -- main_unit_pos_vec[3] = DemoRorate.config.height
    LoggerModule.info('rorate_demo', 'step 4')
    --- 设置单位高度, 防止单位掉落
    -- HomogeneousCoordinatesUtil.set_position_vec(base_hc, main_unit_pos_vec)
    LoggerModule.info('rorate_demo', 'step 5')
    -- 变换主单位
    -- 对主单位进行放缩
    -- local main_unit_hc = HomogeneousCoordinatesUtil.copy(base_hc)
    -- LoggerModule.info('rorate_demo', 'step 6')
    -- local scale_x, scale_y, scale_z = HomogeneousCoordinatesUtil.get_scale_by_hc(main_unit_hc)
    -- LoggerModule.info('rorate_demo', 'step 7')
    -- if not MathUtil.is_in_error_range(scale_x, DemoRorate.config.scale, 0.05) then
    --     LoggerModule.info('rorate_demo', 'step 8')
    --     main_unit_hc = MatrixUtil.dot(
    --         HomogeneousCoordinatesUtil.get_move_back_translation_matrix_by_hc(main_unist_hc),
    --         HomogeneousCoordinatesUtil.get_uniform_scale_matrix(DemoRorate.config.scale),
    --         HomogeneousCoordinatesUtil.get_move_origin_translation_matrix_by_hc(main_unit_hc),
    --         main_unit_hc
    --     )
    --     LoggerModule.info('rorate_demo', 'step 9')
    -- end
    -- LoggerModule.info('rorate_demo', 'step 10 ' .. VectorUtil.to_string(HomogeneousCoordinatesUtil.get_position_vec_by_hc(main_unit_hc)))
    -- main_unit:set_homogeneous_coordinates(main_unit_hc)
    -- LoggerModule.info('rorate_demo', 'step 11')
    -- local main_unit_x_axis, main_unit_y_axis, main_unit_z_axis = HomogeneousCoordinatesUtil.get_axis_vecs_by_hc(base_hc)

    -- local base_transform_matrix = HomogeneousCoordinatesUtil.get_transform_matrix_by_hc(base_hc)
    -- local base_position_vec = HomogeneousCoordinatesUtil.get_position_vec_by_hc(base_hc)

    -- local left_hc = HomogeneousCoordinatesUtil.merge(
    --     base_transform_matrix,
    --     VectorUtil.add(base_position_vec, {100, 0, 0})
    -- )
    -- left_sub_unit:set_homogeneous_coordinates(left_hc)

    --- 左僚机的偏移方向


    -- local left_sub_unit_translate_vec = main_unit_y_axis
    -- local left_sub_unit_hc = HomogeneousCoordinatesUtil.copy(base_hc)
    -- left_sub_unit_hc = MatrixUtil.dot(
    --     left_sub_unit_hc,
    --     -- HomogeneousCoordinatesUtil.get_move_back_translation_matrix_by_hc(left_sub_unit_hc),
    --     HomogeneousCoordinatesUtil.get_translation_matrix_by_vec(VectorUtil.multiply(left_sub_unit_translate_vec, DemoRorate.config.left_right_sub_unit_distance))
    --     -- HomogeneousCoordinatesUtil.get_move_origin_translation_matrix_by_hc(left_sub_unit_hc),
        
    -- )
    -- left_sub_unit:set_homogeneous_coordinates(left_sub_unit_hc)


    local left_sub_unit_hc = HomogeneousCoordinatesUtil.copy(base_hc)
    -- local transform_matrix = HomogeneousCoordinatesUtil.get_transform_matrix_by_hc(left_sub_unit_hc)
    -- left_sub_unit_hc = MatrixUtil.dot(
    --     HomogeneousCoordinatesUtil.get_translation_matrix_by_vec(
    --         MatrixUtil.dot_vector(transform_matrix, {0, DemoRorate.config.left_right_sub_unit_distance, 0})
    --     ),
    --     left_sub_unit_hc
    -- )
    -- left_sub_unit:set_homogeneous_coordinates(left_sub_unit_hc)

    left_sub_unit:set_homogeneous_coordinates(left_sub_unit_hc)
    left_sub_unit:translate_relative({0, DemoRorate.config.left_right_sub_unit_distance, 0})


    -- --- 右僚机的偏移方向
    -- local right_sub_unit_translate_vec = VectorUtil.multiply(left_sub_unit_translate_vec, -1)
    -- local right_sub_unit_hc = HomogeneousCoordinatesUtil.copy(base_hc)
    -- right_sub_unit_hc = MatrixUtil.dot(
    --     right_sub_unit_hc,
    --     -- HomogeneousCoordinatesUtil.get_move_back_translation_matrix_by_hc(right_sub_unit_hc),
    --     HomogeneousCoordinatesUtil.get_translation_matrix_by_vec(VectorUtil.multiply(right_sub_unit_translate_vec, DemoRorate.config.left_right_sub_unit_distance))
    --     -- HomogeneousCoordinatesUtil.get_move_origin_translation_matrix_by_hc(right_sub_unit_hc),
        
    -- )
    -- right_sub_unit:set_homogeneous_coordinates(right_sub_unit_hc)
end