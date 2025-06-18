PlayerHelper = {}

-- TODO: doc
--- 根据名字获取Player对象
--- @param name PlayerEnum
--- @return Player
PlayerHelper.get_player_from_name = function(name)
    if type(name) ~= "string" then
        logger.error("PlayerHelper.get_player_from_name", "name must be a string")
    end
    local obj = { name = name }
    settag(obj, _meta.tags.player_tag)
    settagmethod(_meta.tags.player_tag, "index", function(t, key)
        return Player[key]
    end)
    return obj
end






