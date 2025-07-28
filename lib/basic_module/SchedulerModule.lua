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
--- @field arguments table 回调函数参数, 数组
--- @field argument_length number 回调函数参数个数

--- @type SchedulerConfig[]
SchedulerModule._schedulers = {}

--- 每N帧调用一次某函数, 带参数
--- @param callback function 回调函数
--- @param interval_frame_num number 间隔帧数, 大于0 (15帧=1秒)
--- @param repeat_num number| nil 重复次数, nil表示无限次, 0或小于0表示不调用
--- @param arguments table|nil 回调函数参数, 数组. 元素个数需要和回调函数参数个数一致; nil等同于{}
SchedulerModule.call_every_x_frame = function(callback, interval_frame_num, repeat_num, arguments)
    if type(callback) ~= "function" then
        LoggerModule.error("SchedulerModule.call_every_x_frame_with_arguments", "callback must be a function")
        return
    end
    if type(interval_frame_num) ~= "number" or interval_frame_num <= 0 then
        LoggerModule.error("SchedulerModule.call_every_x_frame_with_arguments", "interval_frame_num must be a number and greater than 0")
        return
    end
    if type(repeat_num) ~= "number" and repeat_num ~= nil then
        LoggerModule.error("SchedulerModule.call_every_x_frame_with_arguments", "repeat_num must be a number or nil")
        return
    end
    if type(arguments) ~= "table" and arguments ~= nil then
        LoggerModule.error("SchedulerModule.call_every_x_frame_with_arguments", "arguments must be a table or nil")
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
        is_active = 1,
        arguments = arguments or {},
        argument_length = getn(arguments or {})
    }
    return id
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
        return nil
    end
    return scheduler[id]
end

