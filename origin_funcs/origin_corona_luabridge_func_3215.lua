--- origin_corona_luabridge_func_3215.lua
--- Created by dreamness
--- DateTime: 8/9/2024 9:35 PM
---

-- 本文件中包含了日冕mod在3.215版本中, 于LuaBridge.dll内新增的函数

--- 获取单位所属玩家的"地编脚本名称", 如Player_1, 不能在第一帧调用!
--- @param unit_table_or_player_string table|string unit_table / "Player_1" / "<This Player>" / "<1st Human Player>" / "<1st Human Player's Enemies>"(第一个敌人)
--- @return string 如Player_1
function ObjectPlayerScriptName(unit_table_or_player_string)  end


-- TODO: test, package
--- 16进制字符串转换为无符号整数
--- @param hex string 16进制字符串
--- @return number 无符号整数
function HexToUInt32(hex) end


--- 计算字符串哈希值
--- @param content string 字符串
--- @return number 哈希值
function FastHash(content)  end

--- 创建一个对象过滤器
--- @param filter_config_table table 过滤器配置表
--- @return SystemFilter 过滤器
function CreateObjectFilter(filter_config_table)  end

--- 测试目标单位是否满足过滤器
--- @param unit_table table 单位
--- @param relation_reference_unit_table table 参考单位
--- @param filter SystemFilter 过滤器 {Rule(string), Relationship(string), Include(string), StatusBitFlagsExclude(string), IncludeThing(table), ExcludeThing(table)}
--- @return boolean 是否满足过滤器
function ObjectTestTargetObjectWithFilter(unit_table, relation_reference_unit_table, filter)  end

--- 获取单位的位置
--- @param unit_table table 单位
--- @return number, number, number x, y, z
function ObjectGetPosition(unit_table) end

---找到某个区域内所有符合 ObjectFilter 的单位（无论单位是否有 Lua 模块都能被找到）
--- @param unit_table table 单位, 可为nil
--- @param find_area_table table 区域, 可为nil, {X=x, Y=y, Z=z, Radius=1000, DistType="CENTER_2D"/"EXTENTS_3D"}
--- @param filter SystemFilter 过滤器, 可为nil
--- @return table, number 单位集合, 单位数量
function ObjectFindObjects(unit_table, find_area_table, filter)  end

-- TODO: test
--- 设置单位的位置
--- @param unit_table table 单位
--- @param x number x
--- @param y number y
--- @param z number z
function ObjectSetPosition(unit_table, x, y, z) end

-- TODO: test
--- 获取单位间的距离(2D)
--- @param unit_table1 table 单位1
--- @param unit_table_2 table 单位2
--- @return number 距离
function ObjectsDistance2D(unit_table1, unit_table_2)  end

-- TODO: test
--- 获取单位间的距离(3D)
--- @param unit_table1 table 单位1
--- @param unit_table_2 table 单位2
--- @return number 距离
function ObjectsDistance3D(unit_table1, unit_table_2)  end

--- 获取单位详细信息
--- @param unit_table table 单位
--- @return table 单位详细信息, 坐标, 旋转, 缩放等 ;
---x, y, z = matrix[4], matrix[8], matrix[12] ;
---direction = { X=matrix[1], Y=matrix[5], Z=matrix[9] };
---angle = atan2(direction2D.Y, direction2D.X)
function ObjectGetTransform(unit_table)  end

--- 设置单位的详细信息
--- @param unit_table table 单位
--- @param matrix table 单位详细信息, 坐标, 旋转, 缩放等 ;
function ObjectSetTransform(unit_table, matrix) end

--- 获取单位的唯一ID
--- @param unit_table table 单位
--- @return number 唯一ID
function ObjectGetId(unit_table)  end

-- TODO: test
--- 获取单位的当前生命值
--- @param unit_table table 单位
--- @return number 当前生命值
function ObjectGetCurrentHealth(unit_table)  end

-- TODO: test
--- 获取单位的初始生命值, 假如单位不存在或者单位没有 ActiveBody 模块，会返回 nil
--- @param unit_table table 单位
--- @return number 初始生命值
function ObjectGetInitialHealth(unit_table)  end

