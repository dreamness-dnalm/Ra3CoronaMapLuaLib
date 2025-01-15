ScoreBoardModule = {}

-- TODO: test
--- 设置记分板是否可见
--- @param visible boolean 是否可见
--- @param player_name_list PlayerEnum|PlayerEnum[]|nil 玩家名字列表, nil则针对所有玩家
ScoreBoardModule.set_visible = function(visible, player_name_list)
    if player_name_list ~= nil and type(player_name_list) ~= "table" and type(player_name_list) ~= "string" then
        LoggerModule.error("ScoreBoardModule.set_visible", "player_name_list must be a table/string/nil")
        return
    end
    local v = 0
    if visible then
        v = 1
    end
    if player_name_list == nil then
        ScoreBoardSetVisibility(v)
    elseif type(player_name_list) == 'string' then
        ScoreBoardSetVisibilityForPlayer(player_name_list, v)
    elseif type(player_name_list) == 'table' then
        for i = 1, getn(player_name_list) do
            if type(player_name_list[i]) ~= 'string' then
                LoggerModule.warn('ScoreBoardModule.set_visible', 'player_name_list element type error:' .. type(player_name_list[i]))
            else
                ScoreBoardSetVisibilityForPlayer(player_name_list[i], v)
            end
        end
    end
end

-- TODO: test
--- 设置记分板标题文字
--- @param text string 文本内容
--- @param player_name_list PlayerEnum|PlayerEnum[]|nil 玩家名字列表, nil则针对所有玩家
ScoreBoardModule.set_title = function(text, player_name_list)
    if type(text) ~= 'string' then
        LoggerModule.error('ScoreBoardModule.set_title', 'text type error:' .. type(text))
        return
    end
    if player_name_list == nil then
        ScoreBoardSetTitle(text)
    elseif type(player_name_list) == 'string' then
        ScoreBoardSetTitleForPlayer(player_name_list, text)
    elseif type(player_name_list) == 'table' then
        for i = 1, getn(player_name_list) do
            if type(player_name_list[i]) ~= 'string' then
                LoggerModule.warn('ScoreBoardModule.set_title', 'player_name_list element type error:' .. type(player_name_list[i]))
            else
                ScoreBoardSetTitleForPlayer(player_name_list[i], text)
            end
        end
    end
end

-- TODO: test
--- 设置记分板某行某列的文字
--- @param text string 文本内容
--- @param row number 行 1-7
--- @param col number 列 1-3
--- @param player_name_list PlayerEnum|PlayerEnum[]|nil 玩家名字列表, nil则针对所有玩家
ScoreBoardModule.set_cell = function (text, row, col, player_name_list)
    if type(text) ~= 'string' then
        LoggerModule.error('ScoreBoardModule.set_cell', 'text type error:' .. type(text))
        return
    end
    if type(row) ~= 'number' then
        LoggerModule.error('ScoreBoardModule.set_cell', 'row type error:' .. type(row))
        return
    end
    if type(col) ~= 'number' then
        LoggerModule.error('ScoreBoardModule.set_cell', 'col type error:' .. type(col))
        return
    end
    if player_name_list == nil then
        ScoreBoardSetText(text, row, col)
    elseif type(player_name_list) == 'string' then
        ScoreBoardSetTextForPlayer(player_name_list, text, row, col)
    elseif type(player_name_list) == 'table' then
        for i = 1, getn(player_name_list) do
            if type(player_name_list[i]) ~= 'string' then
                LoggerModule.warn('ScoreBoardModule.set_cell', 'player_name_list element type error:' .. type(player_name_list[i]))
            else
                ScoreBoardSetTextForPlayer(player_name_list[i], text, row, col)
            end
        end
    end    
end