--- 调度器内部函数, 请勿使用该函数
SchedulerModule.__scheduler_runner_function = function()
    if GetFrame() > 1 then
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
                    local callbacked = 1

                    if scheduler.argument_length == 0 then
                        scheduler.callback()
                    elseif scheduler.argument_length == 1 then
                        scheduler.callback(scheduler.arguments[1])
                    elseif scheduler.argument_length == 2 then
                        scheduler.callback(scheduler.arguments[1], scheduler.arguments[2])
                    elseif scheduler.argument_length == 3 then
                        scheduler.callback(scheduler.arguments[1], scheduler.arguments[2], scheduler.arguments[3])
                    elseif scheduler.argument_length == 4 then
                        scheduler.callback(scheduler.arguments[1], scheduler.arguments[2], scheduler.arguments[3], scheduler.arguments[4])
                    elseif scheduler.argument_length == 5 then
                        scheduler.callback(scheduler.arguments[1], scheduler.arguments[2], scheduler.arguments[3], scheduler.arguments[4], scheduler.arguments[5])
                    elseif scheduler.argument_length == 6 then
                        scheduler.callback(scheduler.arguments[1], scheduler.arguments[2], scheduler.arguments[3], scheduler.arguments[4], scheduler.arguments[5], scheduler.arguments[6])
                    elseif scheduler.argument_length == 7 then
                        scheduler.callback(scheduler.arguments[1], scheduler.arguments[2], scheduler.arguments[3], scheduler.arguments[4], scheduler.arguments[5], scheduler.arguments[6], scheduler.arguments[7])
                    elseif scheduler.argument_length == 8 then
                        scheduler.callback(scheduler.arguments[1], scheduler.arguments[2], scheduler.arguments[3], scheduler.arguments[4], scheduler.arguments[5], scheduler.arguments[6], scheduler.arguments[7], scheduler.arguments[8])
                    elseif scheduler.argument_length == 9 then
                        scheduler.callback(scheduler.arguments[1], scheduler.arguments[2], scheduler.arguments[3], scheduler.arguments[4], scheduler.arguments[5], scheduler.arguments[6], scheduler.arguments[7], scheduler.arguments[8], scheduler.arguments[9])
                    elseif scheduler.argument_length == 10 then
                        scheduler.callback(scheduler.arguments[1], scheduler.arguments[2], scheduler.arguments[3], scheduler.arguments[4], scheduler.arguments[5], scheduler.arguments[6], scheduler.arguments[7], scheduler.arguments[8], scheduler.arguments[9], scheduler.arguments[10])
                    elseif scheduler.argument_length == 11 then
                        scheduler.callback(scheduler.arguments[1], scheduler.arguments[2], scheduler.arguments[3], scheduler.arguments[4], scheduler.arguments[5], scheduler.arguments[6], scheduler.arguments[7], scheduler.arguments[8], scheduler.arguments[9], scheduler.arguments[10], scheduler.arguments[11])
                    elseif scheduler.argument_length == 12 then
                        scheduler.callback(scheduler.arguments[1], scheduler.arguments[2], scheduler.arguments[3], scheduler.arguments[4], scheduler.arguments[5], scheduler.arguments[6], scheduler.arguments[7], scheduler.arguments[8], scheduler.arguments[9], scheduler.arguments[10], scheduler.arguments[11], scheduler.arguments[12])
                    elseif scheduler.argument_length == 13 then
                        scheduler.callback(scheduler.arguments[1], scheduler.arguments[2], scheduler.arguments[3], scheduler.arguments[4], scheduler.arguments[5], scheduler.arguments[6], scheduler.arguments[7], scheduler.arguments[8], scheduler.arguments[9], scheduler.arguments[10], scheduler.arguments[11], scheduler.arguments[12], scheduler.arguments[13])
                    elseif scheduler.argument_length == 14 then
                        scheduler.callback(scheduler.arguments[1], scheduler.arguments[2], scheduler.arguments[3], scheduler.arguments[4], scheduler.arguments[5], scheduler.arguments[6], scheduler.arguments[7], scheduler.arguments[8], scheduler.arguments[9], scheduler.arguments[10], scheduler.arguments[11], scheduler.arguments[12], scheduler.arguments[13], scheduler.arguments[14])
                    elseif scheduler.argument_length == 15 then
                        scheduler.callback(scheduler.arguments[1], scheduler.arguments[2], scheduler.arguments[3], scheduler.arguments[4], scheduler.arguments[5], scheduler.arguments[6], scheduler.arguments[7], scheduler.arguments[8], scheduler.arguments[9], scheduler.arguments[10], scheduler.arguments[11], scheduler.arguments[12], scheduler.arguments[13], scheduler.arguments[14], scheduler.arguments[15])
                    elseif scheduler.argument_length == 16 then
                        scheduler.callback(scheduler.arguments[1], scheduler.arguments[2], scheduler.arguments[3], scheduler.arguments[4], scheduler.arguments[5], scheduler.arguments[6], scheduler.arguments[7], scheduler.arguments[8], scheduler.arguments[9], scheduler.arguments[10], scheduler.arguments[11], scheduler.arguments[12], scheduler.arguments[13], scheduler.arguments[14], scheduler.arguments[15], scheduler.arguments[16])
                    elseif scheduler.argument_length == 17 then
                        scheduler.callback(scheduler.arguments[1], scheduler.arguments[2], scheduler.arguments[3], scheduler.arguments[4], scheduler.arguments[5], scheduler.arguments[6], scheduler.arguments[7], scheduler.arguments[8], scheduler.arguments[9], scheduler.arguments[10], scheduler.arguments[11], scheduler.arguments[12], scheduler.arguments[13], scheduler.arguments[14], scheduler.arguments[15], scheduler.arguments[16], scheduler.arguments[17])
                    elseif scheduler.argument_length == 18 then
                        scheduler.callback(scheduler.arguments[1], scheduler.arguments[2], scheduler.arguments[3], scheduler.arguments[4], scheduler.arguments[5], scheduler.arguments[6], scheduler.arguments[7], scheduler.arguments[8], scheduler.arguments[9], scheduler.arguments[10], scheduler.arguments[11], scheduler.arguments[12], scheduler.arguments[13], scheduler.arguments[14], scheduler.arguments[15], scheduler.arguments[16], scheduler.arguments[17], scheduler.arguments[18])
                    elseif scheduler.argument_length == 19 then
                        scheduler.callback(scheduler.arguments[1], scheduler.arguments[2], scheduler.arguments[3], scheduler.arguments[4], scheduler.arguments[5], scheduler.arguments[6], scheduler.arguments[7], scheduler.arguments[8], scheduler.arguments[9], scheduler.arguments[10], scheduler.arguments[11], scheduler.arguments[12], scheduler.arguments[13], scheduler.arguments[14], scheduler.arguments[15], scheduler.arguments[16], scheduler.arguments[17], scheduler.arguments[18], scheduler.arguments[19])
                    elseif scheduler.argument_length == 20 then
                        scheduler.callback(scheduler.arguments[1], scheduler.arguments[2], scheduler.arguments[3], scheduler.arguments[4], scheduler.arguments[5], scheduler.arguments[6], scheduler.arguments[7], scheduler.arguments[8], scheduler.arguments[9], scheduler.arguments[10], scheduler.arguments[11], scheduler.arguments[12], scheduler.arguments[13], scheduler.arguments[14], scheduler.arguments[15], scheduler.arguments[16], scheduler.arguments[17], scheduler.arguments[18], scheduler.arguments[19], scheduler.arguments[20])
                    else
                        LoggerModule.error("SchedulerModuleRunner", "argument length is out of range")
                        callbacked = nil
                    end
                    if callbacked then
                        LoggerModule.debug("SchedulerModuleRunner", "scheduler id: " .. i .. " called successfully")
                    else
                        LoggerModule.error("SchedulerModuleRunner", "scheduler id: " .. i .. " called failed")
                    end
                    if scheduler.repeat_times and scheduler.aready_called_times >= scheduler.repeat_times then
                        scheduler.is_active = nil
                    end
                end
            end
        end
        
        LoggerModule.trace("SchedulerModuleRunner", "SchedulerModuleRunner finished")
    end
