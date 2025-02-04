--- PublicBoardModule.lua
--- Created by dreamness
--- DateTime: 12/15/2024 00:08 AM

--- 公屏模块
PublicBoardModule = {}


--- 在公屏输出文字
--- @param text string 文本内容
--- @param duration number 持续时间, 单位秒, 最长30秒
--- @param player_name_list PlayerEnum|PlayerEnum[]|nil 玩家名字列表, nil则针对所有玩家
PublicBoardModule.show_text = function(text, duration, player_name_list)
    if type(text) ~= 'string' then
        LoggerModule.error('PublicBoardModule.show_text', 'text type error:' .. type(text))
        return
    end
    if type(duration) ~= 'number' then
        LoggerModule.error('PublicBoardModule.show_text', 'duration type error:' .. type(duration))
        return
    end
    if duration < 0 or duration > 30 then
        LoggerModule.error('PublicBoardModule.show_text', 'duration must be in [0, 30], duration=' .. duration)
        return
    end

    if player_name_list == nil then
        exAddTextToPublicBoard(text, duration)
    elseif type(player_name_list) == 'table' then
        for i = 1, getn(player_name_list) do
            if type(player_name_list[i]) ~= 'string' then
                LoggerModule.warn('PublicBoardModule.show_text', 'player_name_list element type error:' .. type(player_name_list[i]))
            else
                exAddTextToPublicBoardForPlayer(player_name_list[i], text, duration)
            end
        end
    elseif type(player_name_list) == 'string' then
        exAddTextToPublicBoardForPlayer(player_name_list, text, duration)
    else
        LoggerModule.error('PublicBoardModule.show_text', 'player_name_list type error:' .. type(player_name_list))
    end

end

--- 设置公屏文字的颜色(是整个公屏文字的颜色)
--- @param color Color
PublicBoardModule.set_color = function(color)
    if type(color) ~= 'table' then
        LoggerModule.error('PublicBoardModule.set_color', 'color type error:' .. type(color))
        return
    end
    exSetPublicBoardColor(color.dec_value)
end
