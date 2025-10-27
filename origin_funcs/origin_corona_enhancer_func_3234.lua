

-- TODO: test, package
--- 创建物体
--- @param config table 配置表, 参数有: ObjectType, TeamName, Position, Angle, Health, Scale
--- @return number 物体id, 如果失败, 返回0
function exCreateObject(config) end

-- example
-- local objectId = exCreateObject({
--     ObjectType = FastHash("JapanInterceptorAircraft"),
--     TeamName = "Player_1/teamPlayer_1",
-- })
-- -- 更多可选参数
-- local objectId = exCreateObject({
--     ObjectType = FastHash("JapanInterceptorAircraft"),
--     TeamName = "Player_1/teamPlayer_1",
--     Position = {X = 300, Y = 2100, Z = 210},
--     Angle = 90,
--     Health = 30000,
--     Scale = 3.0,
-- })

-- TODO: test, package
--- 创建多个物体
--- @param config table 配置表, 参数有: ObjectType, TeamName, Position, Angle, Health, Scale
--- @return table 物体id数组, number 物体数量
function exCreateObjects(config) end

-- example
-- local objects, count = exCreateObjects({
--     {
--         ObjectType = FastHash("JapanAntiInfantryInfantry"),
--         TeamName = "Player_1/teamPlayer_1",
--         Position = {X = 600, Y = 2900, Z = 210},
--         Angle = 90,
--         Health = 30000,
--         Scale = 2.0,
--     },
--     {
--         ObjectType = FastHash("JapanAntiInfantryInfantry"),
--         TeamName = "Player_1/teamPlayer_1",
--         Position = {X = 900, Y = 2900, Z = 210},
--         Angle = 120,
--         Health = 30000,
--         Scale = 3.0,
--     },
-- })
-- for i = 1, count, 1 do
--   local current = objects[i]
--   -- 对每个物体进行操作， 注意！！如果current是0，表示创建失败
-- end


-- 自定义按钮（建造栏的那种按钮）每个按钮大小是50
-- 创建
-- GroupIndex是可选参数(默认0)，AlignX和AlignY也是可选参数（但建议都传，不传默认为绝对坐标，有可能会超出屏幕）其他事必须传
-- AlignX 是按钮对齐画面左右的方式  可以传 "left" 或者  "right" ，分别是靠左或靠右  （这里靠左靠右均已考虑屏幕左右黑边）
-- AlignY 是按钮对齐画面上下的方式  可以传 "top" 或者  "bottom"  ,分别是靠上或者靠下
-- X Y 
    -- 不传AlignX和AlignY则为按钮相对于屏幕左上角的坐标
    -- 传了AlignX "left" 则x表示距离画面左边的距离，  "right"  则表示距离画面右边的距离
    -- 传了AlignY "top" 则x表示距离画面上边的距离，  "bottom"  则表示距离画面下边的距离
-- GroupIndex可以将多个按钮联系起来，方便统一设置他们的相关属性
-- 注意，如果后续创建了同一个index的按钮，则会销毁之前的按钮，然后新建一个



-- TODO: test, package
-- 设置物体当前生命值（整数）
--- @param object_id number 物体id
--- @param health number 生命值
function exObjectSetHealth(object_id, health) end

-- TODO: test, package
--- 创建自定义按钮
--- @param config table 配置表, 参数有: Index, TextureName, Desc, X, Y, GroupIndex, AlignX, AlignY
--- @return number 按钮id, 如果失败, 返回0
function exCreateCustomButton(config) end
-- example
-- local buttonId = exCreateCustomButton({
--     Index = 3,
--     TextureName = "Button_AlliedAntiInfantryInfantry_on",
--     Desc = "局部毁灭武器(全局仅限一次)\n摧毁一大片地区的所有敌方单位",
--     X = 400,
--     Y = 200,
--     GroupIndex = 1,
--     AlignX = "right",
--     AlignY = "top",
-- })