-- TODO: test, package
--- 获取矿脉的初始数量
--- @param unit_table table 需要是一个有 OreNodeBody 模块的单位（例如矿脉）
--- @return number 数量
function ObjectGetInitialOreAmount(unit_table) end

-- TODO: test, package
--- 获取矿脉已经被开采了多少矿石
--- @param unit_table table 需要是一个有 OreNodeBody 模块的单位（例如矿脉）
--- @return number 数量
function ObjectGetGatheredOreAmount(unit_table) end

-- TODO: test, package
--- 设置矿脉已经被开采了多少矿石, 不会重新触发“矿脉已枯竭”的 EVA 播报, 否则需要调用 ObjectResetOreNodeBehaviorEvaState(unit_table);ObjectSetGatheredOreAmount(self, maxOreAmount) 会让矿脉干枯; ObjectSetGatheredOreAmount(self, 0) 会让矿脉恢复到初始状态
--- @param unit_table table 需要是一个有 OreNodeBody 模块的单位（例如矿脉）
function ObjectSetGatheredOreAmount(unit_table, amount) end

-- TODO: test, package
-- todo package
-- todo test
--- 重置矿脉的 EVA 播报状态
--- @param unit_table table 需要是一个有 OreNodeBody 模块的单位（例如矿脉）
function ObjectResetOreNodeBehaviorEvaState(unit_table) end

-- TODO: test, package
--- 获取单位所属玩家的建造面板的下一组序号, 这个 indices 包含所有建造类型（参见 xsd 里的 ProductionQueueType）
--- @param unit_table table 单位
--- @return table 下一组序号（参见 xsd 里的 ProductionQueueType）
function ObjectGetBuildPagesNextIndices(unit_table) end


-- TODO: test, package
--- 设置单位所属玩家的建造面板的下一组序号, 这个 indices 包含所有建造类型（参见 xsd 里的 ProductionQueueType）
--- @param unit_table table 单位
--- @param indices table 下一组序号（参见 xsd 里的 ProductionQueueType）
function ObjectSetBuildPagesNextIndices(unit_table, indices) end

-- TODO: test, package
--- 修改渲染脚本参数
--- @param script_name string 渲染脚本名
--- @param attr_name string 属性名
--- @param attr_value boolean 属性值
function ScrapeSetBool(script_name, attr_name, attr_value)  end

-- TODO: test, package
--- 修改渲染脚本参数
--- @param script_name string 渲染脚本名
--- @param attr_name string 属性名
--- @param attr_value number 属性值
function ScrapeSetFloat(script_name, attr_name, attr_value)  end

-- TODO: test, package
--- 调用 Apt 的 ActionScript 函数。
--- 必须启用配置文件里 RA3AptPlugin 的 customData 里的 newMode 选项， 才能使用这个函数。
--- @param movieClipName string MovieClip 的名字
--- @param functionName string 函数名
--- @param ... any 函数的参数
function InvokeAptFunction(movieClipName, functionName, ...) end

--- 检测两个单位的 table 是否是同一个单位; 不能用==来判断
--- @param unit_table1 table 单位1
--- @param unit_table2 table 单位2
function ObjectsIsSame(unit_table1, unit_table2) end

--- 根据数字 ID 获取一个单位的 table, 假如这个单位不存在，会返回 nil
--- @param objectId number 单位的数字 ID
--- @return table 单位的 table
function GetObjectById(objectId) end

--- 根据单位的命名获取一个单位的 table, 假如这个单位不存在，会返回 nil
--- @param objectName string 单位的命名
--- @return table 单位的 table
function GetObjectByScriptName(object_name) end

-- TODO: test, package
--- 返回贴在当前单位身上贴着的单位的列表。例如，假如 self 是矿车，那么可能返回包含蜻蜓以及信标、钱套子之类的列表
--- @param unit_table table 单位
--- @return table, number 贴在当前单位身上的单位的列表, 单位数量
function ObjectGetAttachers(unit_table)  end


