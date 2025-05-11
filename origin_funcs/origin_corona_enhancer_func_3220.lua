--- origin_corona_func.lua
--- Created by dreamness
--- DateTime: 8/9/2024 9:35 PM
---

--- 本文件中包含了日冕mod在3.220版本中, 于EnhancerCorona.dll内新增的函数

--- 在聊天框输出文字
--- @param message string 文字
function exMessageAppendToMessageArea(message) end

--- 在游戏日志中输出文字
--- @param message string 文字
function exPrintln(message)  end

-- TODO: test, package
--- 在指定地点播放特效FXParticleSystemTemplate
--- @param FXParticleSystemTemplate string 特效名
--- @param x number x
--- @param y number y
--- @param z number z
function exFXShowFXTemplate(FXParticleSystemTemplate, x, y, z)  end

-- TODO: test, package
--- 在指定地点播放特效FXShowFXList
--- @param FXShowFXList string 特效名
--- @param x number x
--- @param y number y
--- @param z number z
function exFXShowFXList(FXShowFXList, x, y, z)  end

--- 设置或新建计数器
--- @param counterName string 计数器名
--- @param value number 计数器值
function exCounterSetByName(counterName, value) end

--- 获取计数器的值
--- @param counterName string 计数器名
--- @return number 计数器值
function exCounterGetByName(counterName) end

-- TODO: test, package
--- 获取指定地点的地面高度
--- @param x number x
--- @param y number y
--- @return number 高度
function exTerrainGetHeightByPos(x, y) end

-- TODO: test, package
--- 获取指定地点的地面纹理名称
--- @param x number x
--- @param y number y
--- @return string 纹理名称
function exTerrainGetTextureNameByPos(x, y)  end

--- 注册按键, 以响应键盘事件
--- @param keyCode number 按键码 参考https://learn.microsoft.com/en-us/windows/win32/inputdev/virtual-key-codes
--- @param assistKeyCode number 辅助按键码，如果不需要，传0即可 参考https://learn.microsoft.com/en-us/windows/win32/inputdev/virtual-key-codes
--- @param commandCode number 你自己定义的命令码 在处理事件回调里，会把这个命令码传给你,以便你区分是哪个功能
function exRegisterHotKey(keyCode, assistKeyCode, commandCode) end

----然后定义一个固定名字的函数，在收到用户键盘事件后会调用这个函数
--function onUserHotKeyEvent(playerName, commandCode, mouseWorldPos)
-- -- playerName  玩家脚本名字
-- -- commandCode 命令码
-- -- mouseWorldPos  鼠标在游戏里的位置，获取位置使用mouseWorldPos.x, mouseWorldPos.y, mouseWorldPos.z， 如果鼠标不在游戏窗口内，这个值是nil
-- --你的处理逻辑
--end

--处理用户聊天信息事件
--触发方式， Player1~6 在聊天框输入信息，信息内容以/开头
--并且/后面的信息只能有字母和数字，以及!, @, #, $, %, ^, &, *, (, ), -, _, =, +, {, }, [, ], :, ;, ", ', <, >, ,, ., ?, /, |, \,  ~和空格
--并且/后面的内容长度不超过45（也就是不超过45字节）
--违反上面这样两条规则任意一个，都不会触发这个事件
-- 定义一个固定名字的函数
--function onUserShortChatMsg(playerName, msg)
--  -- playerName  玩家名字
--  -- msg 信息内容
--end

-- TODO: test, package
--- 设置主光源颜色
--- @param r number float 红色
--- @param g number float 绿色
--- @param b number float 蓝色
function exLightSetMainLightColor(r, g, b)  end

-- TODO: test, package
--- 设置补光1颜色
--- @param r number float 红色
--- @param g number float 绿色
--- @param b number float 蓝色
function exLightSetAccent1Color(r, g, b)  end

-- TODO: test, package
--- 设置补光2颜色
--- @param r number float 红色
--- @param g number float 绿色
--- @param b number float 蓝色
function exLightSetAccent2Color(r, g, b)  end