-- TODO: test, package
--- 创建多个自定义按钮
--- @param config table 配置表, 参数有: Index, TextureName, Desc, X, Y, GroupIndex, AlignX, AlignY
--- @return table 按钮id数组, number 按钮数量
function exCreateCustomButtons(config) end

-- example
-- exCreateCustomButtons({
--     {
--         Index = 4,
--         TextureName = "Button_AlliedAntiInfantryInfantry_on",
--         Desc = "局部毁灭武器(全局仅限一次)\n摧毁一大片地区的所有敌方单位",
--         X = 400,
--         Y = 200,
--         GroupIndex = 1,
--         AlignX = "right",
--         AlignY = "top",
--     },
--     {
--         Index = 5,
--         TextureName = "Button_AlliedAntiInfantryInfantry_on",
--         Desc = "局部毁灭武器(全局仅限一次)\n摧毁一大片地区的所有敌方单位",
--         X = 450,
--         Y = 200,
--         GroupIndex = 1,
--     }
-- })

-- TODO: test, package
--- 设置自定义按钮高亮
--- @param index number 按钮index
--- @param enable number 是否高亮, 1是高亮, 0是不高亮
function exCustomBtnToggleHighLight(index, enable) end

-- TODO: test, package
--- 设置自定义按钮时间覆盖层值
--- @param index number 按钮index
--- @param value number 时间覆盖层值, 0-99
function exCustomBtnSetTimerOverlayValue(index, value) end

-- TODO: test, package
--- 设置自定义按钮时间覆盖层可见性
--- @param index number 按钮index
--- @param visible number 是否可见, 1是可见, 0是不可见
function exCustomBtnSetTimerOverlayVisibility(index, visible) end

-- TODO: test, package
--- 设置自定义按钮血条值
--- @param index number 按钮index
--- @param value number 血条值, 0-100
function exCustomBtnSetHealthBarValue(index, value) end



-- TODO: test, package
--- 设置自定义按钮血条可见性
--- @param index number 按钮index
--- @param visible number 是否可见, 1是可见, 0是不可见
function exCustomBtnSetHealthBarVisibility(index, visible) end

-- TODO: test, package
--- 设置自定义按钮可见性
--- @param index number 按钮index
--- @param visible number 是否可见, 1是可见, 0是不可见
function exCustomBtnSetVisibility(index, visible) end

-- TODO: test, package
--- 设置自定义按钮选中态
--- @param index number 按钮index
--- @param selected number 是否选中, 1是选中, 0是未选中
function exCustomBtnSetSelected(index, selected) end

-- TODO: test, package
--- 设置自定义按钮可用性
--- @param index number 按钮index
--- @param enable number 是否可用, 1是可用, 0是不可用
function exCustomBtnSetEnable(index, enable) end



-- -- 按钮组设置，会将同一个groupIndex的按钮统一设置（相当于上面那些函数的批量操作版本）
-- -- 参数只是将按钮index换成了groupIndex，其他都一样


-- TODO: test, package
--- 设置自定义按钮组高亮
--- @param groupIndex number 按钮组index
--- @param enable number 是否高亮, 1是高亮, 0是不高亮
function exCustomBtnGroupToggleHighLight(groupIndex, enable) end


-- TODO: test, package
--- 设置自定义按钮组时间覆盖层值
--- @param groupIndex number 按钮组index
--- @param value number 时间覆盖层值, 0-99
function exCustomBtnGroupSetTimerOverlayValue(groupIndex, value) end

-- TODO: test, package
--- 设置自定义按钮组时间覆盖层可见性
--- @param groupIndex number 按钮组index
--- @param visible number 是否可见, 1是可见, 0是不可见
function exCustomBtnGroupSetTimerOverlayVisibility(groupIndex, visible) end

-- TODO: test, package
--- 设置自定义按钮组血条值
--- @param groupIndex number 按钮组index
--- @param value number 血条值, 0-100
function exCustomBtnGroupSetHealthBarValue(groupIndex, value) end