-- TODO: test, package
--- 返回贴在当前单位正在贴的单位。例如，假如 self 是蜻蜓，那么可能返回包含矿车的列表。一般来说这个列表只会有 0 个或者 1 个单位，除非 self 有多个 AttachUpdate 模块
--- @param unit_table table 单位
--- @return table, number 贴在当前单位身上的单位的列表, 单位数量
function ObjectGetAttachees(unit_table)  end

-- TODO: test
--- 返回包含当前单位的单位。例如，假如 self 是子炮台，那么可能返回大船。假如 self 是标枪兵，那么可能返回车。
--- @param unit_table table 单位
--- @return table 包含当前单位的单位
function ObjectGetContainerObject(unit_table)  end

-- TODO: test
--- 返回当前单位包含的乘客列表。例如，假如 self 是屎车，那么可能返回包含标枪兵的列表
--- @param unit_table table 单位
--- @return table, number 包含当前单位的单位的列表, 单位数量
function ObjectGetContainedPassengers(unit_table)  end

--- 获取建造序列信息
--- 返回值table={production1...productionN}; production={Id (数字序号), ModuleId (XML 里模块 ID 的哈希值)(FastHash("ModuleTag_ProductionUpdate")), QueueLength, Queue};
--- Queue={item1...itemN}; item={Type ("Object" 或者 "Upgrade"), InstanceId (正在建造的单位或者升级的哈希值)(FastHash("AlliedConstructionYard")), ProductionPercentage(0-100), ProductionFrames, BuildCost}
--- @param unit_table table 单位
--- @return table, number 建造序列列表, 建造序列数量
function ObjectGetProductionQueues(unit_table)  end

--- 获取单位所属的玩家的威胁度信息（左下角威胁指示器那个）
--- @param unit_table_or_player_string table|string table单位 或 玩家字符串 "<This Player>" / "<1st Human Player>" / "<1st Human Player's Enemies>"(第一个敌人)
--- @return number 威胁度
function ObjectGetRedAlertCurrentThreatLevel(unit_table_or_player_string)  end

--- 设置单位所属的玩家的威胁度信息（左下角威胁指示器那个）
--- @param unit_table_or_player_string table|string table单位 或 玩家字符串 "<This Player>" / "<1st Human Player>" / "<1st Human Player's Enemies>"(第一个敌人)
--- @param threat number 威胁度
function ObjectSetRedAlertCurrentThreatLevel(unit_table_or_player_string, threat)  end

-- TODO: test
--- 获取单位在前一帧的坐标（便于计算速度） (每秒15帧);
--- 请在做除法之前进行判断，避免除以 0;
--- px, py, pz = ObjectGetPreviousPosition(self);
--- x, y, z = ObjectGetPosition(self);
--- dx, dy, dz = x - px, y - py, z - pz;
--- distance = sqrt(dx * dx + dy * dy + dz * dz);
--- speed = distance / 15 -- 15 帧每秒
--- @param unit_table table 单位
--- @return number, number, number x, y, z
function ObjectGetPreviousPosition(unit_table)  end

-- TODO: test, package
--- 引爆抛射体, 假如 unit_table 是一个抛射体，那么这个函数会让这个抛射体爆炸，并且造成伤害
--- @param unit_table table 单位
--- @param target_unit_table table 目标单位; 假如没有特别指定的目标单位，那么必须传入 nil
function ObjectDetonateProjectile(unit_table, target_unit_table) end

--- 向任意目标发射任意武器
--- @param unit_table table 单位
--- @param weapon_name string 武器名
--- @param target_position table 目标位置 {X=x, Y=y, Z=z}
--- @param target_unit_table table 目标单位; 假如没有特别指定的目标单位，那么必须传入 nil
function ObjectCreateAndFireTempWeaponToTarget(unit_table, weapon_name, target_position, target_unit_table) end

-- TODO: test, package
--- 获取单位目标, 假如没有目标，会返回 nil
--- @param unit_table table 单位
--- @return table 目标单位, 假如没有目标，会返回 nil
function ObjectFindTarget(unit_table) end