-- TODO: test, package
--- 主光源方向  这里输入的是光源方向向量
--- @param x number float
--- @param y number float
--- @param z number float
function exLightSetMainLightDirection(x, y, z)  end

-- TODO: test, package
--- 补光1方向
--- @param x number float
--- @param y number float
--- @param z number float
function exLightSetAccent1Direction(x, y, z)  end

-- TODO: test, package
--- 补光2方向
--- @param x number float
--- @param y number float
--- @param z number float
function exLightSetAccent2Direction(x, y, z)  end

-- TODO: test
--- 为某个玩家显示提示框
--- @param player_name string 玩家名字
--- @param content string 提示框内容
--- @param duration_seconds number 提示框显示时间
function exInfoBoxTopCenterShowForPlayer(player_name, content, duration_seconds) end

-- TODO: test, package
--- 对物体造成冰冻伤害
--- @param object_id number 物体ID
--- @param amount number 伤害值, 整数, 正数表示增加冰冻量，负数表示解冻量
function exObjectDealSecondaryDamage(object_id, amount)  end

-- 针对全体玩家
--- 设置相机位置
function exCameraAdjustPos(x, y, z)  end

--- 设置相机旋转
function exCameraAdjustRotation(value)  end

--- 设置相机俯仰
function exCameraAdjustPitch(value)  end

--- 设置相机滚转
function exCameraAdjustRoll(value)  end
--- 设置相机位置相对于当前位置的偏移
function exCameraAdjustPosBy(dx, dy, dz)  end

--- 设置相机旋转改变量（相对于当前值)
function exCameraAdjustRotationBy(value)  end

--- 设置相机俯仰改变量（相对于当前值)
function exCameraAdjustPitchBy(value)  end

--- 设置相机滚转改变量（相对于当前值)
function exCameraAdjustRollBy(value)  end

---设置某玩家相机位置
function exCameraAdjustPosForPlayer(player_name, x, y, z)  end


---设置某玩家相机旋转
function exCameraAdjustRotationForPlayer(playerName, value)  end


---设置某玩家相机俯仰
function exCameraAdjustPitchForPlayer(playerName, value)  end


---设置某玩家相机滚转
function exCameraAdjustRollForPlayer(playerName, value)  end


---设置某玩家相机位置相对于当前位置的偏移
function exCameraAdjustPosByForPlayer(playerName, dx, dy, dz)  end
-- TODO: test
---设置某玩家相机旋转改变量（相对于当前值)
function exCameraAdjustRotationByForPlayer(playerName, value)  end

---设置某玩家相机俯仰改变量（相对于当前值)
function exCameraAdjustPitchByForPlayer(playerName, value)  end

---设置某玩家相机滚转改变量（相对于当前值)
function exCameraAdjustRollByForPlayer(playerName, value)  end

-- 相机动画，跟随相机相关, 开启相机插值
function exEnableCameraInterpolate() end

-- 关闭相机插值
function exDisableCameraInterpolate() end

--- 设置相机各个参数
---  使用方法，要进行连续的相机动画，或者跟随某单位，首先exEnableCameraInterpolate，然后每一帧调用一次SetFollowCameraParam（必须有一次且只能调用一次）
--  然后使用 exDisableCameraInterpolate 结束
--  注意，如果地图不需要相机动画或者跟随物体，不要调用exEnableCameraInterpolate
--  这里的插值，是自动在渲染帧预测和设置相机参数，来实现平稳的相机连续动作（因为lua设置参数只能在逻辑帧）
--- @param player_name string 玩家名字
--- @param pos_x number 相机位置x
--- @param pos_y number 相机位置y
--- @param pos_z number 相机位置z
--- @param yaw number 相机旋转
--- @param pitch number 相机俯仰
--- @param roll number 相机滚转
function exSetFollowCameraParam(player_name, pos_x, pos_y, pos_z, yaw, pitch, roll) end

