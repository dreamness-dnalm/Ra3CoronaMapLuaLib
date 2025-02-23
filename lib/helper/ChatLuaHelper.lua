ChatLuaHelper = {}

ChatLuaHelper._mate = {
    cmd_cache = ''
}

--- 初始化, 在聊天框中输入lua代码, 以'\'结尾表示继续输入, 否则执行
--- 该api会和其他监听聊天消息的逻辑相冲突, 请谨慎使用
--- 该api仅用于调试, 请勿在正式环境中使用
ChatLuaHelper.setup = function()
    ChatMsgModule.register_chat_listener(
        function(player_name, msg)
            LoggerModule.info('ChatLuaHelper.chat_listener', 'received msg. player_name: ' .. tostring(player_name) .. ', msg: ' .. tostring(msg))
            msg = ChatLuaHelper._mate.cmd_cache .. msg
            local msg_len = strlen(msg)
            if msg_len > 0 then
                if msg_len > 1 and strsub(msg, msg_len, msg_len) == '\\' then
                    ChatLuaHelper._mate.cmd_cache = strsub(msg, 1, msg_len - 1)
                    return
                end
                ChatLuaHelper._mate.cmd_cache = ''
                LoggerModule.info('ChatLuaHelper.chat_listener', 'executing cmd: ' .. msg)
                ChatMsgModule.print_on_chat('cmd: ' .. msg)
                local ret = dostring(msg)
                LoggerModule.info('ChatLuaHelper.chat_listener', 'cmd executed. ret: ' .. tostring(ret))
                ChatMsgModule.print_on_chat(tostring(ret))
            end
        end
    )
end

