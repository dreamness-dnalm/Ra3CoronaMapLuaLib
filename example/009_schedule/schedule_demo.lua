--- scheule_demo.lua
--- Created by dreamness
--- DateTime: 12/22/2024 11:15 AM

LoggerModule.setup(LoggerLevelEnum.DEBUG, {LoggerTargetEnum.PUBLIC_BOARD, LoggerTargetEnum.DEBUG_LOG_FILE})
LoggerModule.info("SchedulerModule", "start load.")
-- 注: 15帧=1秒

--- 延迟调用一个函数
SchedulerModule.delay_call(function()
    LoggerModule.info("delay_call", "delay_call")
end, 15 * 3)

-- 定时调用一个函数
SchedulerModule.call_every_x_frame(function()
    LoggerModule.info("call_every_x_frame", "call_every_x_frame")
end, 15 * 3, 5)

local arg_1 = "arg1"
local arg_2 = 2

--- 延迟调用一个函数
SchedulerModule.delay_call(function(a, b)
    LoggerModule.info("delay_call_with_arguments", "a: " .. tostring(a))
    LoggerModule.info("delay_call_with_arguments", "b: " .. tostring(b))
    -- LoggerModule.info("delay_call_with_arguments", "delay_call_with_arguments, a=" .. tostring(a) .. ", b=" .. tostring(b))
end, 15 * 2, {arg_1, arg_2})

--- 定时调用一个函数
SchedulerModule.call_every_x_frame(function(a, b)
LoggerModule.info("call_every_x_frame_with_arguments", "a: " .. tostring(a))
LoggerModule.info("call_every_x_frame_with_arguments", "b: " .. tostring(b))
end, 15 * 2, 5, {arg_1, arg_2})

LoggerModule.info("SchedulerModule", "loaded.")