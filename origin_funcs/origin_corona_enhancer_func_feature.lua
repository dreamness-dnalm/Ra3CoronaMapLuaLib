-- 自定义文本相关

-- TODO: test, package
--- 创建自定义文本
--- @param config table 配置表, 参数有: Index, Content, X, Y, Color, Size, align_x, align_y
function exCreateCustomText(config) end

-- TODO: test, package
--- 更新自定义文本文本
--- @param index number 文本索引
--- @param content string 文本内容
function exCustomTextUpdateText(index, content) end


-- TODO: test, package
--- 更新自定义文本位置
--- @param index number 文本索引
--- @param x number 位置x
--- @param y number 位置y
--- @param align_x string 对齐方式
--- @param align_y string 对齐方式
function exCustomTextUpdatePos(index, x, y, align_x, align_y) end

-- TODO: test, package
--- 更新自定义文本可见性
--- @param index number 文本索引
--- @param visibility number 可见性, 1是可见, 0是不可见
function exCustomTextUpdateVisibility(index, visibility) end

-- TODO: test, package
--- 创建自定义文本玩家特化版本
--- @param player_name string 玩家名字
--- @param config table 配置表, 参数有: Index, Content, X, Y, Color, Size, AlignX, AlignY
function exCreateCustomTextForPlayer(player_name, config) end

-- TODO: test, package
--- 更新自定义文本文本玩家特化版本
--- @param player_name string 玩家名字
--- @param index number 文本索引
--- @param content string 文本内容
function exCustomTextUpdateTextForPlayer(player_name, index, content) end

-- TODO: test, package
--- 更新自定义文本位置玩家特化版本
--- @param player_name string 玩家名字
--- @param index number 文本索引
--- @param x number 位置x
--- @param y number 位置y
--- @param align_x string 对齐方式
--- @param align_y string 对齐方式
function exCustomTextUpdatePosForPlayer(player_name, index, x, y, align_x, align_y) end

-- TODO: test, package
--- 更新自定义文本可见性玩家特化版本
--- @param player_name string 玩家名字
--- @param index number 文本索引
--- @param visibility number 可见性, 1是可见, 0是不可见
function exCustomTextUpdateVisibilityForPlayer(player_name, index, visibility) end


-- 创建自定义文本
-- size是文本大小
-- exCreateCustomText({
--   Index = 3,
--   Content = "这是测试文字",
--   X = 200,
--   Y = 200,
--   Color = 16711680,
--   Size = 16,
--   AlignX = "left",
--   AlignY = "top",
-- })



-- 玩家特化版本
-- exCreateCustomTextForPlayer("Player_1", {
--   Index = 3,
--   Content = "这是测试文字",
--   X = 200,
--   Y = 200,
--   Color = 16711680,
--   Size = 16,
--   AlignX = "left",
--   AlignY = "top",
-- })

-- TODO: test, package
--- 是否启用了散矿模式
--- @return 0没启用，1启用
function exIsLooseOreEnable() end


-- TODO: test, package
--- 创建新的AttributeModifier (建议在地图一开始都创建好)
--- @param type number 类型 整数
--- @param value number 值 浮点数
--- @param stack_limit number 最大叠加次数 整数 （同一个物体最多只能叠加这个次数的这种AttributeModifier）
function exAttributeModifierCreate(type, value, stack_limit) end


-- TODO: test, package
--- 使用AttributeModifier
--- @param object_id number 物体id
--- @param attr_obj number AttributeModifier对象
function exAttributeModifierUse(object_id, attr_obj) end


-- type 类型 有这些 （传入的是等号后面的整数）
-- AttributeType_ARMOR = 1,
-- AttributeType_DAMAGE_ADD = 2,
-- AttributeType_DAMAGE_MULT = 3,
-- AttributeType_RESIST_FEAR = 4,
-- AttributeType_RESIST_TERROR = 5,
-- AttributeType_EXPERIENCE = 6,
-- AttributeType_RANGE = 7,
-- AttributeType_SPEED = 8,
-- AttributeType_CRUSH_DECELERATE = 9,
-- AttributeType_RESIST_KNOCKBACK = 10,
-- AttributeType_SPELL_DAMAGE = 11,
-- AttributeType_RECHARGE_TIME = 12,
-- AttributeType_PRODUCTION = 13,
-- AttributeType_PRODUCTION_COST = 14,
-- AttributeType_HEALTH = 15,
-- AttributeType_HEALTH_MULT = 16,
-- AttributeType_VISION = 17,
-- AttributeType_BOUNTY_PERCENTAGE = 18,
-- AttributeType_MIN_CRUSH_VELOCITY_PERCENTAGE = 19,
-- AttributeType_AUTO_HEAL = 20,
-- AttributeType_SHROUD_CLEARING = 21,
-- AttributeType_RATE_OF_FIRE = 22,
-- AttributeType_DAMAGE_STRUCTURE_BOUNTY_ADD = 23,
-- AttributeType_CRUSHER_LEVEL = 24,
-- AttributeType_COMMAND_POINT_BONUS = 25,
-- AttributeType_CRUSHABLE_LEVEL = 26,
-- AttributeType_CRUSHED_DECELERATE = 27,
-- AttributeType_INVULNERABLE = 28,
-- AttributeType_SUPPRESSABILITY = 29,
-- AttributeType_RESIST_EMP = 30,
-- AttributeType_POWER_BOOST = 31,
-- AttributeType_AREA_OF_EFFECT = 32,
-- AttributeType_COLLISION_GEOMETRY_SIZE_MULT = 33,
-- AttributeType_BROADCAST_RANGE = 34,



