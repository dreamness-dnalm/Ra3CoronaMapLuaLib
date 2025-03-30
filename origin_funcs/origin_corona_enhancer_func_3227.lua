-- TODO: test
--- 注册某种单位创建事件
--- @param name string 单位种类名字
function exObjectRegisterCreateEvent(name) end
-- 然后定义一个固定名字的函数
-- 注意，不要在这里面摧毁创建的单位，很可能会造成未知崩溃等问题
-- function onUnitCreateEvent(createdObjId, createdObjInstanceId, ownerPlayerName)
-- -- createdObjId 创建的物体id
-- -- createdObjInstanceId 创建的物体的InstanceId  (每种单位都有唯一的InstanceId)
-- -- ownerPlayerName 创建的物体的玩家脚本名字  例如"Player_1"
-- end

--- 鼠标位置相关
--- 建议只在必要的时间段开启监听，然后及时取消监听，避免频繁发送事件
--- 监听某个玩家的鼠标位置事件
--- @param player_name string 玩家脚本名字
function exEnableMousePosEvent(player_name) end
--- 取消监听某个玩家的鼠标位置事件
--- @param player_name string 玩家脚本名字

function exDisableMousePosEvent(player_name) end
--- 然后定义一个固定名字的函数
-- function onUserMousePosEvent(player_name, screen_pos, world_pos)
--   -- 如果鼠标不在屏幕内  screenPos和worldPos都是nil
--   -- screenPos 鼠标屏幕坐标, 获取位置使用mouseWorldPos.X, mouseWorldPos.Y,  
--   -- mouseWorldPos  鼠标在游戏里的位置，获取位置使用mouseWorldPos.X, mouseWorldPos.Y, mouseWorldPos.Z， 如果鼠标不在游戏窗口内，这个值是nil
-- end

-- 下面3个函数建议不要在固定名字的回调函数里使用，可能会导致未知问题

-- TODO: test
--- 设置物体清雾距离  distance需要是整数
--- @param object_id number 物体id
--- @param distance number 距离
function exObjectSetShroudClearingDistance(object_id, distance) end

--- 设置物体视线距离  distance需要是整数   和警戒距离有关
--- @param object_id number 物体id
--- @param distance number 距离
function exObjectSetVisionRange(object_id, distance) end

--- 设置物体模型体积相关  radius需要是整数 (据观察, radius越小，单位挨得越近，大于20并且小于40的值会被统一视作40)
--- @param object_id number 物体id
--- @param radius number 半径
function exObjectSetGeometryMajorRadius(object_id, radius) end

--- 获取当前物体正在控制的单位的id  (此函数针对有控制技能的物体， 例如 JapanPsychicInhibitor )
--- @param object_id number 物体id
--- @return number 单位的id
function exObjectGetTemporaryOwnedObjectId(object_id) end



