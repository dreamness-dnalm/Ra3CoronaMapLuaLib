--- dialog_demo.lua
--- Created by dreamness
--- DateTime: 12/22/2024 00:21 PM

LoggerModule.setup(LoggerLevelEnum.DEBUG, {LoggerTargetEnum.PUBLIC_BOARD})
LoggerModule.info("DemoDialogModule", "start load.")
DemoDialogModule = {}

DemoDialogModule.dialog_metas = {
    [1] = {
        name = "dialog1",
        dialog_type = "choice", -- choice / long_text (未来支持)
        title = "dialog1",
        content = "dialog_content",
        -- 最多支持7个按钮
        buttons = {"btn1", "btn2", "btn3", "btn4", "btn5", "btn6"},
        callback = function(player_name, button_index)
            if button_index == 1 then
                LoggerModule.info("DemoDialogModule", player_name .. " clicked dialog1 btn1.")
            elseif button_index == 2 then
                LoggerModule.info("DemoDialogModule", player_name .. " clicked dialog1 btn2.")
            elseif button_index == 3 then
                LoggerModule.info("DemoDialogModule", player_name .. " clicked dialog1 btn3.")
            elseif button_index == 4 then
                LoggerModule.info("DemoDialogModule", player_name .. " clicked dialog1 btn4.")
            elseif button_index == 5 then
                LoggerModule.info("DemoDialogModule", player_name .. " clicked dialog1 btn5.")
            elseif button_index == 6 then
                LoggerModule.info("DemoDialogModule", player_name .. " clicked dialog1 btn6.")
            end
        end
    },
    [2] = {
        name = "dialog2",
        dialog_type = "choice", 
        title = "dialog2",
        content = "dialog_content",
        buttons = {"btn1", "btn2"},
        callback = function(player_name, button_index)
            if button_index == 1 then
                LoggerModule.info("DemoDialogModule", player_name .. " clicked dialog2 btn1.")
            elseif button_index == 2 then
                LoggerModule.info("DemoDialogModule", player_name .. " clicked dialog2 btn2.")
            end
        end
    }
}

DemoDialogModule.__dialog_enum = {}

for i = 1, getn(DemoDialogModule.dialog_metas) do
    DemoDialogModule.__dialog_enum[DemoDialogModule.dialog_metas[i].name] = i
end

function DemoDialogModule:show_dialog(dialog_name)
    local dialog_id = DemoDialogModule.__dialog_enum[dialog_name]
    local dialog_meta = DemoDialogModule.dialog_metas[dialog_id]
    if dialog_meta.dialog_type == "choice" then
        DialogModule.show_choice_dialog(dialog_id, dialog_meta.title, dialog_meta.buttons, nil)
    elseif dialog_meta.dialog_type == "long_text" then
        -- DialogModule.show_long_text_dialog(dialog_id, dialog_meta.content, dialog_meta.buttons, nil)
    end
end

DialogModule.register_dialog_click_listener(function(player_name, button_index, dialog_id)    
    DemoDialogModule.dialog_metas[dialog_id].callback(player_name, button_index)
end)

DemoDialogModule:show_dialog("dialog1")

-- 10秒后自动关闭弹框
SchedulerModule.delay_call(function() DialogModule.hide_choice_dialog(nil) end, 15 * 10)

LoggerModule.info("DemoDialogModule", "loaded.")