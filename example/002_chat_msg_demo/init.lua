--- init.lua
--- Created by dreamness
--- DateTime: 12/14/2024 08:41 PM

LoggerModule.setup(LoggerLevelEnum.DEBUG, {LoggerTargetEnum.DEBUG_LOG_FILE})

LoggerModule.info('ChatMsgModule', 'init.lua', 'Loading ChatMsgModule')

ChatMsgModule.register_chat_listener(function(player_name, content)
    ChatMsgModule.print_on_chat('player <' .. player_name .. '> said: ' .. content)
end)

LoggerModule.info('ChatMsgModule', 'init.lua', 'ChatMsgModule loaded')