-- TODO: test, package, feature
-- 在指定地点显示任意内容的漂浮文字
--- @param text string 文字内容
--- @param x number 位置x
--- @param y number 位置y
--- @param z number 位置z
--- @param color number 颜色十进制
function exShowTextAtPos(text, x, y, z, color) end

-- TODO: test, package, feature
-- 获取玩家指定编号的队伍  index范围0~9
--- @param player_name string 玩家名字
--- @param index number 队伍编号
--- @return number 队伍编号
function exPlayerGetFormationTeam(player_name, index) end

-- TODO: test, package, feature
-- 获取指定物体指定技能的剩余冷却时间
--- @param object_id number 物体id
--- @param special_power_name string 技能名
--- @return number 剩余冷却时间
function exObjectGetSpecialCountDownFrame(object_id, special_power_name) end



-- TODO: test, package, feature
--- 创建自定义attrbuteModifier
--- @param type_value number 类型
--- @param stack_limit number 最大叠加层数
--- @return number 自定义attrbuteModifier id
function exAttributeModifierCreate(type_value, stack_limit) end
-- type 类型 整数
-- value 值
-- stackLimit 最大叠加层数
-- 类型有这些 (写后面的数字)
  --AttributeType_ARMOR = 1,
  --AttributeType_DAMAGE_ADD = 2,
  --AttributeType_DAMAGE_MULT = 3,
  --AttributeType_RESIST_FEAR = 4,
  --AttributeType_RESIST_TERROR = 5,
  --AttributeType_EXPERIENCE = 6,
  --AttributeType_RANGE = 7,
  --AttributeType_SPEED = 8,
  --AttributeType_CRUSH_DECELERATE = 9,
  --AttributeType_RESIST_KNOCKBACK = 10,
  --AttributeType_SPELL_DAMAGE = 11,
  --AttributeType_RECHARGE_TIME = 12,
  --AttributeType_PRODUCTION = 13,
  --AttributeType_PRODUCTION_COST = 14,
  --AttributeType_HEALTH = 15,
  --AttributeType_HEALTH_MULT = 16,
  --AttributeType_VISION = 17,
  --AttributeType_BOUNTY_PERCENTAGE = 18,
  --AttributeType_MIN_CRUSH_VELOCITY_PERCENTAGE = 19,
  --AttributeType_AUTO_HEAL = 20,
  --AttributeType_SHROUD_CLEARING = 21,
  --AttributeType_RATE_OF_FIRE = 22,
  --AttributeType_DAMAGE_STRUCTURE_BOUNTY_ADD = 23,
  --AttributeType_CRUSHER_LEVEL = 24,
  --AttributeType_COMMAND_POINT_BONUS = 25,
  --AttributeType_CRUSHABLE_LEVEL = 26,
  --AttributeType_CRUSHED_DECELERATE = 27,
  --AttributeType_INVULNERABLE = 28,
  --AttributeType_SUPPRESSABILITY = 29,
  --AttributeType_RESIST_EMP = 30,
  --AttributeType_POWER_BOOST = 31,
  --AttributeType_AREA_OF_EFFECT = 32,
  --AttributeType_COLLISION_GEOMETRY_SIZE_MULT = 33,
  --AttributeType_BROADCAST_RANGE = 34,

-- TODO: test, package, feature
-- 使用自定义attrbuteModifier
--- @param object_id number 物体id
--- @param attr_id number 自定义attrbuteModifier id
--- @param time number 持续时间
function exAttributeModifierUse(object_id, attr_id, time) end

-- TODO: test, package, feature
-- 开启或关闭监听玩家获取协议事件
--- @param enable number 是否开启 0关闭 1开启
function exTogglePlayerGetTechEvent(enable) end

-- TODO: test, package, feature
-- 然后定义一个固定名字的函数
-- function onPlayerGetTechEvent(player_name, tech_instance_id)
-- -- 具体逻辑
-- end

-- TODO: test, package, feature
--- 监听玩家某个升级完成的事件
--- @param upgrade_name string 升级名
function exRegisterUpgradeCompleteEvent(upgrade_name) end

-- TODO: test, package, feature
-- 然后定义一个固定名字的函数
-- function onPlayerUpgradeCompleteEvent(player_name, upgrade_instance_id, object_id)
-- -- object_id是完成这个升级的物体的id，比如某个盟军基地完成了中级许可
-- -- 具体逻辑
-- end
