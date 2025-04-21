EventHelper = {}

EventHelper._meta = {
    keyboard_command_code_index = 0,
    keyboard_funcs = {},
    keyboard_callback_func_register_flag = nil,

    unit_die_funcs = {},
    unit_die_callback_func_register_flag = nil,

    unit_top_button_click_funcs = {},
    unit_top_button_click_callback_func_register_flag = nil,

    top_button_click_funcs = {},
    top_button_click_callback_func_register_flag = nil,

    mission_hotspot_funcs = {},
    mission_hotspot_callback_func_register_flag = nil,

    unit_create_funcs = {},
    unit_create_callback_func_register_flag = nil,
}

--- 注册键盘热键
--- @param key_code_hex KeyboardKeyCodeEnum
--- @param assist_key_code_hex KeyboardKeyCodeEnum
--- @param callback_func function 监听器 func(player_name, mouse_x, mouse_y, mouse_z)
EventHelper.register_hot_key = function(key_code_hex, assist_key_code_hex, callback_func)
    if type(key_code_hex) ~= "string" or strlen(key_code_hex) == 0 then
        LoggerModule.error("EventHelper.register_hot_key", "key_code_hex must be a string and length > 0")
        return
    end
    if assist_key_code_hex == nil then
        assist_key_code_hex = '0'
    end
    if type(assist_key_code_hex) ~= "string" or strlen(assist_key_code_hex) == 0 then
        LoggerModule.error("EventHelper.register_hot_key", "assist_key_code_hex must be a string and length > 0")
        return
    end
    if callback_func ~= nil and type(callback_func) ~= "function" then
        LoggerModule.error("EventHelper.register_hot_key", "callback_func must be a function")
        return
    end

    EventHelper._meta.keyboard_command_code_index = EventHelper._meta.keyboard_command_code_index + 1

    KeyboardModule.register_hot_key(key_code_hex, assist_key_code_hex, EventHelper._meta.keyboard_command_code_index)
    
    
    EventHelper._meta.keyboard_funcs[EventHelper._meta.keyboard_command_code_index] = callback_func

    if not EventHelper._meta.keyboard_callback_func_register_flag then
        KeyboardModule.register_hot_key_listener(function(player_name, command_code, mouse_x, mouse_y, mouse_z)
            local func = EventHelper._meta.keyboard_funcs[command_code]
            if func ~= nil then
                func(player_name, command_code, mouse_x, mouse_y, mouse_z)
            end
        end)
        EventHelper._meta.keyboard_callback_func_register_flag = 1
    end
end

--- 注册单位死亡事件
--- @param thing ThingEnum
--- @param callback_func function 监听器 func(dying_unit, attacker_unit <可能为nil> )
EventHelper.register_unit_die_event = function(thing, callback_func)
    if type(thing) ~= "string" then
        LoggerModule.error("EventHelper.register_unit_die_event", "thing must be a string")
        return
    end
    if callback_func ~= nil and type(callback_func) ~= "function" then
        LoggerModule.error("EventHelper.register_unit_die_event", "callback_func must be a function")
        return
    end

    EventHelper._meta.unit_die_funcs[tostring(GameModule.get_string_fast_hash(thing))] = callback_func
    UnitHealthModule.register_unit_die_event(thing)

    if not EventHelper._meta.unit_die_callback_func_register_flag then
        UnitHealthModule.register_die_event_callback(function(dying_object_id, attacker_object_id, dying_object_instance_id, attacker_object_instance_id, owner_player_name)
            local dying_unit = UnitHelper.get_unit_from_id(dying_object_id)
            local attacker_unit = nil
            if attacker_object_id ~= nil then
                attacker_unit = UnitHelper.get_unit_from_id(attacker_object_id)
            end

            local _func = EventHelper._meta.unit_die_funcs[tostring(dying_object_instance_id)]
            if _func ~= nil then
                _func(dying_unit, attacker_unit)
            end
        end)
        EventHelper._meta.unit_die_callback_func_register_flag = 1
    end
end

