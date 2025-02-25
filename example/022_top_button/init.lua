logger.setup(LoggerLevelEnum.DEBUG, {LoggerTargetEnum.DEBUG_LOG_FILE})

DemoTopButton = {}

DemoTopButton._meta = {
    [1] = {
        cd = 30,
        Player_1 = 1,
        Player_2 = 1,
    },
    [2] = {
        cd = 50,
        Player_1 = 1,
        Player_2 = 1,
    },
}

TopButtonModule.set_visible(1, nil)
-- 设置顶部按钮标题
-- 按钮图片在这里找: https://www.yuque.com/muzeqaq/ra3mapwiki/rhcdgqr2au5q8hc4
TopButtonModule.add_or_update_button(1, 'Button_PlayerPower_VacuumBomb', '按钮1描述', nil)
TopButtonModule.add_or_update_button(2, 'CelestialSonarOn', '按钮2描述', nil)

EventHelper.register_top_button_click_event(1, function(player_name, shift_pressed)
    -- 如果按钮1的冷却时间还没到, 不响应
    if DemoTopButton._meta[1][player_name] < DemoTopButton._meta[1].cd then
        return
    end
    PublicBoardModule.show_text('按钮1被按下了' .. 'player_name: ' .. tostring(player_name) .. ', shift键被按下: ' .. tostring(shift_pressed), 10)
    -- 某个玩家按下按钮1后, 重置按钮1的冷却
    DemoTopButton._meta[1][player_name] = 1
end
)

EventHelper.register_top_button_click_event(2, function(player_name, shift_pressed)
    -- 如果按钮1的冷却时间还没到, 不响应
    if DemoTopButton._meta[2][player_name] < DemoTopButton._meta[2].cd then
        return
    end
    PublicBoardModule.show_text('按钮2被按下了' .. 'player_name: ' .. tostring(player_name) .. ', shift键被按下: ' .. tostring(shift_pressed), 10)
    DemoTopButton._meta[2][player_name] = 1
end
)

SchedulerModule.call_every_x_frame(
    function()
        for btn_index = 1, 2 do
            local meta = DemoTopButton._meta[btn_index]
            for player_index = 1, 2 do
                local player_name = 'Player_' .. tostring(player_index)
                local cd = meta.cd
                local percentage = floor((meta[player_name] / cd) * 100)
                if meta[player_name] < cd then
                    -- 按钮技能冷却中
                    -- 显示时间特效
                    TopButtonModule.set_button_time_overlay_visible(btn_index, 1, player_name)
                    -- 设置时间特效的百分比
                    TopButtonModule.set_button_time_overlay_value(btn_index, percentage, player_name)
                    -- 显示血条特效
                    TopButtonModule.set_button_hp_bar_visible(btn_index, 1, player_name)
                    -- 显示血条特效的百分比
                    TopButtonModule.set_button_hp_bar_value(btn_index, percentage, player_name)
                    -- 禁止按钮高亮
                    TopButtonModule.set_button_highlight(btn_index, nil, player_name)
                    -- 设置为禁用状态(仅视觉, 变灰, 仍响应点击事件)
                    TopButtonModule.set_button_enabled(btn_index, nil, player_name)

                    meta[player_name] = meta[player_name] + 1
                else
                    -- 按钮技能冷却完毕
                    -- 隐藏时间特效
                    TopButtonModule.set_button_time_overlay_visible(btn_index, nil, player_name)
                    -- 隐藏血条特效
                    TopButtonModule.set_button_hp_bar_visible(btn_index, nil, player_name)
                    -- 显示按钮高亮
                    TopButtonModule.set_button_highlight(btn_index, 1, player_name)
                    -- 设置为可用状态
                    TopButtonModule.set_button_enabled(btn_index, 1, player_name)
                end
            end
        end
    end, 
    1
)