--- SchedulerModuleRunner.lua
--- Created by dreamness
--- DateTime: 12/19/2024 00:08 AM

--- 调度模块运行器, 应该在每一帧自动调用

LoggerModule.trace("SchedulerModuleRunner", "SchedulerModuleRunner start")

for i = 1, getn(SchedulerModule._schedulers) do
    local scheduler = SchedulerModule._schedulers[i]
    if scheduler.repeat_times and scheduler.aready_called_times >= scheduler.repeat_times then
        scheduler.is_active = nil
    end

    if scheduler.is_active then
        scheduler.passed_frames = scheduler.passed_frames + 1
        if scheduler.passed_frames >= scheduler.interval_frame_num then
            scheduler.passed_frames = 0
            scheduler.aready_called_times = scheduler.aready_called_times + 1
            scheduler.callback()
            LoggerModule.trace("SchedulerModuleRunner", "scheduler id: " .. i .. " called successfully")
            if scheduler.repeat_times and scheduler.aready_called_times >= scheduler.repeat_times then
                scheduler.is_active = nil
            end
        end
    end
end

LoggerModule.trace("SchedulerModuleRunner", "SchedulerModuleRunner finished")