-- TODO: test, package
--- 获取单位的建造者（生产者）;
--- 例如可以通过矿车找到矿场，或者通过小飞机找到航母;
--- 假如单位没有建造者，或者建造者已经不存在于地图上，会返回 nil;
--- @param unit_table table 单位
--- @return table 建造者单位, 假如没有建造者，会返回 nil
function ObjectGetProducerObject(unit_table) end

-- TODO: test, package
--- 获取单位造价
--- 这个就会直接返回 1000（而不是单位原来的造价）， 除非有特殊的 buff, ObjectGetValue(self, producer, 1000)
--- @param unit_table table 单位
--- @param producer table 生产建筑，可以获取该单位在该建筑里的造价
--- @param cost number 自定义价格，可以根据玩家以及生产建筑的各种 buff 来计算造价
--- @return number 造价
function ObjectGetValue(unit_table, producer, cost) end

-- TODO: test, package
--- 获取单位造价
--- @param unit_table table 单位
--- @param producer table 生产建筑，可以获取该单位在该建筑里的造价
--- @return number 造价
function ObjectGetValue(unit_table, producer) end

-- TODO: test, package
--- 获取单位造价
--- @param unit_table table 单位
--- @return number 造价
function ObjectGetValue(unit_table) end

-- TODO: test, package
--- 获取玩家所有单位的造价
--- @param unit_table_or_player_string table|string 单位table 或 玩家字符串 "<This Player>" / "<1st Human Player>" / "<1st Human Player's Enemies>"(复数的会把所有敌人的造价加起来)
--- @return number 造价
function GetPlayerAllUnitsValue(unit_table_or_player_string) end

-- TODO: test, package
--- 检测单位是否属于某个阵营的某种类型,根据玩家以及 RegisteredObjectSetId 来判断(参考相关文件)
--- @param unit_table table 单位
--- @param registered_object_set_id string RegisteredObjectSetId 类型
--- @param unit_table_or_player_string table|string 阵营方 单位table 或 玩家字符串 "<This Player>" / "<1st Human Player>" / "<1st Human Player's Enemies>"(第一个敌人)
--- @return boolean 是否属于某种类型
function ObjectIsInPlayerRegisteredObjectSet(unit_table, registered_object_set_id, unit_table_or_player_string) end

-- TODO: test, package
--- 检测单位是否属于所属阵营的某种类型,根据玩家以及 RegisteredObjectSetId 来判断(参考相关文件)
--- @param unit_table table 单位
--- @param registered_object_set_id string RegisteredObjectSetId 类型
--- @return boolean 是否属于某种类型
function ObjectIsInPlayerRegisteredObjectSet(unit_table, registered_object_set_id) end

-- TODO: test, package
--- 检测单位是否属于某种类型,根据玩家以及 RegisteredObjectSetId 来判断(参考相关文件)
--- @param unit_table table 单位
--- @param registered_object_set_id string RegisteredObjectSetId 类型
--- @return boolean 是否属于某种类型
function ObjectIsInGlobalRegisteredObjectSet(unit_table, registered_object_set_id) end

-- TODO: test, package
--- 获取玩家所有某一类型的单位,根据玩家以及 RegisteredObjectSetId 来判断
--- @param registered_object_set_id string RegisteredObjectSetId 类型
--- @return table, number 单位集合, 单位数量
function CopyGlobalRegisteredObjectSet(registered_object_set_id) end

-- TODO: test, package
--- 获取某一阵营的所有某一类型的单位
--- @param unit_table_or_player_string table|string 阵营方 单位table 或 玩家字符串 "<This Player>" / "<1st Human Player>" / "<1st Human Player's Enemies>"(第一个敌人)
--- @param registered_object_set_id string RegisteredObjectSetId 类型
--- @return table, number 单位集合, 单位数量
function CopyPlayerRegisteredObjectSet(unit_table_or_player_string, registered_object_set_id) end

-- TODO: test
--- 获取单位武器的弹药量
--- @param unit_table table 单位
--- @param weapon_slot_id number 武器槽 ID
--- @param weapon_ordering number 武器排序
--- @param weapon_index number 武器序号
--- @return number 弹药量
function ObjectGetWeaponSetUpdateWeaponCurrentAmmoCount(unit_table, weapon_slot_id, weapon_ordering, weapon_index) end

