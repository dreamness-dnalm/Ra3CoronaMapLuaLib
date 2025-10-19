--- upgradeModule.lua
--- Created by dreamness
--- DateTime: 12/15/2024 03:50 PM

--- 升级模块
UpgradeModule = {}

--- 玩家是否拥有某升级 [53]
--- @param player_name string
--- @param upgrade_name UpgradeEnum
--- @return boolean
UpgradeModule.has_upgrade = function(player_name, upgrade_name)
    -- LoggerModule.debug("UpgradeModule.has_upgrade", "start")
    if type(player_name) ~= "string" then
        LoggerModule.error("UpgradeModule.has_upgrade", "player_name must be a string")
        return nil
    end
    if type(upgrade_name) ~= "string" then
        LoggerModule.error("UpgradeModule.has_upgrade", "player_name must be a string")
        return nil
    end
    ret = EvaluateCondition("PLAYER_BUILT_UPGRADE", player_name, upgrade_name)
    -- LoggerModule.debug("UpgradeModule.has_upgrade", "end")
    return ret
end

--- 允许/禁止玩家升级 (535)
--- @param player_name PlayerEnum
--- @param upgrade_name UpgradeEnum
--- @param is_allow boolean
UpgradeModule.allow_upgrade = function(player_name, upgrade_name, is_allow)
    if type(player_name) ~= "string" then
        LoggerModule.error("UpgradeModule.allow_upgrade", "player_name must be a string")
    end
    if type(upgrade_name) ~= "string" then
        LoggerModule.error("UpgradeModule.allow_upgrade", "upgrade_name must be a string")
    end
    ExecuteAction("ALLOW_DISALLOW_ONE_UPGRADE", player_name, upgrade_name, GameModule.to_ra3_boolean(is_allow))
end

--- 给予/剥夺 玩家某升级 (314) / (504) 用途暂时不明
--- @param player_name string
--- @param upgrade_name UpgradeEnum
--- @param is_enable boolean
UpgradeModule.enable_upgrade = function(player_name, upgrade_name, is_enable)
    -- LoggerModule.debug("UpgradeModule.enable_upgrade", "start")
    if type(player_name) ~= "string" then
        LoggerModule.error("UpgradeModule.enable_upgrade", "player_name must be a string")
    end
    if type(upgrade_name) ~= "string" then
        LoggerModule.error("UpgradeModule.enable_upgrade", "upgrade_name must be a string")
    end
    if is_enable then
        ExecuteAction("GIVE_PLAYER_UPGRADE", player_name, upgrade_name)
    else
        ExecuteAction("REMOVE_PLAYER_UPGRADE", player_name, upgrade_name)
    end
    -- LoggerModule.debug("UpgradeModule.enable_upgrade", "end")
end

--- 给单位升级  (201) (502)
--- @param unit_name_or_table string | SystemUnitTable
--- @param upgrade_name UpgradeEnum
--- @param is_enable boolean
UpgradeModule.unit_enable_upgrade = function(unit_name_or_table, upgrade_name, is_enable)
    -- LoggerModule.debug("UpgradeModule.unit_enable_upgrade", "start")
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
    -- LoggerModule.debug("UpgradeModule.unit_enable_upgrade", "end")
end

--- 单位是否有升级 [138]
--- @param unit_name_or_table string|SystemUnitTable
--- @param upgrade_name UpgradeEnum
UpgradeModule.unit_has_upgrade = function(unit_name_or_table, upgrade_name)
    -- LoggerModule.debug("UpgradeModule.unit_has_upgrade", "start")
       if type(unit_name_or_table) ~= "string" and type(unit_name_or_table) ~= "table" then
        LoggerModule.error("UpgradeModule.unit_has_upgrade", "unitName must be a string or table")
    end
    if type(upgrade_name) ~= "string" then
        LoggerModule.error("UpgradeModule.unit_has_upgrade", "upgradeName must be a string")
    end
    return GameModule.from_ra3_boolean(EvaluateCondition("UNIT_HAS_UPGRADE", unit_name_or_table, upgrade_name))
end


-- TODO: test, package, doc
--- 开启监听玩家某个升级完成的事件
--- @param upgrade_name string 升级名
UpgradeModule.enable_upgrade_complete_event = function(upgrade_name)
    if type(upgrade_name) ~= "string" then
        LoggerModule.error("UpgradeModule.enable_upgrade_complete_event", "upgrade_name must be a string")
    end
    exRegisterUpgradeCompleteEvent(upgrade_name)
end

-- TODO: test, package, doc
--- 注册玩家某个升级完成的事件回调
--- @param callback_func function 回调函数(player_name, upgrade_instance_id, object_id)
UpgradeModule.register_upgrade_complete_callback = function(callback_func)
    if type(callback_func) ~= "function" then
        LoggerModule.error("UpgradeModule.register_upgrade_complete_callback", "callback_func must be a function")
    end
    globals().onPlayerUpgradeCompleteEvent = callback_func
end