--- 获取单位当前血量(重复的api, 放弃封装)
--- @param object_id number 单位ID
--- @return number 当前血量
function exObjectGetCurrentHealth(object_id) end

--- 获取单位最大血量
--- @param object_id number 单位ID
--- @return number 最大血量
function exObjectGetMaxHealth(object_id) end

-- TODO: test
--- 在单位上方显示漂浮数字（整数，效果类似油井的那个数字）
--- @param object_id number 单位ID
--- @param value number 数字(int)
function exShowFloatingIntAtObject(object_id, value) end

--- 隐藏左下角的协议按钮
function exAptHidePlayerTechButton() end

--- 显示左下角的协议按钮
function exAptShowPlayerTechButton() end

-- TODO: test, package
--- 协议转换相关
--- 为某个玩家解锁所有阵营的基础科技（如果要切换某个玩家的协议面板，需要先调用这个）
--- @param player_name string 玩家名字
function exPlayerTechUnlockBaseTechForPlayer(player_name) end

-- 切换某个玩家的协议面板为指定阵营的协议面板
-- factionTech 只能是以下字符串
  -- PlayerTechStore_Allied 盟军协议
  -- PlayerTechStore_Soviet 苏联协议
  -- PlayerTechStore_Japan 帝国协议
  -- PlayerTechStore_Neutral 神州协议
--- @param player_name string 玩家名字
--- @param faction_tech string 阵营协议
function exPlayerTechChangeTechFaction(player_name, faction_tech) end

-- TODO: test
--- 显示按钮选项弹框
--- 弹框全局只有一个，如果之前的弹框还未消失，则会覆盖之前的弹框数据和ui
--- 弹框按钮点击后，弹框自动消失
--- 不需要的传空字符串
--- @dialogId 弹框id， 用户点击按钮后，回调函数里会传过去
--- @param dialog_id number 弹框id
--- @param title string 标题
--- @param btn1 string 按钮1
--- @param btn2 string 按钮2
--- @param btn3 string 按钮3
--- @param btn4 string 按钮4
--- @param btn5 string 按钮5
--- @param btn6 string 按钮6
--- @param btn7 string 按钮7
function exShowCustomBtnChoiceDialog(dialog_id, title, btn1, btn2, btn3, btn4, btn5, btn6, btn7) end

-- TODO: test
--- 显示按钮选项弹框
--- 弹框全局只有一个，如果之前的弹框还未消失，则会覆盖之前的弹框数据和ui
--- 弹框按钮点击后，弹框自动消失
--- 不需要的传空字符串
--- @param player_name string 玩家名字
--- @dialogId 弹框id， 用户点击按钮后，回调函数里会传过去
--- @param dialog_Id number 弹框id
--- @param title string 标题
--- @param btn1 string 按钮1
--- @param btn2 string 按钮2
--- @param btn3 string 按钮3
--- @param btn4 string 按钮4
--- @param btn5 string 按钮5
--- @param btn6 string 按钮6
--- @param btn7 string 按钮7
function exShowCustomBtnChoiceDialogForPlayer(player_name, dialog_Id, title, btn1, btn2, btn3, btn4, btn5, btn6, btn7) end

-- TODO: test
--- 关闭按钮选项弹框
function exHideCustomBtnChoiceDialog() end

-- TODO: test
--- 关闭按钮选项弹框
--- @param player_name string 玩家名字
function exHideCustomBtnChoiceDialogForPlayer(player_name) end


---- 监听按钮选项弹框的点击事件
---- 定义一个固定名字的函数
--function onUserBtnChoiceDialogEvent(playerName, btnIndex, dialogId)
--    -- btnIndex 按钮编号，第一个按钮是1，第二个按钮是2，以此类推
--    -- dialogId  弹框id
--end

