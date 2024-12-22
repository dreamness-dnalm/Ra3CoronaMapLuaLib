--- MsgBoxModule.lua
--- Created by dreamness
--- DateTime: 12/18/2024 11:30 PM
---使用BUFF时，最好手动添加相应时间，如600帧，30帧



MsgBoxModule = {}

-- TODO: test
--- 在单位上显示信息框 (538)
--- @param unit_name_or_table string|table 单位名字 | 单位table
--- @param msg string 信息
--- @param seconds number 持续时长(s)
--- @param img string|nil 图片
MsgBoxModule.show_msg_box_on_unit = function(unit_name_or_table, msg, seconds, img)
    if type(unit_name_or_table) ~= "string" and type(unit_name_or_table) ~= "table" then
        LoggerModule.error("MsgBoxModule.show_msg_box_on_unit", "unit_name_or_table must be a string or table")
    end
    if type(msg) ~= "string" then
        LoggerModule.error("MsgBoxModule.show_msg_box_on_unit", "msg must be a string")
    end
    if type(seconds) ~= "number" then
        LoggerModule.error("MsgBoxModule.show_msg_box_on_unit", "seconds must be a number")
    end
    if type(img) ~= "nil" and type(img) ~= "string" then
        LoggerModule.error("MsgBoxModule.show_msg_box_on_unit", "img must be a string or nil")
    end

    if img == nil then
        ExecuteAction("NAMED_SHOW_INFOBOX", unit_name_or_table, msg, seconds)
    else
        ExecuteAction("NAMED_SHOW_INFOBOX", unit_name_or_table, msg, seconds, img)
    end
end

-- TODO: test
--- 移除单位上的信息框 (539)
--- @param unit_name_or_table string|table 单位名字 | 单位table
MsgBoxModule.remove_msg_box_on_unit = function(unit_name_or_table)
    if type(unit_name_or_table) ~= "string" and type(unit_name_or_table) ~= "table" then
        LoggerModule.error("MsgBoxModule.remove_msg_box_on_unit", "unit_name_or_table must be a string or table")
    end
    ExecuteAction("NAMED_REMOVE_INFOBOX", unit_name_or_table)
end

-- TODO: test
--- 显示文字标题 (116)
--- @param msg string 信息
--- @param seconds number 持续时长(s)
--- @param player_name PlayerEnum|nil 玩家名字
MsgBoxModule.show_msg_caption = function(msg, seconds, player_name)
    if type(msg) ~= "string" then
        LoggerModule.error("infoBoxFuncs.showMsgCaption", "msg must be a string")
        return
    end
    if type(seconds) ~= "number" then
        LoggerModule.error("infoBoxFuncs.showMsgCaption", "seconds must be a number")
        return
    end
    if type(player_name) ~= "nil" and type(player_name) ~= "string" then
        LoggerModule.error("infoBoxFuncs.showMsgCaption", "player_name must be a string or nil")
        return
    end

    if player_name == nil then
        ExecuteAction("SHOW_MILITARY_CAPTION", msg, seconds)
    else
        exInfoBoxTopCenterShowForPlayer(player_name, msg, seconds)
    end
end