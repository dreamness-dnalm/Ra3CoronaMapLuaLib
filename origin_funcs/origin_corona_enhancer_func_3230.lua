--- 获取玩家之间的关系
--- @param player_name1 PlayerEnum 玩家1
--- @param player_name2 PlayerEnum 玩家2
--- @return number 0(Enemy) 1(Neutral) 2(Friend)
function exPlayerGetRelationShip(player_name1, player_name2) end

--- 将一个可附着物体 附着到 其他物体 
--- @param object_id number 可附着物体id（也即必须有attach模块物体）
--- @param be_attached_object_id number 被附着物体id（可以是任何物体）
function exObjectAttachToObject(object_id, be_attached_object_id) end
-- 关于附着物体相关的api，参考LuaBridge那里的api   这里一并贴过来
-- [[21]]
-- 返回贴在当前单位身上贴着的单位的列表。
-- 例如，假如 self 是矿车，那么可能返回包含蜻蜓以及信标、钱套子之类的列表
-- local table, count = ObjectGetAttachers(self)
-- for i = 1, count, 1 do
--   ObjectDescription(table[i])
-- end
-- -- 返回贴在当前单位正在贴的单位。
-- -- 例如，假如 self 是蜻蜓，那么可能返回包含矿车的列表。
-- -- 一般来说这个列表只会有 0 个或者 1 个单位，除非 self 有多个 AttachUpdate 模块
-- local table, count = ObjectGetAttachees(self)
-- for i = 1, count, 1 do
--   ObjectDescription(table[i])
-- end
-- 日冕3230新增的可附加的物体有
-- Map_CustomAttaches01
-- Map_CustomAttaches02
-- Map_CustomAttaches_DogStun_Small
-- Map_CustomAttaches_DogStun_Big
-- Map_CustomAttaches04
-- Map_CustomAttaches_SelfHeal_Per2
-- Map_CustomAttaches_SelfHeal_Per5
-- Map_CustomAttaches_RangeArmorUp_400
-- Map_CustomAttaches_RangeDamageUp_400
-- Map_CustomAttaches_RangeFireSpeedUp_400
-- Map_CustomAttaches_RangeHeal_Per3
-- Map_CustomAttaches_RangeHeal_Per6
-- Map_CustomAttaches_TextureCelestial_Small
-- Map_CustomAttaches_TextureCelestial_Big
-- Map_CustomAttaches_TextureNatasha_Small
-- Map_CustomAttaches_TextureNatasha_Big
-- Map_CustomAttaches_TextureTanYa_Small
-- Map_CustomAttaches_TextureTanYa_Big

--- 设置物体缩放（永久缩放，和地编那个一样）
--- @param object_id number 物体id
--- @param scale number 缩放比例
function exObjectSetFixedScale(object_id, scale) end

-- 获取指定路径点的位置
--- @param name string 路径点名称
--- @return number x, number y, number z 路径点x,y,z坐标
function exWaypointGetPos(name) end

--- 集结点相关  集结点指的是生产建筑的集结点，比如兵营重工这些
--- 获取物体的集结点（如果物体不存在，或者此物体还没设置过集结点，那么坐标都是0）
--- @param object_id number 物体id
--- @return pos table 集结点坐标
function exObjectGetRallyPointPos(object_id) end

-- local pos, count = exObjectGetRallyPointPos(114);
-- pos[0]  pos[1]  pos[2]  就是坐标

--- 设置物体的集结点  
--- 这个函数建议不要在固定名字的回调函数里使用
--- @param object_id number 物体id
--- @param x number 集结点x坐标
--- @param y number 集结点y坐标
--- @param z number 集结点z坐标
function exObjectSetRallyPointPos(object_id, x, y, z) end

--- 设置单位速度（注意，这个速度在单位下海，上陆地，变形，回到机场 之后会失效）
--- @param object_id number 物体id
--- @param speed_value number 速度值
function exObjectSetCurrentLocomotorSpeed(object_id, speed_value) end

--- 取消特定command_code的热键注册
--- @param command_code number 命令码
function exUnregisterHotKey(command_code) end

--- 获取单位当前速度
--- @param object_id number 物体id
--- @return number 当前速度
function exObjectGetCurrentLocomotorSpeed(object_id) end