-- TODO: test
--- 单位头顶显示文字相关， 当单位不存在后，会自动移除这个文字
--- 在单位头顶显示文字
--- @param object_id number 单位id
--- @param content string 文字内容，单行
--- @param offset number 相对于单位z的偏移值
--- @param color number 颜色，例如 255(0x0000FF)
function exObjectShowTextAtTop(object_id, content, offset, color) end
   -- objectId 单位id
   -- content 文字内容，单行
   -- offset 相对于单位z的偏移值

-- TODO: test
--- 更新单位头顶显示文字
--- @param object_id number 单位id
--- @param content string 文字内容，单行
--- @param offset number 相对于单位z的偏移值
--- @param color number 颜色，例如 255(0x0000FF)
function exObjectUpdateTextAtTop(object_id, content, offset, color) end


-- TODO: test, api issue
---删除指定单位头顶的文字
--- @param object_id number 单位id
function exObjectDeleteTextAtTop(object_id) end

-- TODO: test
--- 单位头顶显示文字相关， 当单位不存在后，会自动移除这个文字
--- 在单位头顶显示文字
--- @param player_name string 玩家名字
--- @param object_id number 单位id
--- @param content string 文字内容，单行
--- @param offset number 相对于单位z的偏移值
--- @param color number 颜色，例如 255(0x0000FF)
function exObjectShowTextAtTopForPlayer(player_name, object_id, content, offset, color) end


-- TODO: test
--- 更新单位头顶显示文字
--- @param player_name string 玩家名字
--- @param object_id number 单位id
--- @param content string 文字内容，单行
--- @param offset number 相对于单位z的偏移值
--- @param color number 颜色，例如 255(0x0000FF)
function exObjectUpdateTextAtTopForPlayer(player_name, object_id, content, offset, color) end


-- TODO: test, api issue
---删除指定单位头顶的文字
--- @param player_name string 玩家名字
--- @param object_id number 单位id
function exObjectDeleteTextAtTopForPlayer(player_name, object_id) end

-- TODO: test
--- 显示长文本对话框
--- @param dialog_id number 对话框id
--- @param content string 长文本，支持多行
--- @param btn1 string 按钮1
--- @param btn2 string 按钮2
--- @param btn3 string 按钮3
function exShowLongTextDialog(dialog_id, content, btn1, btn2, btn3) end


-- TODO: test
--- 隐藏长文本对话框
function exHideLongTextDialog() end

-- TODO: test
--- 玩家特化版本
--- 显示长文本对话框
--- @param player_name string 玩家名字
--- @param dialog_id number 对话框id
--- @param content string 长文本，支持多行
--- @param btn1 string 按钮1
--- @param btn2 string 按钮2
--- @param btn3 string 按钮3
function exShowLongTextDialogForPlayer(player_name, dialog_id, content, btn1, btn2, btn3) end

--- 玩家特化版本
--- 隐藏长文本对话框
--- @param player_name string 玩家名字
function exHideLongTextDialogForPlayer(player_name) end


--- 显添加一条公屏文本，如果有换行符，会被拆陈多行
--- @param content string 长文本，支持多行
--- @param duration number 显示持续时间， 最多30秒
function exAddTextToPublicBoard(content, duration) end


--- 添加一条公屏文本，如果有换行符，会被拆陈多行
--- @param player_name string 玩家名字
--- @param content string 长文本，支持多行
--- @param duration number 显示持续时间， 最多30秒
function exAddTextToPublicBoardForPlayer(player_name, content, duration) end


-- TODO: test, package
--- 获取单位当前冰冻量数值
--- @param object_id number 单位id
--- @return number 冰冻量
function exObjectGetCurrentSecondaryDamage(object_id) end

--- 单位顶部按钮, 添加按钮
--- @param object_id number 单位id
--- @param offset number 偏移量位置
function exObjectShowBtnAtTop(object_id, offset) end   -- 添加按钮

