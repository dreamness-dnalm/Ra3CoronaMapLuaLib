--- upgradeModule.lua
--- Created by dreamness
--- DateTime: 12/15/2024 03:50 PM

--- 升级模块
UpgradeModule = {}


-- TODO: test, package
--- 玩家是否拥有某升级 [53]
--- @param player_name string
--- @param upgrade_name UpgradeEnum
--- @return boolean
UpgradeModule.has_upgrade = function(player_name, upgrade_name)
    LoggerModule.debug("UpgradeModule.has_upgrade", "start")
    if type(player_name) ~= "string" then
        LoggerModule.error("UpgradeModule.has_upgrade", "player_name must be a string")
        return nil
    end
    if type(upgrade_name) ~= "string" then
        LoggerModule.error("UpgradeModule.has_upgrade", "player_name must be a string")
        return nil
    end
    ret = EvaluateCondition("PLAYER_BUILT_UPGRADE", player_name, upgrade_name)
    LoggerModule.debug("UpgradeModule.has_upgrade", "end")
    return ret
end

-- TODO: test, package
--- 允许玩家升级 (535)
--- @param player_name string
--- @param upgrade_name UpgradeEnum
--- @param is_allow boolean
UpgradeModule.allow_upgrade = function(player_name, upgrade_name, is_allow)
    LoggerModule.debug("UpgradeModule.allow_upgrade", "start")
    if type(player_name) ~= "string" then
        LoggerModule.error("UpgradeModule.allow_upgrade", "player_name must be a string")
    end
    if type(upgrade_name) ~= "string" then
        LoggerModule.error("UpgradeModule.allow_upgrade", "upgrade_name must be a string")
    end
    ExecuteAction("ALLOW_DISALLOW_ONE_UPGRADE", player_name, upgrade_name, is_allow)
    LoggerModule.debug("UpgradeModule.allow_upgrade", "end")
end

-- TODO: test, package
--- 玩家是否拥有某升级 (314) / (504) 用途暂时不明
--- @param player_name string
--- @param upgrade_name UpgradeEnum
--- @param is_enable boolean
UpgradeModule.enable_upgrade = function(player_name, upgrade_name, is_enable)
    LoggerModule.debug("UpgradeModule.enable_upgrade", "start")
    if type(player_name) ~= "string" then
        LoggerModule.error("UpgradeModule.enable_upgrade", "player_name must be a string")
    end
    if type(upgrade_name) ~= "string" then
        LoggerModule.error("UpgradeModule.enable_upgrade", "upgrade_name must be a string")
    end
    if is_enable then
        ExecuteAction("GIVE_PLAYER_UPGRADE", player_name, upgrade_name)
    else
        ExecuteAction("REMOVE_PLAYER_UPGRADE", upgrade_name, player_name)
    end
    LoggerModule.debug("UpgradeModule.enable_upgrade", "end")
end

-- TODO: test, package
--- 给单位升级  (201) (502)
--- @param unit_name_or_table string|SystemUnitTable
--- @param upgrade_name UpgradeEnum
--- @param is_enable boolean
UpgradeModule.unit_enable_upgrade = function(unit_name_or_table, upgrade_name, is_enable)
    LoggerModule.debug("UpgradeModule.unit_enable_upgrade", "start")
    if type(unit_name_or_table) ~= "string" and type(unit_name_or_table) ~= "table" then
        LoggerModule.error("UpgradeModule.unit_enable_upgrade", "unit_name_or_table must be a string or table")
    end
    if type(upgrade_name) ~= "string" then
        LoggerModule.error("UpgradeModule.unit_enable_upgrade", "upgrade_name must be a string")
    end
    if is_enable then
        ExecuteAction("NAMED_RECEIVE_UPGRADE", upgrade_name, unit_name_or_table)
    else
        ExecuteAction("NAMED_REMOVE_UPGRADE", upgrade_name, unit_name_or_table)
    end
    LoggerModule.debug("UpgradeModule.unit_enable_upgrade", "end")
end

-- TODO: test, package
--- 单位是否有升级 [138]
--- @param unit_name_or_table string|SystemUnitTable
--- @param upgrade_name UpgradeEnum
UpgradeModule.unit_has_upgrade = function(unit_name_or_table, upgrade_name)
    LoggerModule.debug("UpgradeModule.unit_has_upgrade", "start")
       if type(unit_name_or_table) ~= "string" and type(unit_name_or_table) ~= "table" then
        LoggerModule.error("UpgradeModule.unit_has_upgrade", "unitName must be a string or table")
    end
    if type(upgrade_name) ~= "string" then
        LoggerModule.error("UpgradeModule.unit_has_upgrade", "upgradeName must be a string")
    end
    local ret = EvaluateCondition("UNIT_HAS_UPGRADE", unit_name_or_table, upgrade_name)

    LoggerModule.debug("UpgradeModule.unit_has_upgrade", "end ret:"..tostring(ret))
    return ret
end