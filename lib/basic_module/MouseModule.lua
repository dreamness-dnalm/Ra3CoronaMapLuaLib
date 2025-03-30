MouseModule = {}



--- 启用或禁用鼠标位置事件
--- @param player_name string 玩家名字
--- @param is_enable boolean 是否启用
MouseModule.enable_mouse_pos_event = function(player_name, is_enable)
    if type(player_name) ~= "string" then
        LoggerModule.error("MouseModule.enable_mouse_pos_event", "player_name must be a string")
        return
    end
    
    if is_enable then
        exEnableMousePosEvent(player_name)
    else
        exDisableMousePosEvent(player_name)
        MouseModule.mouse_pos_table[player_name] = nil
    end
end


--- 注册鼠标位置事件回调
--- @param func function 回调函数(player_name, screen_pos, world_pos)
MouseModule.__register_mouse_pos_event_callback = function(func)
    if type(func) ~= "function" then
        LoggerModule.error("MouseModule.__register_mouse_pos_event_callback", "func must be a function")
        return
    end
    globals().onUserMousePosEvent = func
end

--- @class MouseModule.PlayerMousePosTable
--- @field screen_pos_x number 屏幕坐标x
--- @field screen_pos_y number 屏幕坐标y
--- @field world_pos_x number 世界坐标x
--- @field world_pos_y number 世界坐标y
--- @field world_pos_z number 世界坐标z

--- @type table<string, MouseModule.PlayerMousePosTable> 玩家鼠标位置数据
MouseModule.mouse_pos_table = {}

-- TODO: test
--- 获取玩家鼠标屏幕坐标
--- @param player_name string 玩家名字
--- @return number 屏幕坐标x, number 屏幕坐标y
MouseModule.get_mouse_screen_pos = function(player_name)
    if type(player_name) ~= "string" then
        LoggerModule.error("MouseModule.get_mouse_screen_pos", "player_name must be a string")
        return nil, nil
    end
    if MouseModule.mouse_pos_table[player_name] == nil then
        LoggerModule.error("MouseModule.get_mouse_screen_pos", "player_name: " .. player_name .. " is not in mouse_pos_table")
        return nil, nil
    end
    return MouseModule.mouse_pos_table[player_name].screen_pos_x, MouseModule.mouse_pos_table[player_name].screen_pos_y
end

-- TODO: test
--- 获取玩家鼠标世界坐标
--- @param player_name string 玩家名字
--- @return number 世界坐标x, number 世界坐标y, number 世界坐标z
MouseModule.get_mouse_world_pos = function(player_name)
    if type(player_name) ~= "string" then
        LoggerModule.error("MouseModule.get_mouse_world_pos", "player_name must be a string")
        return nil, nil, nil
    end
    if MouseModule.mouse_pos_table[player_name] == nil then
        LoggerModule.error("MouseModule.get_mouse_world_pos", "player_name: " .. player_name .. " is not in mouse_pos_table")
        return nil, nil, nil
    end
    return MouseModule.mouse_pos_table[player_name].world_pos_x, MouseModule.mouse_pos_table[player_name].world_pos_y, MouseModule.mouse_pos_table[player_name].world_pos_z
end

MouseModule.__register_mouse_pos_event_callback(function(player_name, screen_pos, world_pos)
    -- LoggerModule.info("MouseModule.__register_mouse_pos_event_callback", "player_name: " .. player_name, "screen_pos: " .. screen_pos, "world_pos: " .. world_pos)

    if screen_pos == nil then
        LoggerModule.error("MouseModule.__register_mouse_pos_event_callback", "screen_pos is nil")
        return
    end

    MouseModule.mouse_pos_table[player_name] = {
        screen_pos_x = screen_pos.X,
        screen_pos_y = screen_pos.Y,
        world_pos_x = world_pos.X,
        world_pos_y = world_pos.Y,
        world_pos_z = world_pos.Z,
    }
end)