--- 单位顶部按钮, 修改按钮可见性
--- @param object_id number 单位id
--- @param visible number  1是可见，0是隐藏
function exObjectChangeBtnAtTopVisibility(object_id, visible) end  -- visible  1是可见，0是隐藏

--- 单位顶部按钮, 删除按钮
--- @param object_id number 单位id
function exObjectDeleteBtnAtTop(object_id) end  -- 删除按钮

--- 玩家特化版本, 单位顶部按钮, 添加按钮
--- @param player_name string 玩家名字
--- @param object_id number 单位id
--- @param offset number 位置
function exObjectShowBtnAtTopForPlayer(player_name, object_id, offset) end

--- 玩家特化版本, 单位顶部按钮, 修改按钮可见性
--- @param player_name string 玩家名字
--- @param object_id number 单位id
--- @param visible number  1是可见，0是隐藏
function exObjectChangeBtnAtTopVisibilityForPlayer(player_name, object_id, visible) end

--- 玩家特化版本, 单位顶部按钮, 删除按钮
--- @param player_name string 玩家名字
--- @param object_id number 单位id
function exObjectDeleteBtnAtTopForPlayer(player_name, object_id) end

---- 单位头顶按钮点击事件
---- 定义一个固定名字的函数
--function onUnitTopBtnClickEvent(player_name, unit_id)
---- unitId 单位id
--end


-- 界面顶部按钮相关
-- ui  目前顶部按钮最多6个， index 取值 1~6
-- textureName 

--- 修改指定位置的图片，既是创建也是更新，注意，目前这个函数创建后需要等待1或2帧后才能调用其他的ui函数，不然没有作用
--- @param index number 位置
--- @param texture_name string 图片名字
--- @param content string 文字内容
function exCenterTopBtnShow(index, texture_name, content) end

--- 是否启用高亮动画 ,enable 1启用 0关闭
--- @param index number 位置
--- @param enable number 是否启用高亮动画 ,enable 1启用 0关闭
function exCenterTopBtnToggleHighLight(index, enable) end

--- 设置时间overlay层可见性, visible 1可见，0隐藏
--- @param index number 位置
--- @param visible number 1可见，0隐藏
function exCenterTopBtnSetTimerOverlayVisibility(index, visible) end

--- 设置时间overlay层的百分比，value范围 0-99  注意先要让时间overlay层可见
--- @param index number 位置
--- @param value number 百分比
function exCenterTopBtnSetTimerOverlayValue(index, value) end

--- 设置血条可见性, visible 1可见，0隐藏
--- @param index number 位置
--- @param visible number 1可见，0隐藏
function exCenterTopBtnSetHealthBarVisibility(index, visible) end

--- 设置血条的百分比，value范围 1-100  注意先要让血条可见
--- @param index number 位置
--- @param value number 百分比
function exCenterTopBtnSetHealthBarValue(index, value) end

--- 设置某个位置按钮的可见性
--- @param index number 位置
--- @param visible number 1可见，0不可见
function exCenterTopBtnSetVisibility(index, visible) end

-- 设置是否选中态，selected 1选中， 0未选中
function exCenterTopBtnSetSelected(index, selected) end

-- 设置整个顶部栏按钮区域的可见性, visible  1可见，0不可见
function exCenterTopBtnsChangeVisibility(visible) end

--- 设置按钮是否可用
--- @param index number 位置
--- @param enable number 1可用，0不可用
function exCenterTopBtnSetEnable(index, enable) end

-- 玩家特化版本
--- 修改指定位置的图片，既是创建也是更新，注意，目前这个函数创建后需要等待1或2帧后才能调用其他的ui函数，不然没有作用
--- @param player_name string 玩家名字
--- @param index number 位置
--- @param texture_name string 图片名字
--- @param content string 文字内容
function exCenterTopBtnShowForPlayer(player_name, index, texture_name, content) end


--- 是否启用高亮动画 ,enable 1启用 0关闭
--- @param player_name string 玩家名字
--- @param index number 位置
--- @param enable number 是否启用高亮动画 ,enable 1启用 0关闭
function exCenterTopBtnToggleHighLightForPlayer(player_name, index, enable) end

