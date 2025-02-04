TopButtonModule = {}

--- 设置顶部安全区域整体可见性
--- @param visible boolean 是否可见
--- @param player_name_list PlayerEnum|PlayerEnum[]|nil 玩家名字列表, nil则针对所有玩家
TopButtonModule.set_visible = function(visible, player_name_list)
    local visible_value = 0
    if visible then
        visible_value = 1
    end
    if type(player_name_list) == 'nil' then
        exCenterTopBtnsChangeVisibility(visible_value)
    elseif type(player_name_list) == 'table' then
        for i = 1, getn(player_name_list) do
            if type(player_name_list[i]) ~= 'string' then
                LoggerModule.warn('TopButtonModule.set_visible', 'player_name_list element type error:' .. type(player_name_list[i]))
            else
                exCenterTopBtnsChangeVisibilityForPlayer(player_name_list[i], visible_value)
            end
        end
    elseif type(player_name_list) == 'string' then
        exCenterTopBtnsChangeVisibilityForPlayer(player_name_list, visible_value)
    else
        LoggerModule.error('TopButtonModule.set_visible', 'player_name_list type error:' .. type(player_name_list))
    end
end

--- 添加按钮, 更新按钮贴图
--- @param pos_index number 位置索引, 1-6
--- @param texture_name string 贴图名字
--- @param content string 描述文字
--- @param player_name_list PlayerEnum|PlayerEnum[]|nil 玩家名字列表, nil则针对所有玩家
TopButtonModule.add_or_update_button = function(pos_index, texture_name, content, player_name_list)
    if type(pos_index) ~= 'number' then
        LoggerModule.error('TopButtonModule.add_button', 'pos_index type error:' .. type(pos_index))
        return
    end
    if pos_index < 1 or pos_index > 6 then
        LoggerModule.error('TopButtonModule.add_button', 'pos_index must be in [1, 6], pos_index=' .. pos_index)
        return
    end
    if type(texture_name) ~= 'string' then
        LoggerModule.error('TopButtonModule.add_button', 'texture_name type error:' .. type(texture_name))
        return
    end
    if type(content) ~= 'string' then
        LoggerModule.error('TopButtonModule.add_button', 'content type error:' .. type(content))
        return
    end
    if player_name_list == nil then
        exCenterTopBtnShow(pos_index, texture_name, content)
    elseif type(player_name_list) == 'table' then
        for i = 1, getn(player_name_list) do
            if type(player_name_list[i]) ~= 'string' then
                LoggerModule.warn('TopButtonModule.add_button', 'player_name_list element type error:' .. type(player_name_list[i]))
            else
                exCenterTopBtnShowForPlayer(player_name_list[i], pos_index, texture_name, content)
            end
        end
    elseif type(player_name_list) == 'string' then
        exCenterTopBtnShowForPlayer(player_name_list, pos_index, texture_name, content)
    else
        LoggerModule.error('TopButtonModule.add_button', 'player_name_list type error:' .. type(player_name_list))
    end
end

--- 设置按钮可见性
--- @param pos_index number 位置索引, 1-6
--- @param visible boolean 是否可见
--- @param player_name_list PlayerEnum|PlayerEnum[]|nil 玩家名字列表, nil则针对所有玩家
TopButtonModule.set_button_visible = function(pos_index, visible, player_name_list)
    if type(pos_index) ~= 'number' then
        LoggerModule.error('TopButtonModule.set_button_visible', 'pos_index type error:' .. type(pos_index))
        return
    end
    if pos_index < 1 or pos_index > 6 then
        LoggerModule.error('TopButtonModule.set_button_visible', 'pos_index must be in [1, 6], pos_index=' .. pos_index)
        return
    end
    local visible_value = 0
    if visible then
        visible_value = 1
    end
    if type(player_name_list) == 'nil' then
        exCenterTopBtnSetVisibility(pos_index, visible_value)
    elseif type(player_name_list) == 'table' then
        for i = 1, getn(player_name_list) do
            if type(player_name_list[i]) ~= 'string' then
                LoggerModule.warn('TopButtonModule.set_button_visible', 'player_name_list element type error:' .. type(player_name_list[i]))
            else
                exCenterTopBtnSetVisibilityForPlayer(player_name_list[i], pos_index, visible_value)
            end
        end
    elseif type(player_name_list) == 'string' then
        exCenterTopBtnSetVisibilityForPlayer(player_name_list, pos_index, visible_value)
    else
        LoggerModule.error('TopButtonModule.set_button_visible', 'player_name_list type error:' .. type(player_name_list))
    end
