--- KeyboardModule.lua
--- Created by dreamness
--- DateTime: 10/21/2024 12:27 AM
---

--- 键盘事件模块
KeyboardModule = {}

--- 注册热键
--- @param key_code_hex KeyboardKeyCodeEnum
--- @param assist_key_code_hex KeyboardKeyCodeEnum
--- @param command_code number
KeyboardModule.register_hot_key = function(key_code_hex, assist_key_code_hex, command_code)
    if type(key_code_hex) ~= "string" or strlen(key_code_hex) == 0 then
        LoggerModule.error("KeyboardModule.register_hot_key", "key_code_hex must be a string and length > 0")
        return
    end
    if assist_key_code_hex == nil then
        assist_key_code_hex = '0'
    end
    if type(assist_key_code_hex) ~= "string" or strlen(assist_key_code_hex) == 0 then
        LoggerModule.error("KeyboardModule.register_hot_key", "assistKeyCodeHex must be a string and length > 0")
        return
    end
    if type(command_code) ~= "number" then
        LoggerModule.error("KeyboardModule.register_hot_key", "command_code must be a number")
        return
    end

    exRegisterHotKey(MathUtil.hex_to_dec(key_code_hex), MathUtil.hex_to_dec(assist_key_code_hex), command_code)
end

--- 注册热键监听器
--- @param func function 监听器 func(player_name, command_code, mouse_x, mouse_y, mouse_z)
KeyboardModule.register_hot_key_listener = function(func)
    if func == nil then
        globals().onUserHotKeyEvent = nil
    elseif type(func) == 'function' then
        LoggerModule.__user_hot_key_event_listener = func
        globals().onUserHotKeyEvent = function(player_name, command_code, mouse_pos)
            LoggerModule.__user_hot_key_event_listener(player_name, command_code, mouse_pos.X, mouse_pos.Y, mouse_pos.Z)
        end
    else
        LoggerModule.error("KeyboardModule.register_hot_key_listener", "func must be a function")     
    end
end


--- 取消热键监听
--- @param command_code number
KeyboardModule.unregister_hot_key = function(command_code)
    if type(command_code) ~= "number" then
        LoggerModule.error("KeyboardModule.unregister_hot_key", "command_code must be a number")
        return
    end
    exUnregisterHotKey(command_code)
end

--- @class KeyboardKeyCodeEnum 键盘按键枚举
KeyboardKeyCodeEnum = {
    LEFT_MOUSE_BUTTON = '1',
    RIGHT_MOUSE_BUTTON = '2',
    CANCEL = '3',
    MIDDLE_MOUSE_BUTTON = '4',
    X1_MOUSE_BUTTON = '5',
    X2_MOUSE_BUTTON = '6',
    BACKSPACE = '8',
    TAB = '9',
    CLEAR = 'C',
    ENTER = 'D',
    SHIFT = '10',
    CONTROL = '11',
    ALT = '12',
    PAUSE = '13',
    CAPS_LOCK = '14',
    ESC = '1B',
    SPACEBAR = '20',
    PAGE_UP = '21',
    PAGE_DOWN = '22',
    END = '23',
    HOME = '24',
    LEFT_ARROW = '25',
    UP_ARROW = '26',
    RIGHT_ARROW = '27',
    DOWN_ARROW = '28',
    SELECT = '29',
    PRINT = '2A',
    EXECUTE = '2B',
    PRINT_SCREEN = '2C',
    INS = '2D',
    DEL = '2E',
    HELP = '2F',
    K_0 = '30',
    K_1 = '31',
    K_2 = '32',
    K_3 = '33',
    K_4 = '34',
    K_5 = '35',
    K_6 = '36',
    K_7 = '37',
    K_8 = '38',
    K_9 = '39',
    K_A = '41',
    K_B = '42',
    K_C = '43',
    K_D = '44',
    K_E = '45',
    K_F = '46',
    K_G = '47',
    K_H = '48',
    K_I = '49',
    K_J = '4A',
    K_K = '4B',
    K_L = '4C',
    K_M = '4D',
    K_N = '4E',
    K_O = '4F',
    K_P = '50',
    K_Q = '51',
    K_R = '52',
    K_S = '53',
    K_T = '54',
    K_U = '55',
    K_V = '56',
    K_W = '57',
    K_X = '58',
    K_Y = '59',
    K_Z = '5A',
    LWIN = '5B',
    RWIN = '5C',
    APPS = '5D',
    SLEEP = '5F',
    NUMPAD0 = '60',
    NUMPAD1 = '61',
    NUMPAD2 = '62',
    NUMPAD3 = '63',
    NUMPAD4 = '64',
    NUMPAD5 = '65',
    NUMPAD6 = '66',
    NUMPAD7 = '67',
    NUMPAD8 = '68',
    NUMPAD9 = '69',
    MULTIPLY = '6A',
    ADD = '6B',
    SEPARATOR = '6C',
    SUBTRACT = '6D',
    DECIMAL = '6E',
    DIVIDE = '6F',
    F1 = '70',
    F2 = '71',
    F3 = '72',
    F4 = '73',
    F5 = '74',
    F6 = '75',
    F7 = '76',
    F8 = '77',
    F9 = '78',
    F10 = '79',
    F11 = '7A',
    F12 = '7B',
    NUMLOCK = '90',
    SCROLL = '91',
    LSHIFT = 'A0',
    RSHIFT = 'A1',
    LCONTROL = 'A2',
    RCONTROL = 'A3',
    LALT = 'A4',
    RALT = 'A5',
    BROWSER_BACK = 'A6',
    BROWSER_FORWARD = 'A7',
    BROWSER_REFRESH = 'A8',
    BROWSER_STOP = 'A9',
    BROWSER_SEARCH = 'AA',
    BROWSER_FAVORITES = 'AB',
    BROWSER_HOME = 'AC',
    VOLUME_MUTE = 'AD',
    VOLUME_DOWN = 'AE',
    VOLUME_UP = 'AF',
    MEDIA_NEXT_TRACK = 'B0',
    MEDIA_PREV_TRACK = 'B1',
    MEDIA_STOP = 'B2',
    MEDIA_PLAY_PAUSE = 'B3',
    LAUNCH_MAIL = 'B4',
    LAUNCH_MEDIA_SELECT = 'B5',
    LAUNCH_APP1 = 'B6',
    LAUNCH_APP2 = 'B7',
}