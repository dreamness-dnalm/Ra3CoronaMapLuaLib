
--- 获取物体instanceId   每种物体都有自己唯一的instanceId
--- @param object_id number
function exObjectGetInstanceId(object_id) end

-- TODO: test
--- 获取经济作弊倍数
--- @return number
function exModeGetCheatMultiplier() end

-- TODO: test
--- 根据脚本名字获取玩家昵称  返回的是字符串
--- @param player_name string
--- @return string
function exGetPlayerNickNameByScriptName(player_name) end


--- 修改Waypoint点的坐标位置  坐标都需要是整数
--- @param waypoint_name string
--- @param x number
--- @param y number
--- @param z number
function exWaypointSetPos(waypoint_name, x, y, z) end

-- TODO: test
--- 注册某种单位死亡事件   name是单位种类名字
--- @param thing ThingEnum
function exObjectRegisterDieEvent(thing) end
--然后定义一个固定名字的函数
-- function onUnitDieEvent(dyingObjId, attackerId, dyingObjInstanceId, attackerInstanceId, ownerPlayerName)
--     -- dyingObjId 即将死亡的物体id
--     -- attackedId 攻击者id 注意不一定有攻击者，这时这个参数是nil
--     -- dyingObjInstanceId 死亡物体的InstanceId  (每种单位都有唯一的InstanceId)
--     -- attackerInstanceId 攻击者的InstanceId  注意不一定有攻击者，这时这个参数是nil
--     -- ownerPlayerName 单位所属玩家
-- end


--- 给GenericRankTech（玩家协议面板不能一开始就点完所有科技就是因为有这个东西，开局给level=1de1,每隔一段时间给下一个level，最多到10，
--- level取值2~10, 如果给2，并且协议点数给2，一开始就能点到第二行协议，如果给10，那么就能点完所有协议
--- @param player_name string
--- @param level number
function exUnlockPlayerGenericRankTech(player_name, level) end


--- 获取ai经济作弊倍数   注意：1.0表示不指定（而非1倍）
--- @return number
function exModeGetAICheatMultiplier() end


-- 计分板相关  计分版有7行3列  标题和文字都支持昵称，$p1Name，$p2Name，$p3Name，$p4Name，$p5Name，$p6Name将被自动替换为对应的玩家昵称（对应Player_1~Player_6的昵称）
--- 设置计分板可进行, visible  1可见，0不可见
--- @param visible number
function exScoreBoardSetVisibility(visible) end


--- 设置记分板标题文字
--- @param title string
function exScoreBoardSetTitle(title) end

-- 设置记分板某行某列的文字
-- row 行  范围1~7
-- col 列  范围1~3
--- @param text string
--- @param row number
--- @param col number
function exScoreBoardSetText(text, row, col) end

-- 玩家特化版本
--- 设置计分板可进行, visible  1可见，0不可见
--- @param player_name string
--- @param visible number
function exScoreBoardSetVisibilityForPlayer(player_name, visible) end

--- 设置记分板标题文字
--- @param player_name string
--- @param title string
function exScoreBoardSetTitleForPlayer(player_name, title) end

--- 设置记分板某行某列的文字
--- @param player_name string
--- @param text string
--- @param row number
--- @param col number
function exScoreBoardSetTextForPlayer(player_name, text, row, col) end

--- 设置公屏文字的颜色(是整个公屏文字的颜色)
--- @param color number
function exSetPublicBoardColor(color) end

--- 获取玩家颜色
--- @param player_name string 玩家名字
--- @return table 长度为3, 分别是rgb的十进制数
function exPlayerGetColor(player_name) end