--- 注册单位顶部按钮点击事件
--- @param unit Unit
--- @param callback_func function 监听器 func(player_name, unit)
EventHelper.register_unit_top_button_click_event = function(unit, callback_func)
    if type(unit) ~= "table" then
        LoggerModule.error("EventHelper.register_unit_top_button_click_event", "unit must be a table")
        return
    end
    if callback_func ~= nil and type(callback_func) ~= "function" then
        LoggerModule.error("EventHelper.register_unit_top_button_click_event", "callback_func must be a function")
        return
    end

    EventHelper._meta.unit_top_button_click_funcs[tostring(unit.id)] = callback_func

    UnitTopButtonModule.register_button_click_callback(
        function(player_name, unit_id)
            local _unit = UnitHelper.get_unit_from_id(unit_id)
            local func = EventHelper._meta.unit_top_button_click_funcs[tostring(unit_id)]
            if func ~= nil then
                func(player_name, _unit)
            end
        end
    )
end

--- 注册顶部按钮点击事件
--- @param pos_index number 1-6
--- @param callback_func function 监听器 func(player_name, shift_pressed)
EventHelper.register_top_button_click_event = function(pos_index, callback_func)
    if type(pos_index) ~= "number" then
        LoggerModule.error("EventHelper.register_top_button_click_event", "pos_index must be a number")
        return
    end
    if pos_index < 1 or pos_index > 6 then
        LoggerModule.error("EventHelper.register_top_button_click_event", "pos_index must be in [1, 6]")
        return
    end
    if callback_func ~= nil and type(callback_func) ~= "function" then
        LoggerModule.error("EventHelper.register_top_button_click_event", "callback_func must be a function")
        return
    end

    EventHelper._meta.top_button_click_funcs[tostring(pos_index)] = callback_func

    TopButtonModule.register_button_click_callback(
        function(player_name, pos_index, shift_pressed)
            local func = EventHelper._meta.top_button_click_funcs[tostring(pos_index)]
            if func ~= nil then
                func(player_name, shift_pressed)
            end
        end
    )
end

--- 注册任务热点事件
--- @param hotspot_id string
--- @param callback_func function 监听器 func(hotspot_id)
EventHelper.register_mission_hotspot_event = function(hotspot_id, callback_func)
    if type(hotspot_id) ~= "string" then
        LoggerModule.error("EventHelper.register_mission_hotspot_event", "hotspot_id must be a string")
        return
    end

    if callback_func ~= nil and type(callback_func) ~= "function" then
        LoggerModule.error("EventHelper.register_mission_hotspot_event", "callback_func must be a function")
        return
    end

    EventHelper._meta.mission_hotspot_funcs[hotspot_id] = callback_func

    if not EventHelper._meta.mission_hotspot_callback_func_register_flag then

        SchedulerModule.call_every_x_frame(
        function()
            for _hotspot_id, _func in EventHelper._meta.mission_hotspot_funcs do
                if _func ~= nil and MissionHotSpotModule.is_active(_hotspot_id) then
                    _func(_hotspot_id)
                    EventHelper._meta.mission_hotspot_funcs[_hotspot_id] = nil
                end
            end
        end, 1, nil, nil)
        EventHelper._meta.mission_hotspot_callback_func_register_flag = 1
    end
end

--- 注册单位创建事件
--- @param thing ThingEnum
--- @param callback_func function 监听器 func(unit)
EventHelper.register_unit_create_event = function(thing, callback_func)
    if type(thing) ~= "string" then
        LoggerModule.error("EventHelper.register_unit_create_event", "thing must be a string")
        return
    end
    if callback_func ~= nil and type(callback_func) ~= "function" then
        LoggerModule.error("EventHelper.register_unit_create_event", "callback_func must be a function")
        return
    end

    EventHelper._meta.unit_create_funcs[tostring(GameModule.get_string_fast_hash(thing))] = callback_func
    UnitModule.register_create_event(thing)

    if not EventHelper._meta.unit_create_callback_func_register_flag then
        UnitModule.register_create_event_callback(function(created_obj_id, created_Obj_instance_id, owner_player_name)
            local unit = UnitHelper.get_unit_from_id(created_obj_id)
            local _func = EventHelper._meta.unit_create_funcs[tostring(created_Obj_instance_id)]
            if _func ~= nil then
                _func(unit)
            end
        end)
        EventHelper._meta.unit_create_callback_func_register_flag = 1
    end
end

--- 注册鼠标位置事件
--- @param player_name PlayerEnum
--- @param is_enable boolean 是否启用
EventHelper.register_mouse_position_event = function(player_name, is_enable)
    if type(player_name) ~= "string" then
        LoggerModule.error("EventHelper.register_mouse_position_event", "player_name must be a string")
        return
    end
    MouseModule.enable_mouse_pos_event(player_name, is_enable)
end
