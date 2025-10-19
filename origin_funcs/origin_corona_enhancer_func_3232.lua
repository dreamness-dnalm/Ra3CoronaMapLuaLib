-- TODO: test
-- 在指定地点显示任意内容的漂浮文字
--- @param text string 文字内容
--- @param x number 位置x
--- @param y number 位置y
--- @param z number 位置z
--- @param color number 颜色十进制
function exShowTextAtPos(text, x, y, z, color) end

-- TODO: test
-- 在指定地点显示任意内容的漂浮文字
-- 玩家特化版本
--- @param player_name string 玩家名字
--- @param text string 文字内容
--- @param x number 位置x
--- @param y number 位置y
--- @param z number 位置z
--- @param color number 颜色十进制
function exShowTextAtPosForPlayer(player_name, text, x, y, z, color) end

-- TODO: test
-- 获取玩家指定编号的队伍  index范围0~9
--- @param player_name string 玩家名字
--- @param index number 队伍编号
--- @return table 编队成员
--- @return number 编队成员数量
function exPlayerGetFormationTeam(player_name, index) end


-- TODO: test
-- 获取指定队伍的成员
--- @param team_name string 队伍名字
--- @return table 成员列表
--- @return number 成员数量
function exTeamGetMembers(team_name) end


-- TODO: test
-- 获取指定物体指定技能的剩余冷却时间
--- @param object_id number 物体id
--- @param special_power_name string 技能名
--- @return number 剩余冷却时间
function exObjectGetSpecialCountDownFrame(object_id, special_power_name) end


-- TODO: test, package
-- 开启或关闭监听玩家获取协议事件
--- @param enable number 是否开启 0关闭 1开启
function exTogglePlayerGetTechEvent(enable) end

-- TODO: test, package
-- 然后定义一个固定名字的函数
-- function onPlayerGetTechEvent(player_name, tech_instance_id)
-- -- 具体逻辑
-- end 

-- TODO: test
--- 监听玩家某个升级完成的事件
--- @param upgrade_name string 升级名
function exRegisterUpgradeCompleteEvent(upgrade_name) end

-- TODO: test
-- 然后定义一个固定名字的函数
-- function onPlayerUpgradeCompleteEvent(player_name, upgrade_instance_id, object_id)
-- -- object_id是完成这个升级的物体的id，比如某个盟军基地完成了中级许可
-- -- 具体逻辑
-- end
        