-- TODO: test
--- 设置单位武器的弹药量
--- @param unit_table table 单位
--- @param weapon_slot_id number 武器槽 ID
--- @param weapon_ordering number 武器排序
--- @param weapon_index number 武器序号
--- @param ammo_count number 弹药量
function ObjectSetWeaponSetUpdateWeaponCurrentAmmoCount(unit_table, weapon_slot_id, weapon_ordering, weapon_index, ammo_count) end

-- TODO: test, package
--- 获取单位武器的当前 WeaponLaunchBone 序号
--- @param unit_table table 单位
--- @param weapon_slot_id number 武器槽 ID
--- @param weapon_ordering number 武器排序
--- @param weapon_index number 武器序号
--- @return number WeaponLaunchBone 序号
function ObjectGetWeaponSetUpdateWeaponCurrentWeaponLaunchBoneIndex(unit_table, weapon_slot_id, weapon_ordering, weapon_index) end

-- TODO: test, package
--- 检测单位是否处于瘫痪状态
--- @param unit_table table 单位
--- @return boolean 是否瘫痪
function ObjectIsDisabled(unit_table) end

-- TODO: test, package
--- 检测单位是否处于某些特定的瘫痪状态
--- @param unit_table table 单位
--- @param status string|number 状态字符串(空格分隔) 或 状态数字 停电（UNDERPOWERED）、断电（EMP）、狙白（UNMANNED）、蜘蛛（HELD）
--- @return boolean 是否瘫痪
function ObjectIsDisabled(unit_table, status) end

-- TODO: test, package
--- 将瘫痪状态字符串转换成数字, 填多个状态用空格隔开, 可以在某些情况下提高性能
--- @param status string 状态字符串, 如 "EMP UNDERPOWERED UNMANNED"
--- @return number 状态数字
function ParseDisabledBitFlags(status) end

--- 检测单位是否存活;
--- 和 EvaluateCondition("NAMED_NOT_DESTROYED", self) 是等价的, 但更快;
--- @param unit_table table 单位
--- @return boolean 是否存活, 1 存活, nil 死亡
function ObjectIsAlive(unit_table) end

--- 为单位加载buff/debuff
--- @param unit_table table 单位
--- @param attribute_modifier_name string buff/debuff 名称
--- @param frameCnt number 持续帧数
function ObjectLoadAttributeModifier(unit_table, attribute_modifier_name, frameCnt) end

--- 为单位加载buff/debuff, 持续时间默认为 XML 里定义的时间
--- @param unit_table table 单位
--- @param attribute_modifier_name string buff/debuff 名称
function ObjectLoadAttributeModifier(unit_table, attribute_modifier_name) end

--- 移除单位的buff/debuff
--- @param unit_table table 单位
--- @param attribute_modifier_name string buff/debuff 名称
function ObjectUnloadAttributeModifier(unit_table, attribute_modifier_name) end

-- TODO: test, package
--- 查询某个属性及加成
--- @param unit_table table 单位
--- @param attribute_name string 属性名称
--- @return number 属性值, 无加成会返回 1。假如有 20% 的加成，会返回 1.2。假如出现错误会返回 nil
function ObjectGetAttributeModifier(unit_table, attribute_name) end

-- TODO: test, package
--- 查询某个属性及加成, 反复查询 AttributeModifier 可能比较消耗性能, 因此可以提前获取 AttributeModifier 对象，然后反复使用。
--- @param unit_table table 单位
--- @param attribute_name string 属性名称
--- @param ignore_attribute_modifier_table table 忽略的 buff/debuff属性名称 或 对象
--- @return number 属性值, 无加成会返回 1。假如有 20% 的加成，会返回 1.2。假如出现错误会返回 nil
function ObjectGetAttributeModifier(unit_table, attribute_name, ignore_attribute_modifier_table) end

-- TODO: test, package
--- 获取AttributeModifier对象
--- @param attribute_modifier_name string AttributeModifier 名称
--- @return AttributeModifier AttributeModifier
function FindAttributeModifier(attribute_modifier_name) end