-- TODO: test, package
--- 设置自定义按钮组血条可见性
--- @param groupIndex number 按钮组index
--- @param visible number 是否可见, 1是可见, 0是不可见
function exCustomBtnGroupSetHealthBarVisibility(groupIndex, visible) end

-- TODO: test, package
--- 设置自定义按钮组可见性
--- @param groupIndex number 按钮组index
--- @param visible number 是否可见, 1是可见, 0是不可见
function exCustomBtnGroupSetVisibility(groupIndex, visible) end

-- TODO: test, package
--- 设置自定义按钮组选中态
--- @param groupIndex number 按钮组index
--- @param selected number 是否选中, 1是选中, 0是未选中
function exCustomBtnGroupSetSelected(groupIndex, selected) end

-- TODO: test, package
--- 设置自定义按钮组可用性
--- @param groupIndex number 按钮组index
--- @param enable number 是否可用, 1是可用, 0是不可用
function exCustomBtnGroupSetEnable(groupIndex, enable) end


-- --组定按钮玩家特化版本（命名类似，都是最后加个ForPlayer）

-- TODO: test, package
--- 创建自定义按钮玩家特化版本
--- @param player_name string 玩家名字
--- @param config table 配置表, 参数有: Index, TextureName, Desc, X, Y, GroupIndex, AlignX, AlignY
--- @return number 按钮id, 如果失败, 返回0
function exCreateCustomButtonForPlayer(player_name, config) end

-- example
-- local buttonId = exCreateCustomButtonForPlayer("Player_1", {
--     Index = 4,
--     TextureName = "Button_AlliedAntiInfantryInfantry_on",
--     Desc = "局部毁灭武器(全局仅限一次)\n摧毁一大片地区的所有敌方单位",
--     X = 400,
--     Y = 200,
--     GroupIndex = 1,
-- })


-- TODO: test, package
--- 创建多个自定义按钮玩家特化版本
--- @param player_name string 玩家名字
--- @param config table 配置表, 参数有: Index, TextureName, Desc, X, Y, GroupIndex, AlignX, AlignY
--- @return table 按钮id数组, number 按钮数量
function exCreateCustomButtonsForPlayer(player_name, config) end

-- example
-- exCreateCustomButtonsForPlayer("Player_1", {
--     {
--         Index = 4,
--         TextureName = "Button_AlliedAntiInfantryInfantry_on",
--         Desc = "局部毁灭武器(全局仅限一次)\n摧毁一大片地区的所有敌方单位",
--         X = 400,
--         Y = 200,
--         GroupIndex = 1,
--     },
--     {
--         Index = 5,
--         TextureName = "Button_AlliedAntiInfantryInfantry_on",
--         Desc = "局部毁灭武器(全局仅限一次)\n摧毁一大片地区的所有敌方单位",
--         X = 450,
--         Y = 200,
--         GroupIndex = 1,
--     }
-- })


-- TODO: test, package
--- 设置自定义按钮玩家特化版本高亮
--- @param player_name string 玩家名字
--- @param index number 按钮index
--- @param enable number 是否高亮, 1是高亮, 0是不高亮
function exCustomBtnToggleHighLightForPlayer(player_name, index, enable) end

-- TODO: test, package
--- 设置自定义按钮玩家特化版本时间覆盖层值
--- @param player_name string 玩家名字
--- @param index number 按钮index
--- @param value number 时间覆盖层值, 0-99
function exCustomBtnSetTimerOverlayValueForPlayer(player_name, index, value) end

-- TODO: test, package
--- 设置自定义按钮玩家特化版本时间覆盖层可见性
--- @param player_name string 玩家名字
--- @param index number 按钮index
--- @param visible number 是否可见, 1是可见, 0是不可见
function exCustomBtnSetTimerOverlayVisibilityForPlayer(player_name, index, visible) end

-- TODO: test, package
--- 设置自定义按钮玩家特化版本血条值
--- @param player_name string 玩家名字
--- @param index number 按钮index
--- @param value number 血条值, 0-100
function exCustomBtnSetHealthBarValueForPlayer(player_name, index, value) end

