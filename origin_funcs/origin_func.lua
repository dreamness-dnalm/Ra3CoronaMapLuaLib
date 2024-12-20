--- origin_func.lua
--- Created by dreamness
--- DateTime: 8/9/2024 9:13 PM

--- 本文件中包含了RA3的原始函数

--- 执行条件函数
--- @param func_name string 函数名
--- @param ... any 参数
--- @return boolean
function EvaluateCondition(func_name, ...)  end

--- 执行动作函数
--- @param func_name string 函数名
--- @param ... any 参数
function ExecuteAction(func_name, ...)  end

--- 获取当前帧数
function GetFrame()  end

--- 获取一个伪随机数
--- @return number
function GetRandomNumber()   end

-- TODO: test, package
--- 获取一段字符串描述
--- @param string_table table 字符串table
--- @return string
function ObjectDescription(unit_table) end

-- TODO: test, package
--- 获取单位所属的队伍名
--- @param unit_table table 单位table
--- @return string
function ObjectTeamName(unit_table) end

-- TODO: test, package
--- 测试单位是否满足某个模型状态
--- @param unit_table table 单位table
--- @param model_status string 模型状态
--- @return boolean
function  ObjectTestModuleCondition(unit_table, model_status) end

-- TODO: test, package
--- 设置物体状态
--- @param unit_table table 单位table
--- @param object_status string 物体状态
--- @return boolean
function ObjectSetObjectStatus(unit_table, object_status) end

-- TODO: test, package
--- 使用技能
--- @param unit_table table 单位table
--- @param special_power_name string 技能名
function ObjectDoSpecialPower(unit_table, special_power_name) end

-- TODO: test, package
--- 在单位身上创建并发射一个临时武器
--- @param unit_table table 单位table
--- @param weapon_name string 武器名
function ObjectCreateAndFireTempWeapon(unit_table, weapon_name) end

-- TODO: test, package
--- 测试单位是否拥有某个玩家升级（无法用于检测物体升级，建议使用 EvaluateCondition UNIT_HAS_UPGRADE 来检测物体升级）
--- @param unit_table table 单位table
--- @param upgrade_name string 升级名
--- @return boolean
function ObjectHasUpgrade(unit_table, upgrade_name) end

-- TODO: test, package
--- 给单位添加一个升级
--- @param unit_table table 单位table
--- @param upgrade_name string 升级名
function ObjectGrantUpgrade(unit_table, upgrade_name) end

-- TODO: test, package
--- 给单位移除一个升级
--- @param unit_table table 单位table
--- @param upgrade_name string 升级名
function ObjectRemoveUpgrade(unit_table, upgrade_name) end

-- TODO: test, package
--- 隐藏单位的一个子物体，第三个参数为 false 时则为显示
--- @param unit_table table 单位table
--- @param sub_object_name string 子物体名
--- @param isActive boolean 是否隐藏
function ObjectHideSubObject(unit_table, sub_object_name, is_active) end


-- TODO: test, package
--- 隐藏单位的一个子物体，第三个参数为 false 时则为显示
--- @param unit_table table 单位table
--- @param sub_object_name string 子物体名
--- @param isActive boolean 是否隐藏
function ObjectHideSubObjectPermanently(unit_table, sub_object_name, is_active) end

