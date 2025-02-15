--- keyboard_demo.lua
--- Created by dreamness
--- DateTime: 12/14/2024 11:42 PM

LoggerModule.setup(LoggerLevelEnum.DEBUG, {LoggerTargetEnum.DEBUG_LOG_FILE, LoggerTargetEnum.PUBLIC_BOARD})


EventHelper.register_hot_key(
    KeyboardKeyCodeEnum.SPACEBAR,
    '0',
    function(player_name, mouse_x, mouse_y, mouse_z)
        PublicBoardModule.show_text('player <' .. player_name .. '> pressed fire', 10, nil)
    end
)

EventHelper.register_hot_key(
    KeyboardKeyCodeEnum.K_W,
    '0',
    function(player_name, mouse_x, mouse_y, mouse_z)
        PublicBoardModule.show_text('player <' .. player_name .. '> pressed move forward', 10, nil)
    end
)

EventHelper.register_hot_key(
    KeyboardKeyCodeEnum.K_S,
    '0',
    function(player_name, mouse_x, mouse_y, mouse_z)
        PublicBoardModule.show_text('player <' .. player_name .. '> pressed move backward', 10, nil)
    end
)

EventHelper.register_hot_key(
    KeyboardKeyCodeEnum.K_A,
    '0',
    function(player_name, mouse_x, mouse_y, mouse_z)
        PublicBoardModule.show_text('player <' .. player_name .. '> pressed move left', 10, nil)
    end
)

EventHelper.register_hot_key(
    KeyboardKeyCodeEnum.K_D,
    '0',
    function(player_name, mouse_x, mouse_y, mouse_z)
        PublicBoardModule.show_text('player <' .. player_name .. '> pressed move right', 10, nil)
    end
)
