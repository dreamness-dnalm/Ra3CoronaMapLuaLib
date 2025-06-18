TeamAttackModule = {}

--- 捕猎, 对人类玩家无效 (53)
--- @param team_name string
TeamAttackModule.hunt = function(team_name)
    if type(team_name) ~= "string" then
        logger.error("TeamAttackModule.hunt", "team_name must be a string")
    end

    ExecuteAction("TEAM_HUNT", team_name) -- (53)
end





