--- DialogModule.lua
--- Created by dreamness
--- DateTime: 10/13/2024 7:08 PM
---

--- 对话框模块
DialogModule = {}

DialogModule._meta = {
    auto_index = 1
}

DialogModule.get_auto_dialog_id = function()
    DialogModule._meta.auto_index = DialogModule._meta.auto_index + 1
    return DialogModule._meta.auto_index
end

--- 显示按钮选项弹框, 弹框全局只有一个，如果之前的弹框还未消失，则会覆盖之前的弹框数据和ui, 弹框按钮点击后，弹框自动消失
--- @param dialog_id number 弹框id
--- @param title string 弹框标题
--- @param button_contents string[] 按钮内容数组, 最多7个
--- @param player_name_list PlayerEnum|PlayerEnum[]|nil 玩家名字列表, nil则针对所有玩家
DialogModule.show_choice_dialog = function(dialog_id, title, button_contents, player_name_list)
    if type(player_name_list) ~= "table" and player_name_list ~= nil and type(player_name_list) ~= 'string' then
        LoggerModule.error('DialogModule.show_choice_dialog', 'player_name_list type error:' .. type(player_name_list))
        return
    end
    if type(dialog_id) ~= "number" then
        LoggerModule.error('DialogModule.show_choice_dialog', 'dialog_id type error:' .. type(dialog_id))
        return
    end
    if type(title) ~= "string" then
        LoggerModule.error('DialogModule.show_choice_dialog', 'title type error:' .. type(title))
        return
    end
    if type(button_contents) ~= "table" then
        LoggerModule.error('DialogModule.show_choice_dialog', 'button_contents type error:' .. type(button_contents))
        return
    end
    
    local btn1 = TableUtil.get_or_default(button_contents, 1, "")
    local btn2 = TableUtil.get_or_default(button_contents, 2, "")
    local btn3 = TableUtil.get_or_default(button_contents, 3, "")
    local btn4 = TableUtil.get_or_default(button_contents, 4, "")
    local btn5 = TableUtil.get_or_default(button_contents, 5, "")
    local btn6 = TableUtil.get_or_default(button_contents, 6, "")
    local btn7 = TableUtil.get_or_default(button_contents, 7, "")

    if player_name_list == nil then
        exShowCustomBtnChoiceDialog(dialog_id, title, btn1, btn2, btn3, btn4, btn5, btn6, btn7)
    elseif type(player_name_list) == 'table' then
        for i = 1, getn(player_name_list) do
            if type(player_name_list[i]) ~= "string" then
                LoggerModule.warn('DialogModule.show_choice_dialog', 'player_name_list element type error:' .. type(player_name_list[i]))
            else
                exShowCustomBtnChoiceDialogForPlayer(player_name_list[i], dialog_id, title, btn1, btn2, btn3, btn4, btn5, btn6, btn7)
            end
        end
    else
        exShowCustomBtnChoiceDialogForPlayer(player_name_list, dialog_id, title, btn1, btn2, btn3, btn4, btn5, btn6, btn7)
    end
end

--- 隐藏按钮选项弹框
--- @param player_name_list PlayerEnum|PlayerEnum[]|nil 玩家名字, nil则针对所有玩家
DialogModule.hide_choice_dialog = function(player_name_list)
    if player_name_list == nil then
        exHideCustomBtnChoiceDialog()
    elseif type(player_name_list) == "table" then
        for i = 1, getn(player_name_list) do
            if type(player_name_list[i]) ~= "string" then
                LoggerModule.warn('DialogModule.hide_dialog', 'player_name_list element type error:' .. type(player_name_list[i]))
            else
                exHideCustomBtnChoiceDialogForPlayer(player_name_list[i])
            end
        end
    elseif type(player_name_list) == 'string' then
        exHideCustomBtnChoiceDialogForPlayer(player_name_list)
    else
        LoggerModule.error('DialogModule.hide_dialog', 'player_name type error:' .. type(player_name_list))
    end
end

--- 显示长文本弹框, 弹框全局只有一个，如果之前的弹框还未消失，则会覆盖之前的弹框数据和ui, 弹框按钮点击后，弹框自动消失
--- @param dialog_id number 弹框id
--- @param content string 弹框内容
--- @param string[] button_contents 按钮内容数组, 最多3个
--- @param player_name_list PlayerEnum|PlayerEnum[]|nil 玩家名字, nil则针对所有玩家
DialogModule.show_long_text_dialog = function(dialog_id,  content, button_contents, player_name_list)
    if type(player_name_list) ~= "string" and player_name_list ~= nil and type(player_name_list) ~= 'table' then
        LoggerModule.error('DialogModule.show_long_text_dialog', 'player_name type error:' .. type(player_name_list))
        return
    end
    if type(dialog_id) ~= "number" then
        LoggerModule.error('DialogModule.show_long_text_dialog', 'dialog_id type error:' .. type(dialog_id))
        return
    end
    if type(content) ~= "string" then
        LoggerModule.error('DialogModule.show_long_text_dialog', 'content type error:' .. type(content))
        return
    end
    if type(button_contents) ~= "table" then
        LoggerModule.error('DialogModule.show_long_text_dialog', 'button_contents type error:' .. type(button_contents))
        return
    end

    local btn1 = TableUtil.get_or_default(button_contents, 1, "")
    local btn2 = TableUtil.get_or_default(button_contents, 2, "")
    local btn3 = TableUtil.get_or_default(button_contents, 3, "")

    if player_name_list == nil then
        exShowLongTextDialog(dialog_id, content, btn1, btn2, btn3)
    elseif type(player_name_list) == 'table' then
        for i = 1, getn(player_name_list) do
            if type(player_name_list[i]) ~= "string" then
                LoggerModule.warn('DialogModule.show_long_text_dialog', 'player_name_list element type error:' .. type(player_name_list[i]))
            else
                exShowLongTextDialogForPlayer(player_name_list[i], dialog_id, content, btn1, btn2, btn3)
            end
        end
    elseif type(player_name_list) == 'string' then
        exShowLongTextDialogForPlayer(player_name_list, dialog_id, content, btn1, btn2, btn3)
    end
end

--- 隐藏长文本弹框
--- @param player_name_list PlayerEnum|PlayerEnum[]|nil 玩家名字, nil则针对所有玩家
DialogModule.hide_long_text_dialog = function(player_name_list)
    if player_name_list == nil then
        exHideLongTextDialog()
    elseif type(player_name_list) == "table" then
        for i = 1, getn(player_name_list) do
            if type(player_name_list[i]) ~= "string" then
                LoggerModule.warn('DialogModule.hide_long_text_dialog', 'player_name_list element type error:' .. type(player_name_list[i]))
            else
                exHideLongTextDialogForPlayer(player_name_list[i])
            end
        end
    elseif type(player_name_list) == "string" then
        exHideLongTextDialogForPlayer(player_name_list)
    else
        LoggerModule.error('DialogModule.hide_long_text_dialog', 'player_name type error:' .. type(player_name_list))
    end
end

--- 注册按钮选项弹框点击事件
--- @param func function|nil 回调函数, 参数列表: player_name, btn_index, dialog_id
DialogModule.register_dialog_click_listener = function(func)
    if type(func) ~= "function" and func ~= nil then
        LoggerModule.error('DialogModule.register_dialog_click_listener', 'func type error:' .. type(func))
        return
    end
    globals().onUserBtnChoiceDialogEvent = func
    globals().onUserLongTextDialogEvent = func
end

