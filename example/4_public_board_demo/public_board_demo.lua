--- public_board_demo.lua
--- Created by dreamness
--- DateTime: 12/15/2024 02:03 AM

--- 向所有玩家显示公屏信息, 持续10秒
PublicBoardModule.show_text('Hello, everyone!', 10, nil)

--- 向Player_1显示公屏信息, 持续10秒
PublicBoardModule.show_text('Hello, Player_1!', 10, PlayerEnum.Player_1)

--- 向Player_2显示公屏信息, 持续10秒
PublicBoardModule.show_text('Hello, Player_2!', 10, PlayerEnum.Player_2)

--- 向Player_1和Player_2显示公屏信息, 持续10秒
PublicBoardModule.show_text('Hello, Player_1 and Player_2!', 10, {PlayerEnum.Player_1, PlayerEnum.Player_2})

