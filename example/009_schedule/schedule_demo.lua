--- scheule_demo.lua
--- Created by dreamness
--- DateTime: 12/22/2024 11:15 AM

LoggerModule.setup(LoggerLevelEnum.DEBUG, {LoggerTargetEnum.PUBLIC_BOARD})
LoggerModule.info("SchedulerModule", "start load.")
-- 注: 15帧=1秒

--- 延迟调用一个函数
SchedulerModule.delay_call(function()
    LoggerModule.info("SchedulerModule.delay_call", "delay_call")
end, 15 * 2)

--- 定时调用一个函数
SchedulerModule.call_every_x_frame(function()
    LoggerModule.info("SchedulerModule.call_every_x_frame", "call_every_x_frame")
end, 15 * 2, 5)

LoggerModule.info("SchedulerModule", "loaded.")