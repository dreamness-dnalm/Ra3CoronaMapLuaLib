

WinAndFailedHelper = {}

--- @class KillPlayerMethodEnum
KillPlayerMethodEnum = {
    KILL_PLAYER_EVERYTHING = "kill_player_everything",
    SELL_PLAYER_EVERYTHING = "sell_player_everything",
}


-- TODO: test
--- 杀死玩家
--- @param player_name PlayerEnum 玩家名称
--- @param kill_player_method KillPlayerMethodEnum | nil 杀死玩家的方法, 默认杀死玩家所有单位
function WinAndFailedHelper.kill_player(player_name, kill_player_method)
    if type(player_name) ~= "string" then
        LoggerModule.error("WinAndFailedHelper.kill_player", "player_name must be a string")
        return
    end

    if kill_player_method ~= nil and type(kill_player_method) ~= "string" then
        LoggerModule.error("WinAndFailedHelper.kill_player", "kill_player_method must be a string or nil")
        return
    end

    if kill_player_method == nil or kill_player_method == KillPlayerMethodEnum.KILL_PLAYER_EVERYTHING then
        -- 杀死玩家所有单位
        PlayerModule.kill_player_everything(player_name)
    elseif kill_player_method == KillPlayerMethodEnum.SELL_PLAYER_EVERYTHING then
        -- 卖掉玩家所有建筑
        PlayerModule.sell_player_everything(player_name)
    end
end


