--- SchedulerModule.lua
--- Created by dreamness
--- DateTime: 12/19/2024 00:05 AM

--- 调度模块
SchedulerModule = {}

--- @class SchedulerConfig
--- @field callback function 回调函数
--- @field aready_called_times number 已经调用的次数
--- @field repeat_times number 重复次数
--- @field interval_frame_num number 间隔帧数
--- @field passed_frames number 已经过去的帧数
--- @field is_active boolean 是否激活

--- @type SchedulerConfig[]
SchedulerModule._schedulers = {}

--- 每N帧调用一次某函数
--- @param callback function 回调函数
--- @param interval_frame_num number 间隔帧数, 大于0 (15帧=1秒)
--- @param repeat_num number| nil 重复次数, nil表示无限次, 0或小于0表示不调用
SchedulerModule.call_every_x_frame = function(callback, interval_frame_num, repeat_num)
    if type(callback) ~= "function" then
        LoggerModule.error("SchedulerModule.call_every_x_frame", "callback must be a function")
        return
    end
    if type(interval_frame_num) ~= "number" or interval_frame_num <= 0 then
        LoggerModule.error("SchedulerModule.call_every_x_frame", "interval_frame_num must be a number and greater than 0")
        return
    end
    if type(repeat_num) ~= "number" and repeat_num ~= nil then
        LoggerModule.error("SchedulerModule.call_every_x_frame", "repeat_num must be a number or nil")
        return
    end

    local scheduler = SchedulerModule._schedulers
    local id = getn(SchedulerModule._schedulers) + 1
    scheduler[id] = {
        callback = callback,
        aready_called_times = 0,
        repeat_times = repeat_num,
        interval_frame_num = interval_frame_num,
        passed_frames = 0,
        is_active = 1
    }
    return id
end

--- N帧后调用某函数
--- @param callback function 回调函数
--- @param delay number 延迟帧数 (15帧=1秒)
SchedulerModule.delay_call = function(callback, delay)
    return SchedulerModule.call_every_x_frame(callback, delay, 1)
end

--- 暂停调度器
--- @param id number 调度器id
SchedulerModule.pause_scheduler = function(id)
    local scheduler = SchedulerModule._schedulers
    if id > getn(scheduler) then
        LoggerModule.error("SchedulerModule.stop_scheduler", "id is out of range")
        return
    end
    scheduler[id].is_active = nil
end

--- 恢复调度器(不会重置已运行次数)
--- @param id number 调度器id
SchedulerModule.resume_scheduler = function(id)
    local scheduler = SchedulerModule._schedulers
    if id > getn(scheduler) then
        LoggerModule.error("SchedulerModule.resume_scheduler", "id is out of range")
        return
    end
    scheduler[id].is_active = 1
end

--- 重启调度器(会重置已运行次数)
SchedulerModule.restart_scheduler = function(id)
    local scheduler = SchedulerModule._schedulers
    if id > getn(scheduler) then
        LoggerModule.error("SchedulerModule.restart_scheduler", "id is out of range")
        return
    end
    scheduler[id].aready_called_times = 0
    scheduler[id].passed_frames = 0
    scheduler[id].is_active = 1
end

--- 获取调度器配置(危险, 请谨慎修改)
--- @param id number 调度器id
--- @return SchedulerConfig
SchedulerModule.get_config = function(id)
    local scheduler = SchedulerModule._schedulers
    if id > getn(scheduler) then
        LoggerModule.error("SchedulerModule.get_config", "id is out of range")
        return
    end
    return scheduler[id]
end

