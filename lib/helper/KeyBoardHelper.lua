KeyboardHelper = {}

KeyboardHelper._meta = {
    command_code_index = 0,
    funcs = {},
    callback_func_register_flag = nil
}

-- TODO: 注册键盘热键
--- @param key_code_hex KeyboardKeyCodeEnum
--- @param assist_key_code_hex KeyboardKeyCodeEnum
--- @param callback_func function 监听器 func(player_name, mouse_x, mouse_y, mouse_z)
KeyboardHelper.register_hot_key = function(key_code_hex, assist_key_code_hex, callback_func)
    if type(key_code_hex) ~= "string" or strlen(key_code_hex) == 0 then
        LoggerModule.error("KeyboardHelper.register_hot_key", "key_code_hex must be a string and length > 0")
        return
    end
    if assist_key_code_hex == nil then
        assist_key_code_hex = '0'
    end
    if type(assist_key_code_hex) ~= "string" or strlen(assist_key_code_hex) == 0 then
        LoggerModule.error("KeyboardHelper.register_hot_key", "assistKeyCodeHex must be a string and length > 0")
        return
    end
    if callback_func ~= nil and type(callback_func) ~= "function" then
        LoggerModule.error("KeyboardHelper.register_hot_key", "callback_func must be a function")
        return
    end

    KeyboardHelper._meta.command_code_index = KeyboardHelper._meta.command_code_index + 1

    KeyboardModule.register_hot_key(key_code_hex, assist_key_code_hex, KeyboardHelper._meta.command_code_index)
    
    
    KeyboardHelper._meta.funcs[KeyboardHelper._meta.command_code_index] = callback_func

    if not KeyboardHelper._meta.callback_func_register_flag then
        KeyboardModule.register_hot_key_listener(function(player_name, command_code, mouse_x, mouse_y, mouse_z)
            local func = KeyboardHelper._meta.funcs[command_code]
            if func ~= nil then
                func(player_name, command_code, mouse_x, mouse_y, mouse_z)
            end
        end)
        KeyboardHelper._meta.callback_func_register_flag = 1
    end
end