end

--- 设置按钮高亮
--- @param pos_index number 位置索引, 1-6
--- @param enabled boolean 是否高亮
--- @param player_name_list PlayerEnum|PlayerEnum[]|nil 玩家名字列表, nil则针对所有玩家
TopButtonModule.set_button_highlight = function(pos_index, enabled, player_name_list)
    if type(pos_index) ~= 'number' then
        LoggerModule.error('TopButtonModule.set_button_highlight', 'pos_index type error:' .. type(pos_index))
        return
    end
    if pos_index < 1 or pos_index > 6 then
        LoggerModule.error('TopButtonModule.set_button_highlight', 'pos_index must be in [1, 6], pos_index=' .. pos_index)
        return
    end
    local enabled_value = 0
    if enabled then
        enabled_value = 1
    end
    if type(player_name_list) == 'nil' then
        exCenterTopBtnToggleHighLight(pos_index, enabled_value)
    elseif type(player_name_list) == 'table' then
        for i = 1, getn(player_name_list) do
            if type(player_name_list[i]) ~= 'string' then
                LoggerModule.warn('TopButtonModule.set_button_highlight', 'player_name_list element type error:' .. type(player_name_list[i]))
            else
                exCenterTopBtnToggleHighLightForPlayer(player_name_list[i], pos_index, enabled_value)
            end
        end
    elseif type(player_name_list) == 'string' then
        exCenterTopBtnToggleHighLightForPlayer(player_name_list, pos_index, enabled_value)
    else
        LoggerModule.error('TopButtonModule.set_button_highlight', 'player_name_list type error:' .. type(player_name_list))
    end
end

--- 设置按钮的时间覆盖层可见性
--- @param pos_index number 位置索引, 1-6
--- @param visible boolean 是否可见
--- @param player_name_list PlayerEnum|PlayerEnum[]|nil 玩家名字列表, nil则针对所有玩家
TopButtonModule.set_button_time_overlay_visible = function(pos_index, visible, player_name_list)
    if type(pos_index) ~= 'number' then
        LoggerModule.error('TopButtonModule.set_button_time_overlay_visible', 'pos_index type error:' .. type(pos_index))
        return
    end
    if pos_index < 1 or pos_index > 6 then
        LoggerModule.error('TopButtonModule.set_button_time_overlay_visible', 'pos_index must be in [1, 6], pos_index=' .. pos_index)
        return
    end
    local visible_value = 0
    if visible then
        visible_value = 1
    end
    if type(player_name_list) == 'nil' then
        exCenterTopBtnSetTimerOverlayVisibility(pos_index, visible_value)
    elseif type(player_name_list) == 'table' then
        for i = 1, getn(player_name_list) do
            if type(player_name_list[i]) ~= 'string' then
                LoggerModule.warn('TopButtonModule.set_button_time_overlay_visible', 'player_name_list element type error:' .. type(player_name_list[i]))
            else
                exCenterTopBtnSetTimerOverlayVisibilityForPlayer(player_name_list[i], pos_index, visible_value)
            end
        end
    elseif type(player_name_list) == 'string' then
        exCenterTopBtnSetTimerOverlayVisibilityForPlayer(player_name_list, pos_index, visible_value)
    else
        LoggerModule.error('TopButtonModule.set_button_time_overlay_visible', 'player_name_list type error:' .. type(player_name_list))
    end
end

