--- CameraModule.lua
--- Created by dreamness
--- DateTime: 01/07/2025 09:50 PM

--- 摄像机模块
CameraModule = {}

--- 开启/关闭摄像机插值 (相机跟随相关)
--- @param is_enable boolean
CameraModule.enable_camera_interpolate = function(is_enable)
    if is_enable then
        exEnableCameraInterpolate()
    else
        exDisableCameraInterpolate()
    end
end

--- 设置相机位置, 进行相机动画, 每帧调用一次(需要先开启摄像机插值)
--- @param player_name PlayerEnum 玩家名字
--- @param pos_x number 相机位置x
--- @param pos_y number 相机位置y
--- @param pos_z number 相机位置z
--- @param yaw number 相机旋转
--- @param pitch number 相机俯仰
--- @param roll number 相机滚转
CameraModule.set_player_follow = function(player_name, pos_x, pos_y, pos_z, yaw, pitch, roll)
    if type(player_name) ~= 'string' then
        LoggerModule.error('CameraModule.set_player_follow', 'player_name must be a string')
        return
    end
    if type(pos_x) ~= 'number' then
        LoggerModule.error('CameraModule.set_player_follow', 'pos_x must be a number')
        return
    end
    if type(pos_y) ~= 'number' then
        LoggerModule.error('CameraModule.set_player_follow', 'pos_y must be a number')
        return
    end
    if type(pos_z) ~= 'number' then
        LoggerModule.error('CameraModule.set_player_follow', 'pos_z must be a number')
        return
    end
    if type(yaw) ~= 'number' then
        LoggerModule.error('CameraModule.set_player_follow', 'yaw must be a number')
        return
    end
    if type(pitch) ~= 'number' then
        LoggerModule.error('CameraModule.set_player_follow', 'pitch must be a number')
        return
    end
    if type(roll) ~= 'number' then
        LoggerModule.error('CameraModule.set_player_follow', 'roll must be a number')
        return
    end
    exSetFollowCameraParam(player_name, pos_x, pos_y, pos_z, yaw, pitch, roll)
end

--- 设置相机位置
--- @param player_name PlayerEnum|nil 玩家名字, nil表示所有玩家
CameraModule.set_camera_pos = function(player_name, pos_x, pos_y, pos_z)
    if type(pos_x) ~= 'number' then
        LoggerModule.error('CameraModule.set_camera_pos', 'pos_x must be a number')
        return
    end
    if type(pos_y) ~= 'number' then
        LoggerModule.error('CameraModule.set_camera_pos', 'pos_y must be a number')
        return
    end
    if type(pos_z) ~= 'number' then
        LoggerModule.error('CameraModule.set_camera_pos', 'pos_z must be a number')
        return
    end
    if player_name == nil then
        exCameraAdjustPos(pos_x, pos_y, pos_z)
    elseif type(player_name) == 'string' then
        exCameraAdjustPosForPlayer(player_name, pos_x, pos_y, pos_z)
    else
        LoggerModule.error('CameraModule.set_camera_pos', 'player_name must be a string or nil')
    end
end

--- 设置相机位置
--- @param player_name PlayerEnum|nil 玩家名字, nil表示所有玩家
--- @param pos_vec Vector
CameraModule.set_camera_pos_by_vec = function(player_name, pos_vec)
    if type(pos_vec) ~= 'table' then
        LoggerModule.error('CameraModule.set_camera_pos_by_vec', 'pos must be a table')
        return
    end
    if getn(pos_vec) ~= 3 then
        LoggerModule.error('CameraModule.set_camera_pos_by_vec', 'pos must be a table with 3 elements')
        return
    end
    CameraModule.set_camera_pos(player_name, pos_vec[1], pos_vec[2], pos_vec[3])
end

--- 根据欧拉角旋转相机
--- @param player_name PlayerEnum|nil 玩家名字, nil表示所有玩家
--- @param yaw number
--- @param pitch number
--- @param roll number
CameraModule.rotate_by_euler = function(player_name, yaw, pitch, roll)
    if type(yaw) ~= 'number' then
        LoggerModule.error('CameraModule.rotate_by_euler', 'yaw must be a number')
        return
    end
    if type(pitch) ~= 'number' then
        LoggerModule.error('CameraModule.rotate_by_euler', 'pitch must be a number')
        return
    end
    if type(roll) ~= 'number' then
        LoggerModule.error('CameraModule.rotate_by_euler', 'roll must be a number')
        return
    end
    if player_name == nil then
        exCameraAdjustRotationBy(yaw)
        exCameraAdjustPitchBy(pitch)
        exCameraAdjustRollBy(roll)
    elseif type(player_name) == 'string' then
        exCameraAdjustRotationByForPlayer(player_name, yaw)
        exCameraAdjustPitchByForPlayer(player_name, pitch)
        exCameraAdjustRollByForPlayer(player_name, roll)
    else
        LoggerModule.error('player_name must be a string or nil')
    end
end

--- 相对于单位进行平移
--- @param player_name PlayerEnum|nil 玩家名字, nil表示所有玩家
--- @param x number
--- @param y number
--- @param z number
CameraModule.translate_relative = function(player_name, x, y, z)
    if type(x) ~= 'number' then
        LoggerModule.error('CameraModule.translate_relative', 'x must be a number')
        return
    end
    if type(y) ~= 'number' then
        LoggerModule.error('CameraModule.translate_relative', 'y must be a number')
        return
    end
    if type(z) ~= 'number' then
        LoggerModule.error('CameraModule.translate_relative', 'z must be a number')
        return
    end
    if player_name == nil then
        exCameraAdjustPosBy(x, y, z)
    elseif type(player_name) == 'string' then
        exCameraAdjustPosByForPlayer(player_name, x, y, z)
    else
        LoggerModule.error('player_name must be a string or nil')
    end