-- TODO: test, package
--- 设置自定义按钮玩家特化版本血条可见性
--- @param player_name string 玩家名字
--- @param index number 按钮index
--- @param visible number 是否可见, 1是可见, 0是不可见
function exCustomBtnSetHealthBarVisibilityForPlayer(player_name, index, visible) end

-- TODO: test, package
--- 设置自定义按钮玩家特化版本可见性
--- @param player_name string 玩家名字
--- @param index number 按钮index
--- @param visible number 是否可见, 1是可见, 0是不可见
function exCustomBtnSetVisibilityForPlayer(player_name, index, visible) end

-- TODO: test, package
--- 设置自定义按钮玩家特化版本选中态
--- @param player_name string 玩家名字
--- @param index number 按钮index
--- @param selected number 是否选中, 1是选中, 0是未选中
function exCustomBtnSetSelectedForPlayer(player_name, index, selected) end

-- TODO: test, package
--- 设置自定义按钮玩家特化版本可用性
--- @param player_name string 玩家名字
--- @param index number 按钮index
--- @param enable number 是否可用, 1是可用, 0是不可用
function exCustomBtnSetEnableForPlayer(player_name, index, enable) end

-- TODO: test, package
--- 设置自定义按钮组玩家特化版本高亮
--- @param player_name string 玩家名字
--- @param groupIndex number 按钮组index
--- @param enable number 是否高亮, 1是高亮, 0是不高亮
function exCustomBtnGroupToggleHighLightForPlayer(player_name, groupIndex, enable) end

-- TODO: test, package
--- 设置自定义按钮组玩家特化版本时间覆盖层值
--- @param player_name string 玩家名字
--- @param groupIndex number 按钮组index
--- @param value number 时间覆盖层值, 0-99
function exCustomBtnGroupSetTimerOverlayValueForPlayer(player_name, groupIndex, value) end

-- TODO: test, package
--- 设置自定义按钮组玩家特化版本时间覆盖层可见性
--- @param player_name string 玩家名字
--- @param groupIndex number 按钮组index
--- @param visible number 是否可见, 1是可见, 0是不可见
function exCustomBtnGroupSetTimerOverlayVisibilityForPlayer(player_name, groupIndex, visible) end

-- TODO: test, package
--- 设置自定义按钮组玩家特化版本血条值
--- @param player_name string 玩家名字
--- @param groupIndex number 按钮组index
--- @param value number 血条值, 0-100
function exCustomBtnGroupSetHealthBarValueForPlayer(player_name, groupIndex, value) end

-- TODO: test, package
--- 设置自定义按钮组玩家特化版本血条可见性
--- @param player_name string 玩家名字
--- @param groupIndex number 按钮组index
--- @param visible number 是否可见, 1是可见, 0是不可见
function exCustomBtnGroupSetHealthBarVisibilityForPlayer(player_name, groupIndex, visible) end

-- TODO: test, package
--- 设置自定义按钮组玩家特化版本可见性
--- @param player_name string 玩家名字
--- @param groupIndex number 按钮组index
--- @param visible number 是否可见, 1是可见, 0是不可见
function exCustomBtnGroupSetVisibilityForPlayer(player_name, groupIndex, visible) end

-- TODO: test, package
--- 设置自定义按钮组玩家特化版本选中态
--- @param player_name string 玩家名字
--- @param groupIndex number 按钮组index
--- @param selected number 是否选中, 1是选中, 0是未选中
function exCustomBtnGroupSetSelectedForPlayer(player_name, groupIndex, selected) end

-- TODO: test, package
--- 设置自定义按钮组玩家特化版本可用性
--- @param player_name string 玩家名字
--- @param groupIndex number 按钮组index
--- @param enable number 是否可用, 1是可用, 0是不可用
function exCustomBtnGroupSetEnableForPlayer(player_name, groupIndex, enable) end

-- TODO: test, package
-- --自定义按钮点击事件
-- --定义固定名字的函数
-- function onCustomBtnClickEvent(playerName, index)
  
-- end