--- 设置按钮的时间覆盖层值
--- @param pos_index number 位置索引, 1-6
--- @param value number 时间覆盖层值, 0-99
--- @param player_name_list PlayerEnum|PlayerEnum[]|nil 玩家名字列表, nil则针对所有玩家
TopButtonModule.set_button_time_overlay_value = function(pos_index, value, player_name_list)
    if type(pos_index) ~= 'number' then
        LoggerModule.error('TopButtonModule.set_button_time_overlay_value', 'pos_index type error:' .. type(pos_index))
        return
    end
    if pos_index < 1 or pos_index > 6 then
        LoggerModule.error('TopButtonModule.set_button_time_overlay_value', 'pos_index must be in [1, 6], pos_index=' .. pos_index)
        return
    end
    if type(value) ~= 'number' then
        LoggerModule.error('TopButtonModule.set_button_time_overlay_value', 'value type error:' .. type(value))
        return
    end
    if value < 0 or value > 99 then
        LoggerModule.error('TopButtonModule.set_button_time_overlay_value', 'value must be in [0, 100], value=' .. value)
        return
    end


    if type(player_name_list) == 'nil' then
        exCenterTopBtnSetTimerOverlayValue(pos_index, value)
    elseif type(player_name_list) == 'table' then
        for i = 1, getn(player_name_list) do
            if type(player_name_list[i]) ~= 'string' then
                LoggerModule.warn('TopButtonModule.set_button_time_overlay_value', 'player_name_list element type error:' .. type(player_name_list[i]))
            else
                exCenterTopBtnSetTimerOverlayValueForPlayer(player_name_list[i], pos_index, value)
            end
        end
    elseif type(player_name_list) == 'string' then
        exCenterTopBtnSetTimerOverlayValueForPlayer(player_name_list, pos_index, value)
    else
        LoggerModule.error('TopButtonModule.set_button_time_overlay_value', 'player_name_list type error:' .. type(player_name_list))
    end
end

--- 设置按钮的血条可见性
--- @param pos_index number 位置索引, 1-6
--- @param visible boolean 是否可见
--- @param player_name_list PlayerEnum|PlayerEnum[]|nil 玩家名字列表, nil则针对所有玩家
TopButtonModule.set_button_hp_bar_visible = function(pos_index, visible, player_name_list)
    if type(pos_index) ~= 'number' then
        LoggerModule.error('TopButtonModule.set_button_hp_bar_visible', 'pos_index type error:' .. type(pos_index))
        return
    end
    if pos_index < 1 or pos_index > 6 then
        LoggerModule.error('TopButtonModule.set_button_hp_bar_visible', 'pos_index must be in [1, 6], pos_index=' .. pos_index)
        return
    end
    local visible_value = 0
    if visible then
        visible_value = 1
    end
    if type(player_name_list) == 'nil' then
        exCenterTopBtnSetHealthBarVisibility(pos_index, visible_value)
    elseif type(player_name_list) == 'table' then
        for i = 1, getn(player_name_list) do
            if type(player_name_list[i]) ~= 'string' then
                LoggerModule.warn('TopButtonModule.set_button_hp_bar_visible', 'player_name_list element type error:' .. type(player_name_list[i]))
            else
                exCenterTopBtnSetHealthBarVisibilityForPlayer(player_name_list[i], pos_index, visible_value)
            end
        end
    elseif type(player_name_list) == 'string' then
        exCenterTopBtnSetHealthBarVisibilityForPlayer(player_name_list, pos_index, visible_value)
    else
        LoggerModule.error('TopButtonModule.set_button_hp_bar_visible', 'player_name_list type error:' .. type(player_name_list))
    end
end

--- 设置按钮的血条值
--- @param pos_index number 位置索引, 1-6
--- @param value number 血条值, 1-100
--- @param player_name_list PlayerEnum|PlayerEnum[]|nil 玩家名字列表, nil则针对所有玩家
TopButtonModule.set_button_hp_var_value = function(pos_index, value, player_name_list)
    if type(pos_index) ~= 'number' then
        LoggerModule.error('TopButtonModule.set_button_hp_var_value', 'pos_index type error:' .. type(pos_index))
        return
    end
    if pos_index < 1 or pos_index > 6 then
        LoggerModule.error('TopButtonModule.set_button_hp_var_value', 'pos_index must be in [1, 6], pos_index=' .. pos_index)
        return
    end
    if type(value) ~= 'number' then
        LoggerModule.error('TopButtonModule.set_button_hp_var_value', 'value type error:' .. type(value))
        return
    end
    if value < 0 or value > 100 then
        LoggerModule.error('TopButtonModule.set_button_hp_var_value', 'value must be in [0, 100], value=' .. value)
        return
    end
    if type(player_name_list) == 'nil' then
        exCenterTopBtnSetHealthBarValue(pos_index, value)
    elseif type(player_name_list) == 'table' then
        for i = 1, getn(player_name_list) do
            if type(player_name_list[i]) ~= 'string' then
                LoggerModule.warn('TopButtonModule.set_button_hp_var_value', 'player_name_list element type error:' .. type(player_name_list[i]))
            else
                exCenterTopBtnSetHealthBarValueForPlayer(player_name_list[i], pos_index, value)
            end
        end
    elseif type(player_name_list) == 'string' then
        exCenterTopBtnSetHealthBarValueForPlayer(player_name_list, pos_index, value)
    else
        LoggerModule.error('TopButtonModule.set_button_hp_var_value', 'player_name_list type error:' .. type(player_name_list))
    end
    