end



--- @class DelayCallSchedulerConfig
--- @field callback function 回调函数
--- @field delay_frame_num number 延迟帧数
--- @field passed_frames number 已经过去的帧数
--- @field arguments table 回调函数参数, 数组
--- @field argument_length number 回调函数参数个数

--- @type DelayCallSchedulerConfig[]
SchedulerModule._delay_call_schedulers = {}

--- N帧后调用某函数
--- @param callback function 回调函数
--- @param delay number 延迟帧数 (15帧=1秒)
--- @param arguments table|nil 回调函数参数, 数组. 元素个数需要和回调函数参数个数一致; nil等同于{}
SchedulerModule.delay_call = function(callback, delay, arguments)
    if type(callback) ~= "function" then
        LoggerModule.error("SchedulerModule.delay_call", "callback must be a function")
        return
    end
    if type(delay) ~= "number" or delay <= 0 then
        LoggerModule.error("SchedulerModule.delay_call", "delay must be a number and greater than 0")
        return
    end
    if type(arguments) ~= "table" and arguments ~= nil then
        LoggerModule.error("SchedulerModule.delay_call", "arguments must be a table or nil")
        return
    end

    local scheduler = SchedulerModule._delay_call_schedulers
    local id = getn(SchedulerModule._delay_call_schedulers) + 1
    scheduler[id] = {
        callback = callback,
        delay_frame_num = delay,
        passed_frames = 0,
        arguments = arguments or {},
        argument_length = getn(arguments or {})
    }
end


