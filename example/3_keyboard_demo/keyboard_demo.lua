--- keyboard_demo.lua
--- Created by dreamness
--- DateTime: 12/14/2024 11:42 PM

LoggerModule.setup(LoggerLevelEnum.DEBUG, {LoggerTargetEnum.DEBUG_LOG_FILE, LoggerTargetEnum.PUBLIC_BOARD})

DemoKeyboard = {}

--- 键盘按键配置
--- command_code 整数, 不可以重复
--- key_code 键盘按键
--- assist_key_code 辅助键, 0或nil表示没有辅助键, 只支持SHIFT,TAB,CONTROL,LEFT_MOUSE_BUTTON,RIGHT_MOUSE_BUTTON,MIDDLE_MOUSE_BUTTON   
DemoKeyboard.hotkey_config = {
    fire = {
        key_code = KeyboardKeyCodeEnum.SPACEBAR,
        assist_key_code = '0',
        command_code = 1
    },
    move_forward = {
        key_code = KeyboardKeyCodeEnum.K_W,
        assist_key_code = '0',
        command_code = 2
    },
    move_backward = {
        key_code = KeyboardKeyCodeEnum.K_S,
        assist_key_code = '0',
        command_code = 3
    },
    move_left = {
        key_code = KeyboardKeyCodeEnum.K_A,
        assist_key_code = '0',
        command_code = 4
    },
    move_right = {
        key_code = KeyboardKeyCodeEnum.K_D,
        assist_key_code = '0',
        command_code = 5
    }
}

--- 注册热键
for key, config in DemoKeyboard.hotkey_config do
    KeyboardModule.register_hot_key(config.key_code, config.assist_key_code, config.command_code)
end

--- 注册热键监听器
KeyboardModule.register_hot_key_listener(function(player_name, command_code, mouse_x, mouse_y, mouse_z)
    if command_code == DemoKeyboard.hotkey_config.fire.command_code then
        PublicBoardModule.show_text('player <' .. player_name .. '> pressed fire', 10, nil)
    elseif command_code == DemoKeyboard.hotkey_config.move_forward.command_code then
        PublicBoardModule.show_text('player <' .. player_name .. '> pressed move forward', 10, nil)
    elseif command_code == DemoKeyboard.hotkey_config.move_backward.command_code then
        PublicBoardModule.show_text('player <' .. player_name .. '> pressed move backward', 10, nil)
    elseif command_code == DemoKeyboard.hotkey_config.move_left.command_code then
        PublicBoardModule.show_text('player <' .. player_name .. '> pressed move left', 10, nil)
    elseif command_code == DemoKeyboard.hotkey_config.move_right.command_code then
        PublicBoardModule.show_text('player <' .. player_name .. '> pressed move right', 10, nil)
    end
end)