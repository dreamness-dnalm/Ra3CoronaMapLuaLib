LoggerModule.setup(LoggerLevelEnum.DEBUG, {LoggerTargetEnum.DEBUG_LOG_FILE})

-- unit1 = UnitHelper.get_unit_from_name('unit1')
-- unit2 = UnitHelper.get_unit_from_name('unit2')


-- unit1:add_top_button(45, nil)
-- -- 仅player2可见
-- unit2:add_top_button(45, PlayerEnum.Player_2)

-- -- 30秒后隐藏按钮
-- SchedulerModule.delay_call(function()
--     unit1:set_top_button_visible(nil, nil)
--     unit2:set_top_button_visible(nil, nil)
-- end, 15 * 30)


-- UnitTopButtonModule.register_button_click_callback(
--     function (player_name, unit_id)
--         LoggerModule.info('init.lua', player_name .. ' clicked unit' .. unit_id)
--         if unit_id == unit1.id then
--             unit1:kill()
--         elseif unit_id == unit2.id then
--             unit2:set_max_health(1000)
--             unit2:set_health(1000)
--             -- 移除按钮
--             unit2:remove_top_button()
--         end
--     end
-- )



-- EventHelper.register_unit_top_button_click_event(
--     unit1, 
--     function (player_name, unit)
--         LoggerModule.info('init.lua', player_name .. ' clicked unit1')
--         unit:kill()
--     end
-- )

-- EventHelper.register_unit_top_button_click_event(
--     unit2, 
--     function (player_name, unit)
--         LoggerModule.info('init.lua', player_name .. ' clicked unit2')
--         unit:set_max_health(1000)
--         unit:set_health(1000)
            -- 移除按钮
--         unit:remove_top_button()
--     end
-- )
