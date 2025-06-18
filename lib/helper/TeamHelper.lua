TeamHelper = {}

-- TODO: doc
--- 根据名字获取Team对象
--- @param name string
--- @return Team
TeamHelper.get_team_from_name = function(name)
    if type(name) ~= "string" then
        logger.error("TeamHelper.get_team_from_name", "name must be a string")
        return nil
    end
    local obj = { name = name }
    settag(obj, _meta.tags.team_tag)
    settagmethod(_meta.tags.team_tag, "index", function(t, key)
        return Team[key]
    end)
    return obj
end

-- TODO: doc
--- 根据玩家和子名称获取Team对象
--- @param player Player
--- @param subname string | nil 如果为nil, 则返回默认队伍
--- @return Team
TeamHelper.get_team_from_player_and_subname = function(player, subname)
    if type(player) ~= "table" then
        logger.error("TeamHelper.get_team_from_player_and_subname", "player must be a Player")
    end
    if type(subname) ~= "string" and subname ~= nil then
        logger.error("TeamHelper.get_team_from_player_and_subname", "subname must be a string or nil")
    end

    if subname == nil then
        return TeamHelper.get_team_from_name(player.name .. "/" .. "team" .. player.name)
    else
        return TeamHelper.get_team_from_name(player.name .. "/" .. subname)
    end
end