--- delay_call调度器内部函数, 请勿使用该函数
SchedulerModule.__delay_call_scheduler_runner_function = function()
    if GetFrame() > 1 then
        LoggerModule.trace("SchedulerModuleRunner", "SchedulerModuleRunner delay call start")

        local aready_called_delay_call_scheduler_index_list = {}
    
        for i = 1, getn(SchedulerModule._delay_call_schedulers) do
            --- @type DelayCallSchedulerConfig
            local scheduler = SchedulerModule._delay_call_schedulers[i]
            
            scheduler.passed_frames = scheduler.passed_frames + 1
            if scheduler.passed_frames >= scheduler.delay_frame_num then
                local callbacked = 1

                if scheduler.argument_length == 0 then
                    scheduler.callback()
                elseif scheduler.argument_length == 1 then
                    scheduler.callback(scheduler.arguments[1])
                elseif scheduler.argument_length == 2 then
                    scheduler.callback(scheduler.arguments[1], scheduler.arguments[2])
                elseif scheduler.argument_length == 3 then
                    scheduler.callback(scheduler.arguments[1], scheduler.arguments[2], scheduler.arguments[3])
                elseif scheduler.argument_length == 4 then
                    scheduler.callback(scheduler.arguments[1], scheduler.arguments[2], scheduler.arguments[3], scheduler.arguments[4])
                elseif scheduler.argument_length == 5 then
                    scheduler.callback(scheduler.arguments[1], scheduler.arguments[2], scheduler.arguments[3], scheduler.arguments[4], scheduler.arguments[5])
                elseif scheduler.argument_length == 6 then
                    scheduler.callback(scheduler.arguments[1], scheduler.arguments[2], scheduler.arguments[3], scheduler.arguments[4], scheduler.arguments[5], scheduler.arguments[6])
                elseif scheduler.argument_length == 7 then
                    scheduler.callback(scheduler.arguments[1], scheduler.arguments[2], scheduler.arguments[3], scheduler.arguments[4], scheduler.arguments[5], scheduler.arguments[6], scheduler.arguments[7])
                elseif scheduler.argument_length == 8 then
                    scheduler.callback(scheduler.arguments[1], scheduler.arguments[2], scheduler.arguments[3], scheduler.arguments[4], scheduler.arguments[5], scheduler.arguments[6], scheduler.arguments[7], scheduler.arguments[8])
                elseif scheduler.argument_length == 9 then
                    scheduler.callback(scheduler.arguments[1], scheduler.arguments[2], scheduler.arguments[3], scheduler.arguments[4], scheduler.arguments[5], scheduler.arguments[6], scheduler.arguments[7], scheduler.arguments[8], scheduler.arguments[9])
                elseif scheduler.argument_length == 10 then
                    scheduler.callback(scheduler.arguments[1], scheduler.arguments[2], scheduler.arguments[3], scheduler.arguments[4], scheduler.arguments[5], scheduler.arguments[6], scheduler.arguments[7], scheduler.arguments[8], scheduler.arguments[9], scheduler.arguments[10])
                elseif scheduler.argument_length == 11 then
                    scheduler.callback(scheduler.arguments[1], scheduler.arguments[2], scheduler.arguments[3], scheduler.arguments[4], scheduler.arguments[5], scheduler.arguments[6], scheduler.arguments[7], scheduler.arguments[8], scheduler.arguments[9], scheduler.arguments[10], scheduler.arguments[11])
                elseif scheduler.argument_length == 12 then
                    scheduler.callback(scheduler.arguments[1], scheduler.arguments[2], scheduler.arguments[3], scheduler.arguments[4], scheduler.arguments[5], scheduler.arguments[6], scheduler.arguments[7], scheduler.arguments[8], scheduler.arguments[9], scheduler.arguments[10], scheduler.arguments[11], scheduler.arguments[12])
                elseif scheduler.argument_length == 13 then
                    scheduler.callback(scheduler.arguments[1], scheduler.arguments[2], scheduler.arguments[3], scheduler.arguments[4], scheduler.arguments[5], scheduler.arguments[6], scheduler.arguments[7], scheduler.arguments[8], scheduler.arguments[9], scheduler.arguments[10], scheduler.arguments[11], scheduler.arguments[12], scheduler.arguments[13])
                elseif scheduler.argument_length == 14 then
                    scheduler.callback(scheduler.arguments[1], scheduler.arguments[2], scheduler.arguments[3], scheduler.arguments[4], scheduler.arguments[5], scheduler.arguments[6], scheduler.arguments[7], scheduler.arguments[8], scheduler.arguments[9], scheduler.arguments[10], scheduler.arguments[11], scheduler.arguments[12], scheduler.arguments[13], scheduler.arguments[14])
                elseif scheduler.argument_length == 15 then
                    scheduler.callback(scheduler.arguments[1], scheduler.arguments[2], scheduler.arguments[3], scheduler.arguments[4], scheduler.arguments[5], scheduler.arguments[6], scheduler.arguments[7], scheduler.arguments[8], scheduler.arguments[9], scheduler.arguments[10], scheduler.arguments[11], scheduler.arguments[12], scheduler.arguments[13], scheduler.arguments[14], scheduler.arguments[15])
                elseif scheduler.argument_length == 16 then
                    scheduler.callback(scheduler.arguments[1], scheduler.arguments[2], scheduler.arguments[3], scheduler.arguments[4], scheduler.arguments[5], scheduler.arguments[6], scheduler.arguments[7], scheduler.arguments[8], scheduler.arguments[9], scheduler.arguments[10], scheduler.arguments[11], scheduler.arguments[12], scheduler.arguments[13], scheduler.arguments[14], scheduler.arguments[15], scheduler.arguments[16])
                elseif scheduler.argument_length == 17 then
                    scheduler.callback(scheduler.arguments[1], scheduler.arguments[2], scheduler.arguments[3], scheduler.arguments[4], scheduler.arguments[5], scheduler.arguments[6], scheduler.arguments[7], scheduler.arguments[8], scheduler.arguments[9], scheduler.arguments[10], scheduler.arguments[11], scheduler.arguments[12], scheduler.arguments[13], scheduler.arguments[14], scheduler.arguments[15], scheduler.arguments[16], scheduler.arguments[17])
                elseif scheduler.argument_length == 18 then
                    scheduler.callback(scheduler.arguments[1], scheduler.arguments[2], scheduler.arguments[3], scheduler.arguments[4], scheduler.arguments[5], scheduler.arguments[6], scheduler.arguments[7], scheduler.arguments[8], scheduler.arguments[9], scheduler.arguments[10], scheduler.arguments[11], scheduler.arguments[12], scheduler.arguments[13], scheduler.arguments[14], scheduler.arguments[15], scheduler.arguments[16], scheduler.arguments[17], scheduler.arguments[18])
                elseif scheduler.argument_length == 19 then
                    scheduler.callback(scheduler.arguments[1], scheduler.arguments[2], scheduler.arguments[3], scheduler.arguments[4], scheduler.arguments[5], scheduler.arguments[6], scheduler.arguments[7], scheduler.arguments[8], scheduler.arguments[9], scheduler.arguments[10], scheduler.arguments[11], scheduler.arguments[12], scheduler.arguments[13], scheduler.arguments[14], scheduler.arguments[15], scheduler.arguments[16], scheduler.arguments[17], scheduler.arguments[18], scheduler.arguments[19])
                elseif scheduler.argument_length == 20 then
                    scheduler.callback(scheduler.arguments[1], scheduler.arguments[2], scheduler.arguments[3], scheduler.arguments[4], scheduler.arguments[5], scheduler.arguments[6], scheduler.arguments[7], scheduler.arguments[8], scheduler.arguments[9], scheduler.arguments[10], scheduler.arguments[11], scheduler.arguments[12], scheduler.arguments[13], scheduler.arguments[14], scheduler.arguments[15], scheduler.arguments[16], scheduler.arguments[17], scheduler.arguments[18], scheduler.arguments[19], scheduler.arguments[20])
                else
                    LoggerModule.error("SchedulerModuleRunner", "argument length is out of range")
                    callbacked = nil
                end
                if callbacked then
                    LoggerModule.debug("SchedulerModuleRunner", "delay call scheduler index: " .. i .. " called successfully")
                else
                    LoggerModule.error("SchedulerModuleRunner", "delay call scheduler index: " .. i .. " called failed")
                end
                tinsert(aready_called_delay_call_scheduler_index_list, i)
            end
        end

        for i = getn(aready_called_delay_call_scheduler_index_list), 1, -1 do
            tremove(SchedulerModule._delay_call_schedulers, aready_called_delay_call_scheduler_index_list[i])
        end
        
        LoggerModule.trace("SchedulerModuleRunner", "SchedulerModuleRunner delay call finished")
    end
end




--- 调度器内部函数, 请勿使用该函数
SchedulerModule.__runner_function = function()
    SchedulerModule.__scheduler_runner_function()
    SchedulerModule.__delay_call_scheduler_runner_function()
end


