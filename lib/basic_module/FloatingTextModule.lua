FloatingTextModule = {}

-- TODO: test, package
-- 在指定地点显示任意内容的漂浮文字
--- @param text string 文字内容
--- @param x number 位置x
--- @param y number 位置y
--- @param z number 位置z
--- @param color Color 颜色
--- @param player_name_list table|nil 玩家名字列表, 为nil则所有人可见
FloatingTextModule.show_text_at_pos = function(text, x, y, z, color, player_name_list)
    if type(text) ~= "string" then
        LoggerModule.error("FloatingTextModule.show_text_at_pos", "text is not a string")
        return
    end
    if type(x) ~= "number" then
        LoggerModule.error("FloatingTextModule.show_text_at_pos", "x is not a number")
        return
    end
    if type(y) ~= "number" then
        LoggerModule.error("FloatingTextModule.show_text_at_pos", "y is not a number")
        return
    end
    if type(z) ~= "number" then
        LoggerModule.error("FloatingTextModule.show_text_at_pos", "z is not a number")
        return
    end
    if type(color) ~= "table" then
        LoggerModule.error("FloatingTextModule.show_text_at_pos", "color is not a table")
        return
    end

    local color_dec = color.dec_value


    if player_name_list then
        local player_cnt = getn(player_name_list)
        for i = 1, player_cnt do
            local player_name = player_name_list[i]
            exShowTextAtPosForPlayer(player_name, text, x, y, z, color_dec)
        end
    else
        exShowTextAtPos(text, x, y, z, color_dec)
    end
end


