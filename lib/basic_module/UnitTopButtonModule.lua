UnitTopButtonModule = {}


-- TODO: test, package
--- 添加单位顶部按钮
--- @param unit_id number 单位id
--- @param offset number z轴偏移量
--- @param player_list string|string[]|nil 玩家名字列表, nil表示所有玩家
UnitTopButtonModule.add_button = function(unit_id, offset, player_list)
    if type(unit_id) ~= 'number' then
        LoggerModule.error('UnitTopButtonModule.add_button', 'unit_id is not a number, unit_id=' .. tostring(unit_id))
        return
    end

    if type(offset) ~= 'number' then
        LoggerModule.error('UnitTopButtonModule.add_button', 'offset is not a number, offset=' .. tostring(offset))
        return
    end

    if player_list == nil then
        exObjectShowBtnAtTop(unit_id, offset)
    elseif type(player_list) == 'table' then
        for i = 1, getn(player_list) do
            if type(player_list[i]) ~= 'string' then
                LoggerModule.warn('UnitTopButtonModule.add_button', 'player_list element type error:' .. type(player_list[i]))
            else
                exObjectShowBtnAtTopForPlayer(player_list[i], unit_id, offset)
            end
        end
    elseif type(player_list) == 'string' then
        exObjectShowBtnAtTopForPlayer(player_list, unit_id, offset)
    end
end

-- TODO: test, package
--- 删除单位顶部按钮
--- @param unit_id number 单位id
--- @param player_list string|string[]|nil 玩家名字列表, nil表示所有玩家
UnitTopButtonModule.remove_button = function(unit_id, player_list)
    if type(unit_id) ~= 'number' then
        LoggerModule.error('UnitTopButtonModule.remove_button', 'unit_id is not a number, unit_id=' .. tostring(unit_id))
        return
    end

    if player_list == nil then
        exObjectDeleteBtnAtTop(unit_id)
    elseif type(player_list) == 'table' then
        for i = 1, getn(player_list) do
            if type(player_list[i]) ~= 'string' then
                LoggerModule.warn('UnitTopButtonModule.remove_button', 'player_list element type error:' .. type(player_list[i]))
            else
                exObjectDeleteBtnAtTopForPlayer(player_list[i], unit_id)
            end
        end
    elseif type(player_list) == 'string' then
        exObjectDeleteBtnAtTopForPlayer(player_list, unit_id)
    end
end

-- TODO: test, package
--- 设置单位顶部按钮是否可见
--- @param unit_id number 单位id
--- @param visible boolean 是否可见, 1为可见, 0为不可见
--- @param player_list string|string[]|nil 玩家名字列表, nil表示所有玩家
UnitTopButtonModule.set_button_visible = function(unit_id, visible, player_list)
    if type(unit_id) ~= 'number' then
        LoggerModule.error('UnitTopButtonModule.set_button_visible', 'unit_id is not a number, unit_id=' .. tostring(unit_id))
        return
    end

    if type(visible) ~= 'boolean' then
        LoggerModule.error('UnitTopButtonModule.set_button_visible', 'visible is not a boolean, visible=' .. tostring(visible))
        return
    end
    local visible_value = 0
    if visible then
        visible_value = 1
    end

    if player_list == nil then
        exObjectChangeBtnAtTopVisibility(unit_id, visible_value)
    elseif type(player_list) == 'table' then
        for i = 1, getn(player_list) do
            if type(player_list[i]) ~= 'string' then
                LoggerModule.warn('UnitTopButtonModule.set_button_visible', 'player_list element type error:' .. type(player_list[i]))
            else
                exObjectChangeBtnAtTopVisibilityForPlayer(player_list[i], unit_id, visible_value)
            end
        end
    elseif type(player_list) == 'string' then
        exObjectChangeBtnAtTopVisibilityForPlayer(player_list, unit_id, visible_value)
    end
end