--- 设置时间overlay层可见性, visible 1可见，0隐藏
--- @param player_name string 玩家名字
--- @param index number 位置
--- @param visible number 1可见，0隐藏
function exCenterTopBtnSetTimerOverlayVisibilityForPlayer(player_name, index, visible) end

--- 设置时间overlay层的百分比，value范围 0-99  注意先要让时间overlay层可见
--- @param player_name string 玩家名字
--- @param index number 位置
--- @param value number 百分比
function exCenterTopBtnSetTimerOverlayValueForPlayer(player_name, index, value) end

--- 设置血条可见性, visible 1可见，0隐藏
--- @param player_name string 玩家名字
--- @param index number 位置
--- @param visible number 1可见，0隐藏 
function exCenterTopBtnSetHealthBarVisibilityForPlayer(player_name, index, visible) end

--- 设置血条的百分比，value范围 1-100  注意先要让血条可见
--- @param player_name string 玩家名字
--- @param index number 位置
--- @param value number 百分比
function exCenterTopBtnSetHealthBarValueForPlayer(player_name, index, value) end


--- 设置某个位置按钮的可见性
--- @param player_name string 玩家名字
--- @param index number 位置
--- @param visible number 1可见，0不可见
function exCenterTopBtnSetVisibilityForPlayer(player_name, index, visible) end

--- 设置是否选中态，selected 1选中， 0未选中
--- @param player_name string 玩家名字
--- @param index number 位置
--- @param selected number 1选中， 0未选中
function exCenterTopBtnSetSelectedForPlayer(player_name, index, selected) end

--- 设置整个顶部栏按钮区域的可见性, visible  1可见，0不可见
--- @param player_name string 玩家名字
--- @param visible number 1可见，0不可见
function exCenterTopBtnsChangeVisibilityForPlayer(player_name, visible) end

--- 设置按钮是否可用(不可用时，按钮会变灰, 仍然会响应点击事件)
--- @param index number 位置
--- @param enable number 1可用，0不可用
function exCenterTopBtnSetEnableForPlayer(player_name, index, enable) end

---- 顶部按钮点击事件
---- 定义一个固定名字的函数
--function onCenterTopBtnClickEvent(player_name, btn_index)
---- btnIndex 按钮编号，第一个按钮是1，第二个按钮是2，以此类推
--end



-- 启用地编脚本
function exEnableWBScript(script_name) end

-- 禁用地编脚本
function exDisableWBScript(script_name) end

-- 隐藏右下角的技能栏区域
function exAptHideObjectDetailsArea() end

-- 显示右下角的技能栏区域
function exAptShowObjectDetailsArea() end

--- 移动单位到某个位置  坐标都是整数
--- @param objectId number 单位id
--- @param x number x 整数
--- @param y number y 整数
--- @param z number z 整数
function exObjectMoveTo(objectId, x, y, z) end

--- TODO: test
--- 获取指定玩家当前选中的物体   比使用ObjectFilter获取要快很多
--- @param player_name PlayerEnum
function exPlayerGetSelectedObjectIds(player_name) end
-- 使用例子
-- local selectedObjects, count = exPlayerGetSelectedObjects("Player_1");  -- selectedObjects是单位id数组，count是单位数量
-- for i = 1, count, 1 do
--  local selectedObjectId = selectedObjects[i]
--  -- ...
-- end

--- 获取指定玩家当前资金
--- @param player_name PlayerEnum
--- @return number 资金
function exPlayerGetCurrentMoney(player_name) end


--- 获取指定玩家当前产生的电力
--- @param player_name PlayerEnum
--- @return number 电力
function exPlayerGetProducePower(player_name) end


--- 获取指定玩家当前消耗的电力
--- @param player_name PlayerEnum
--- @return number 电力
function exPlayerGetConsumePower(player_name) end

