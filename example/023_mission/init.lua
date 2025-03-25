
-- local u1 = UnitHelper.get_unit_from_name("u1")
-- local u2 = UnitHelper.get_unit_from_name("u2")

-- 任务热点

-- -- 在单位上生成任务热点
-- MissionHotSpotModule.link("H1", 1, u1.unit_table, nil)

-- -- 在路径点生成任务热点
-- MissionHotSpotModule.link("H2", 1, nil, "Player_1_Start")

-- -- 需要显式地设置任务可见
-- MissionHotSpotModule.set_visible("H1", 1)
-- MissionHotSpotModule.set_visible("H2", 1)

-- --- 点击回调函数
-- function hotspot_event_callback(hotspot_id)
--     -- 打印出被点击的热点id
--     LoggerModule.log("hotspot activated id: " .. hotspot_id, LoggerTargetEnum.CHAT_MSG)
--     -- 点击后设置热点不可见
--     MissionHotSpotModule.set_visible(hotspot_id, nil)
-- end

-- -- 注册任务热点检测事件, 注意: 这个点击事件只能响应一次
-- EventHelper.register_mission_hotspot_event("H1", hotspot_event_callback)

-- EventHelper.register_mission_hotspot_event("H2", hotspot_event_callback)


-- -- 任务目标

-- 将单位或路径点绑定到任务目标上
-- MissionModule.link_mission_objective("M1", 1,MissionObjectiveCategoryEnum.PROTECT, u1.unit_table, nil)
-- MissionModule.link_mission_objective("M1", 1,MissionObjectiveCategoryEnum.ATTACK, u2.unit_table, nil)
-- MissionModule.link_mission_objective("M1", 1,MissionObjectiveCategoryEnum.BUILD, nil, "Player_1_Start")
-- MissionModule.link_mission_objective("M1", 1,MissionObjectiveCategoryEnum.CAPTURE, nil, "Player_2_Start")

-- -- 需要这样设置一下, 才能在屏幕上方显示任务目标
-- MissionModule.show_mission_objective("M1", nil)
-- MissionModule.show_mission_objective("M1", 1)

-- Mission_M1_end_flag = nil

-- SchedulerModule.call_every_x_frame(function()
--     local u1 = UnitHelper.get_unit_from_name("u1")
--     local u2 = UnitHelper.get_unit_from_name("u2")
--     if not Mission_M1_end_flag then
--         -- 如果单位u1被摧毁, 则设置任务目标失败
--         if u1 == nil or not u1:is_alive() then
--             MissionModule.set_mission_objective_status("M1", MissionObjectStatusEnum.FAILED)
--         -- 隐藏任务目标
--         MissionModule.show_mission_objective("M1", nil)
--         Mission_M1_end_flag = 1
--         end

--     -- 如果单位u2被摧毁, 则设置任务目标完成
--         if u2 == nil or not u2:is_alive() then
--             MissionModule.set_mission_objective_status("M1", MissionObjectStatusEnum.COMPLETED)
--             -- 隐藏任务目标
--             MissionModule.show_mission_objective("M1", nil)
--             Mission_M1_end_flag = 1
--         end
--     end
-- end, 1, nil, nil)

-- -- 雷达事件
-- 在单位上生成雷达事件
-- RadarEventModule.create_radar_event(RadarEventTypeEnum.UPGRADE, u1.unit_table, nil, nil)

-- -- 在队伍上生成雷达事件
-- RadarEventModule.create_radar_event(RadarEventTypeEnum.INFILTRATION, nil, TeamModule.from_player_name("Player_1"), nil)

-- -- 在指定坐标生成雷达事件
-- RadarEventModule.create_radar_event(RadarEventTypeEnum.UNDER_ATTACK, nil, nil, {1000, 1000, 0})








