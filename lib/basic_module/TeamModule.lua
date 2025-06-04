--- TeamModule.lua
--- Created by dreamness
--- DateTime: 9/1/2024 9:39 PM
---

--- @class TeamEnum
TeamEnum = {
    Player_1 = "Player_1/teamPlayer_1",
    Player_2 = "Player_2/teamPlayer_2",
    Player_3 = "Player_3/teamPlayer_3",
    Player_4 = "Player_4/teamPlayer_4",
    Player_5 = "Player_5/teamPlayer_5",
    Player_6 = "Player_6/teamPlayer_6",
    Player_7 = "Player_7/teamPlayer_7",
    Player_8 = "Player_8/teamPlayer_8",


    PlyrCivilian = "PlyrCivilian/teamPlyrCivilian",
    SkirmishAllies = "SkirmishAllies/teamSkirmishAllies",
    SkirmishCivilian = "SkirmishCivilian/teamSkirmishCivilian",
    SkirmishJapan = "SkirmishJapan/teamSkirmishJapan"
}

--- 队伍模块
TeamModule = {}

--- 从玩家名获取队伍名
--- @param player_name PlayerEnum
--- @return TeamEnum
TeamModule.from_player_name = function(player_name)
    if type(player_name) ~= "string" then
        LoggerModule.error("TeamModule.from_player_name", "player_name must be a string")
        return nil
    end
    return player_name .. "/team" .. player_name
end


-- TODO: test, package
-- 获取指定队伍的成员
--- @param team_name TeamEnum
--- @return table 成员列表
--- @return number 成员数量
TeamModule.get_members = function(team_name)
    if type(team_name) ~= "string" then
        LoggerModule.error("TeamModule.get_members", "team_name must be a string")
        return nil, 0
    end
    return exTeamGetMembers(team_name)
end

