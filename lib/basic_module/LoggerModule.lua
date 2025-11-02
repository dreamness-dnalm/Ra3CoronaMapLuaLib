--- LoggerModule.lua
--- Created by dreamness
--- DateTime: 8/10/2024 3:53 PM
---
---
--- 日志模块
LoggerModule = {}

--- @class LoggerLevelEnum 日志等级枚举
LoggerLevelEnum = {
    TRACE = 1,
    DEBUG = 2,
    INFO = 3,
    WARN = 4,
    ERROR = 5
}

--- @type LoggerLevelEnum 日志等级
LoggerModule.LoggerLevel = LoggerLevelEnum.INFO

--- @class LoggerTargetEnum 日志输出目标枚举
LoggerTargetEnum = {
    --- 输出到debug工具的日志文件(地编路径\NewWorldBuilder\game\logs)
    --- 推荐, 普通玩家不会收到任何日志
    DEBUG_LOG_FILE = 1,
    --- 输出到dll的日志文件(日冕客户端路径\CoronaData\Logs)
    DLL_LOG_FILE = 2,
    --- 输出到公屏
    PUBLIC_BOARD = 3,
    --- 输出到聊天框
    CHAT_MSG = 4
}

--- @type LoggerTargetEnum[] 默认日志输出目标
LoggerModule.DefaultTargets = {LoggerTargetEnum.DEBUG_LOG_FILE}

--- 初始化日志模块
--- @param level LoggerLevelEnum
--- @param targets LoggerTargetEnum[]
LoggerModule.setup = function(level, targets)
    LoggerModule.LoggerLevel = level
    LoggerModule.DefaultTargets = targets
end

--- Log a message with level
--- @param level string
--- @param pos string
--- @param msg string
--- @param target LoggerTargetEnum[]
LoggerModule._log = function(level, pos, msg, targets)
    if LoggerLevelEnum[level] < LoggerModule.LoggerLevel then
        return
    end
    local log_content = "<" .. level .. ">" .. "<pos:" .. pos .. ">" .. tostring(msg)
    for i = 1, getn(targets) do
        LoggerModule.log(log_content, targets[i])
    end
end

--- Log a message to target
--- @param log_content string
--- @param target LoggerTargetEnum
LoggerModule.log = function(log_content, target)
    if target == LoggerTargetEnum.DEBUG_LOG_FILE then
        ExecuteAction("DEBUG_STRING", log_content)
    elseif target == LoggerTargetEnum.DLL_LOG_FILE then
        exPrintln(tostring(GetFrame()) .. ' ' .. log_content)
    elseif target == LoggerTargetEnum.PUBLIC_BOARD then
        PublicBoardModule.show_text(log_content, 30, nil)
    elseif target == LoggerTargetEnum.CHAT_MSG then
        ChatMsgModule.print_on_chat(tostring(GetFrame()) .. ' ' .. log_content)
    end
end

--- Log a message with level TRACE
--- @param pos string
--- @param msg string
LoggerModule.trace = function(pos, msg)
    LoggerModule._log("TRACE", pos, msg, LoggerModule.DefaultTargets)
end

--- Log a message with level DEBUG
--- @param pos string
--- @param msg string
LoggerModule.debug = function(pos, msg)
    LoggerModule._log("DEBUG", pos, msg, LoggerModule.DefaultTargets)
end

--- Log a message with level INFO
--- @param pos string
--- @param msg string
LoggerModule.info = function(pos, msg)
    LoggerModule._log("INFO", pos, msg, LoggerModule.DefaultTargets)
end

--- Log a message with level WARN
--- @param pos string
--- @param msg string
LoggerModule.warn = function(pos, msg)
    LoggerModule._log("WARN", pos, msg, LoggerModule.DefaultTargets)
end

--- Log a message with level ERROR
--- @param pos string
--- @param msg string
LoggerModule.error = function(pos, msg)
    LoggerModule._log("ERROR", pos, msg, LoggerModule.DefaultTargets)
end

logger = LoggerModule

globals()._ALERT = function(s)
    logger.error("LUA ERROR", "Lua Alert: " .. (s or "debug string"))
end