--- FogModule.lua
--- Created by dreamness
--- DateTime: 9/15/2024 9:25 AM
---

FogModule = {}

--- 为玩家展开全图视野 (183) / (184)
--- @param player_name PlayerEnum | nil nil针对所有玩家
--- @param is_enable boolean 开启/关闭
FogModule.reveal_map = function(player_name, is_enable)
    if type(player_name) ~= "nil" and type(player_name) ~= 'string' then
        LoggerModule.error("FogModule.reveal_map", "player_name should be PlayerEnum or nil")
        return
    end

    if player_name == nil then
        for _, player_name in PlayerEnum do
            if is_enable then
                ExecuteAction("MAP_REVEAL_ALL_PERM", player_name)
            else
                ExecuteAction("MAP_REVEAL_ALL_UNDO_PERM", player_name)
            end
        end
    else
        if is_enable then
            ExecuteAction("MAP_REVEAL_ALL_PERM", player_name)
        else
            ExecuteAction("MAP_REVEAL_ALL_UNDO_PERM", player_name)
        end
    end
    LoggerModule.debug("FogModule.reveal_map", "end")
end

-- TODO: doc
--- 判断单位是否在玩家的视野中  [23]
--- @param player_name PlayerEnum
--- @param unit_name_or_table string | SystemUnitTable
--- @return boolean
FogModule.is_unit_in_sight = function(player_name, unit_name_or_table)
    if type(player_name) ~= "string" then
        LoggerModule.error("FogModule.is_unit_in_sight", "player_name should be a string")
        return nil
    end

    if type(unit_name_or_table) ~= "string" and type(unit_name_or_table) ~= "table" then
        LoggerModule.error("FogModule.is_unit_in_sight", "unit_name_or_table should be a string or table")
        return nil
    end

    return GameModule.from_ra3_boolean(EvaluateCondition('NAMED_DISCOVERED', player_name, unit_name_or_table)) -- [23]
end


-- TODO: test, doc
--- 为玩家揭示区域中的视野 (421)
--- @param player_name PlayerEnum
--- @param area_name string 区域名称
--- @param reveal_name string 揭示名称
FogModule.reveal_area = function(player_name, area_name, reveal_name)
    if type(player_name) ~= "string" then
        LoggerModule.error("FogModule.reveal_area", "player_name should be a string")
        return nil
    end
    if type(area_name) ~= "string" then
        LoggerModule.error("FogModule.reveal_area", "area_name should be a string")
        return nil
    end
    if type(reveal_name) ~= "string" then
        LoggerModule.error("FogModule.reveal_area", "reveal_name should be a string")
        return nil
    end

    ExecuteAction("MAP_REVEAL_PERMANENTLY_IN_TRIGGER", area_name, player_name,   reveal_name) -- (421)

end


-- {
--     .index = "421",
--     .id = "MAP_REVEAL_PERMANENTLY_IN_TRIGGER",
--     .name = R"#(Map/Fog or Reveal/Reveal map in polytrigger -- permanently.[421])#",
--     .help = R"#(No help text has been defined for this script. Contact your local help text provider for details. Have a nice day!)#",
--     .argHint = R"#(The map is permanently revealed in trigger ${TriggerAreaName} for ${PlayerName}. (Afterwards referred to as ${MapRevealName}).)#",
-- },