end

--- 设置按钮是否被选中
--- @param pos_index number 位置索引, 1-6
--- @param selected boolean 是否选中
--- @param player_name_list PlayerEnum|PlayerEnum[]|nil 玩家名字列表, nil则针对所有玩家
TopButtonModule.set_button_selected = function(pos_index, selected, player_name_list)
    if type(pos_index) ~= 'number' then
        LoggerModule.error('TopButtonModule.set_button_selected', 'pos_index type error:' .. type(pos_index))
        return
    end
    if pos_index < 1 or pos_index > 6 then
        LoggerModule.error('TopButtonModule.set_button_selected', 'pos_index must be in [1, 6], pos_index=' .. pos_index)
        return
    end
    local selected_value = 0
    if selected then
        selected_value = 1
    end
    if type(player_name_list) == 'nil' then
        exCenterTopBtnSetSelected(pos_index, selected_value)
    elseif type(player_name_list) == 'table' then
        for i = 1, getn(player_name_list) do
            if type(player_name_list[i]) ~= 'string' then
                LoggerModule.warn('TopButtonModule.set_button_selected', 'player_name_list element type error:' .. type(player_name_list[i]))
            else
                exCenterTopBtnSetSelectedForPlayer(player_name_list[i], pos_index, selected_value)
            end
        end
    elseif type(player_name_list) == 'string' then
        exCenterTopBtnSetSelectedForPlayer(player_name_list, pos_index, selected_value)
    else
        LoggerModule.error('TopButtonModule.set_button_selected', 'player_name_list type error:' .. type(player_name_list))
    end
end

--- 设置按钮是否可用
--- @param pos_index number 位置索引, 1-6
--- @param enabled boolean 是否可用
--- @param player_name_list PlayerEnum|PlayerEnum[]|nil 玩家名字列表, nil则针对所有玩家
TopButtonModule.set_button_enabled = function(pos_index, enabled, player_name_list)
    if type(pos_index) ~= 'number' then
        LoggerModule.error('TopButtonModule.set_button_enabled', 'pos_index type error:' .. type(pos_index))
        return
    end
    if pos_index < 1 or pos_index > 6 then
        LoggerModule.error('TopButtonModule.set_button_enabled', 'pos_index must be in [1, 6], pos_index=' .. pos_index)
        return
    end
    local enabled_value = 0
    if enabled then
        enabled_value = 1
    end
    if type(player_name_list) == 'nil' then
        exCenterTopBtnSetEnable(pos_index, enabled_value)
    elseif type(player_name_list) == 'table' then
        for i = 1, getn(player_name_list) do
            if type(player_name_list[i]) ~= 'string' then
                LoggerModule.warn('TopButtonModule.set_button_enabled', 'player_name_list element type error:' .. type(player_name_list[i]))
            else
                exCenterTopBtnSetEnableForPlayer(player_name_list[i], pos_index, enabled_value)
            end
        end
    elseif type(player_name_list) == 'string' then
        exCenterTopBtnSetEnableForPlayer(player_name_list, pos_index, enabled_value)
    else
        LoggerModule.error('TopButtonModule.set_button_enabled', 'player_name_list type error:' .. type(player_name_list))
    end
end

--- 注册按键点击事件
--- @param func function 回调函数 参数列表: player_name, btn_index, shift_pressed
TopButtonModule.register_button_click_callback = function(func)
    if type(func) ~= 'function' then
        LoggerModule.error('TopButtonModule.register_button_click_callback', 'func type error:' .. type(func))
        return
    end
    _meta.tmp_onCenterTopBtnClickEvent = func
    globals().onCenterTopBtnClickEvent = function(player_name, btn_index, shift_pressed)
        local is_shift_pressed = nil
        if shift_pressed == 1 then
            is_shift_pressed = 1
        end
        _meta.tmp_onCenterTopBtnClickEvent(player_name, btn_index, is_shift_pressed)
    end
end

