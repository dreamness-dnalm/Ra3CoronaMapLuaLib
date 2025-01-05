--- CounterModule.lua
--- Created by dreamness
--- DateTime: 01/05/2025 09:07 PM


CounterModule = {}

--- 获取计数器的值
--- @param counter_name string
--- @return number
CounterModule.get_counter_value = function(counter_name)
    return exCounterGetByName(counter_name)
end

--- 设置计数器的值
--- @param counter_name string
--- @param value number
CounterModule.set_counter_value = function(counter_name, value)
    if type(counter_name) ~= "string" then
        LoggerModule.error("CounterModule.set_counter_value", "counter_name must be a string")
        return
    end
    if type(value) ~= "number" then
        LoggerModule.error("CounterModule.set_counter_value", "value must be a number")
        return
    end
    exCounterSetByName(counter_name, value)
end

--- 显示计数器(188)
--- @param counter_name string
--- @param map_str_key string
CounterModule.show_counter = function(counter_name, map_str_key)
    if type(counter_name) ~= "string" then
        LoggerModule.error("CounterModule.show_counter", "counter_name must be a string")
        return
    end
    if type(map_str_key) ~= "string" then
        LoggerModule.error("CounterModule.show_counter", "text must be a string")
        return
    end
    ExecuteAction("DISPLAY_COUNTER", counter_name, map_str_key)
end

--- 隐藏计数器 (189)
--- @param counter_name string
CounterModule.hide_counter = function(counter_name)
    if type(counter_name) ~= "string" then
        LoggerModule.error("CounterModule.hide_counter", "counter_name must be a string")
        return
    end
    ExecuteAction("HIDE_COUNTER", counter_name)
end

--- TODO: 备注: 不支持设定计时器时间(21)

--- 显示计时器 (130)
--- @param counter_name string
--- @param map_str_key string
CounterModule.show_timer = function(counter_name, map_str_key)
    if type(counter_name) ~= "string" then
        LoggerModule.error("CounterModule.show_timer", "counter_name must be a string")
        return
    end
    if type(map_str_key) ~= "string" then
        LoggerModule.error("CounterModule.show_timer", "text must be a string")
        return
    end
    ExecuteAction("DISPLAY_COUNTDOWN_TIMER", counter_name, map_str_key)
end

--- 隐藏计时器 (131)
--- @param counter_name string
CounterModule.hide_timer = function(counter_name)
    if type(counter_name) ~= "string" then
        LoggerModule.error("CounterModule.hide_timer", "counter_name must be a string")
        return
    end
    ExecuteAction("HIDE_COUNTDOWN_TIMER", counter_name)
end

--- 启用/禁止显示计数器和计时器 (132) / (133)
--- @param is_enable boolean
CounterModule.enable_visible_counter_or_timer = function(is_enable)
    if is_enable then
        ExecuteAction("ENABLE_COUNTDOWN_TIMER_DISPLAY") -- (132)
    else
        ExecuteAction("DISABLE_COUNTDOWN_TIMER_DISPLAY") -- (133)
    end
end