end


--- 设置相机角度(相对于{0,1,0})
--- @param player_name PlayerEnum|nil 玩家名字, nil表示所有玩家
--- @param yaw number | nil
--- @param pitch number | nil
--- @param roll number | nil
CameraModule.set_camera_rotation = function(player_name, yaw, pitch, roll)
    if yaw == nil and pitch == nil and roll == nil then
        LoggerModule.error('CameraModule.set_camera_rotation', 'yaw, pitch, roll must not all be nil')
        return
    end
    if yaw ~= nil and type(yaw) ~= 'number' then
        LoggerModule.error('CameraModule.set_camera_rotation', 'yaw must be a number or nil')
        return
    end
    if pitch ~= nil and type(pitch) ~= 'number' then
        LoggerModule.error('CameraModule.set_camera_rotation', 'pitch must be a number or nil')
        return
    end
    if roll ~= nil and type(roll) ~= 'number' then
        LoggerModule.error('CameraModule.set_camera_rotation', 'roll must be a number or nil')
        return
    end
    if player_name == nil then
        if yaw ~= nil then
            exCameraAdjustRotation(yaw)
        end
        if pitch ~= nil then
            exCameraAdjustPitch(pitch)
        end
        if roll ~= nil then
            exCameraAdjustRoll(roll)
        end
    elseif type(player_name) == 'string' then
        if yaw ~= nil then
            exCameraAdjustRotationForPlayer(player_name, yaw)
        end
        if pitch ~= nil then
            exCameraAdjustPitchForPlayer(player_name, pitch)
        end
        if roll ~= nil then
            exCameraAdjustRollForPlayer(player_name, roll)
        end
    else
        LoggerModule.error('CameraModule.set_camera_rotation', 'player_name must be a string or nil')
    end
end


-- TODO: test
--- 相机是否已经完成移动[7]
--- @return boolean
CameraModule.is_camera_moving_finished = function()
    return GameModule.from_ra3_boolean(EvaluateCondition("CAMERA_MOVEMENT_FINISHED"))
end

-- TODO: test
--- 相机是否已经完成跟随路径达到路径点[87]
--- @param waypoint_name string
--- @return boolean
CameraModule.is_camera_follow_path_and_arrived = function(waypoint_name)
    if type(waypoint_name) ~= 'string' then
        LoggerModule.error('CameraModule.is_camera_follow_path_and_arrived', 'waypoint_name must be a string')
        return false
    end
    return GameModule.from_ra3_boolean(EvaluateCondition("CAMERA_HIT_SPECIFIC_SPLINE_WAYPOINT", waypoint_name))
end

-- TODO: test
--- 相机是否已经进入区域[94]
--- @param area_name string
--- @return boolean
CameraModule.is_camera_in_area = function(area_name)
    if type(area_name) ~= 'string' then
        LoggerModule.error('CameraModule.is_camera_in_area', 'area_name must be a string')
        return false
    end
    return GameModule.from_ra3_boolean(EvaluateCondition("CAMERA_ENTERED_AREA", area_name))
end

-- TODO: test
--- 相机是否已经复位[132]
--- @return boolean
CameraModule.is_camera_reset = function()
    return GameModule.from_ra3_boolean(EvaluateCondition("CAMERA_RESET"))
end

--- 开启/关闭电影模式 (258)/(563)/(259)
--- @param is_enable boolean
--- @param with_radar boolean
CameraModule.enable_camera_letter_mode = function(is_enable, with_radar)
    if is_enable then
        if with_radar then
            ExecuteAction("CAMERA_LETTERBOX_BEGIN_WITH_RADAR") -- (258)
        else
            ExecuteAction("CAMERA_LETTERBOX_BEGIN") -- (563)
        end
    else
        ExecuteAction("CAMERA_LETTERBOX_END") -- (259)
    end
end

--- 开启/关闭辉光特效 (101) / (102)
--- @param is_enable boolean
CameraModule.enable_camera_bloom_effect = function(is_enable)
    if is_enable then
        ExecuteAction("CAMERA_BLOOM_EFFECT_BEGIN")
    else
        ExecuteAction("CAMERA_BLOOM_EFFECT_END")
    end
end

-- TODO: test
--- 重置相机, 到达指定路径点 (19)
--- @param waypoint_name string
--- @param duration number 总时长
--- @param ease_in number 开始移动时, 从静止到运动的时间
--- @param ease_out number 结束移动时, 从运动到静止的时间
CameraModule.reset_camera = function(waypoint_name, duration, ease_in, ease_out)
    if type(waypoint_name) ~= 'string' then
        LoggerModule.error('CameraModule.reset_camera', 'waypoint_name must be a string')
        return
    end
    if type(duration) ~= 'number' then
        LoggerModule.error('CameraModule.reset_camera', 'duration must be a number')
        return
    end
    if type(ease_in) ~= 'number' then
        LoggerModule.error('CameraModule.reset_camera', 'ease_in must be a number')
        return
    end
    if type(ease_out) ~= 'number' then
        LoggerModule.error('CameraModule.reset_camera', 'ease_out must be a number')
        return
    end
    ExecuteAction('RESET_CAMERA', waypoint_name, duration, ease_in, ease_out)
end