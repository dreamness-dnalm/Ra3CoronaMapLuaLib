--- ChatMsgModule.lua
--- Created by dreamness
--- DateTime: 12/13/2024 10:25 PM

--- 控制多人游戏中左下角的消息框

ChatMsgModule = {}

--- 在聊天框输出文字
--- @param message string 文本内容
ChatMsgModule.print_on_chat = function(message)
    if type(message) ~= 'string' then
        LoggerModule.error('MsgModule.print', 'content is not a string, content=' .. tostring(message))
        return
    end
    exMessageAppendToMessageArea(message)
end

--- 注册聊天监听
--- @param func function 回调函数, 参数列表: player_name, content
ChatMsgModule.register_chat_listener = function(func)
    globals().onUserShortChatMsg = func
end