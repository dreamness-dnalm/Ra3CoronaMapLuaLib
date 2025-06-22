TeamAttackModule = {}

-- TODO: package, doc
--- 捕猎, 对人类玩家无效 (53)
--- @param team_name string
TeamAttackModule.hunt = function(team_name)
    if type(team_name) ~= "string" then
        logger.error("TeamAttackModule.hunt", "team_name must be a string")
    end

    ExecuteAction("TEAM_HUNT", team_name) -- (53)
end




-- TODO: test, package, doc
--- 移动g攻击到指定路径点 (413)
--- @param team_name string
--- @param waypoint_name string
TeamAttackModule.attack_move_to_waypoint = function(team_name, waypoint_name)
    if type(team_name) ~= "string" then
        logger.error("TeamAttackModule.attack_move_to_waypoint", "team_name must be a string")
        return
    end

    if type(waypoint_name) ~= "string" then
        logger.error("TeamAttackModule.attack_move_to_waypoint", "waypoint_name must be a string")
        return
    end

    ExecuteAction("ATTACK_MOVE_TEAM_TO", team_name, waypoint_name) -- (413)
end