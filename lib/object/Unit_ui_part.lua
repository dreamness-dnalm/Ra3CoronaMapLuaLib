-- --------- highlight ----------

--- 单位白色闪烁
--- @param seconds number 闪烁时间
function Unit:highlight_white_flash(seconds)
    if type(seconds) ~= "number" then
        LoggerModule.error("Unit:highlight_white_flash", "seconds must be a number")
    end
    UnitHighlightModule.unit_white_flash(self.unit_table, seconds)
end

--- 单位闪烁
--- @param seconds number 闪烁时间
function Unit:highlight_flash(seconds)
    if type(seconds) ~= "number" then
        LoggerModule.error("Unit:highlight_flash", "seconds must be a number")
    end
    UnitHighlightModule.unit_flash(self.unit_table, seconds)
end

--- 为单位标注轮廓
--- @param outline_type UnitOutlineTypeEnum 轮廓类型
function Unit:highlight_outline(outline_type)
    if type(outline_type) ~= "string" then
        LoggerModule.error("Unit:highlight_outline", "outline_type must be a string")
    end
    UnitHighlightModule.unit_outline(self.unit_table, outline_type)
end

-- --------- 头顶文字 -----------

--- 在单位上方添加或更新文字
--- @param content string 文字内容
--- @param z_offset number z轴偏移量
--- @param color Color 颜色
--- @param player_name_list string|string[]|nil 玩家名字列表
function Unit:set_top_text(content, z_offset, color, player_name_list)
    UnitTopTextModule.set_or_update(self.id, content, z_offset, color.dec_value, player_name_list)
end

--- 删除单位顶部文字
function Unit:remove_top_text()
    -- TODO: 官方等待修复
    -- UnitTopTextModule.remove(self.id)
    Unit:set_top_text("", 0, ColorEnum.White, nil)
end

--- 显示消息框
--- @param msg string 消息内容
--- @param seconds number 持续时间(秒)
--- @param img ButtonTextureEnum|nil 图片名称
function Unit:show_msg_box(msg, seconds, img)
    if type(msg) ~= "string" then
        LoggerModule.error("Unit:show_msg_box", "msg must be a string")
        return
    end
    if type(seconds) ~= "number" then
        LoggerModule.error("Unit:show_msg_box", "seconds must be a number")
        return
    end
    if type(img) ~= "nil" and type(img) ~= "string" then
        LoggerModule.error("Unit:show_msg_box", "img must be a string or nil")
        return
    end
    MsgBoxModule.show_msg_box_on_unit(self.unit_table, msg, seconds, img)
end

--- 移除消息框
function Unit:remove_msg_box()
    MsgBoxModule.remove_msg_box_on_unit(self.unit_table)
end

--- 显示浮动整数数字
--- @param value number
function Unit:show_float_int_number(value)
    UnitTopTextModule.show_float_int_number(self.id, value)
end

-- --------- 顶部按钮 -----------

--- 添加顶部按钮
--- @param offset number z轴偏移量
--- @param player_list string|string[]|nil 玩家名字列表, nil表示所有玩家
function Unit:add_top_button(offset, player_list)
    UnitTopButtonModule.add_button(self.id, offset, player_list)
end

--- 删除顶部按钮
--- @param player_list string|string[]|nil 玩家名字列表, nil表示所有玩家
function Unit:remove_top_button(player_list)
    UnitTopButtonModule.remove_button(self.id, player_list)
end

--- 设置顶部按钮是否可见
--- @param visible boolean 是否可见
--- @param player_list string|string[]|nil 玩家名字列表, nil表示所有玩家
function Unit:set_top_button_visible(visible, player_list)
    UnitTopButtonModule.set_button_visible(self.id, visible, player_list)
end

