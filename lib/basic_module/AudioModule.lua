AudioModule = {}

-- ------------------ 音效 ------------------

-- TODO: test
--- 是否正在播放音效 [43]
--- @param sound_name SoundEnum 音效名称
--- @return boolean
AudioModule.is_playing_sound = function(sound_name)
    if type(sound_name) ~= 'string' then
        LoggerModule.error('AudioModule.is_playing_sound', 'sound_name must be a string')
        return
    end
    return not GameModule.from_ra3_boolean(EvaluateCondition('HAS_FINISHED_AUDIO', sound_name))
end

-- TODO: test
--- 设置音效音量 (178)/(179)/(180)/(240)
--- @param sound_name SoundEnum | nil 音效名称, nil表示全局音量
--- @param volume number|nil 音量, 0-100, nil表示恢复默认音量
AudioModule.set_sound_volume = function(sound_name, volume)
    if type(sound_name) ~= 'string' and sound_name ~= nil then
        LoggerModule.error('AudioModule.set_sound_volume', 'sound_name must be a string or nil')
        return
    end
    if type(volume) ~= 'number' and volume ~= nil then
        LoggerModule.error('AudioModule.set_sound_volume', 'volume must be a number or nil')
        return
    end
    if type(volume) == 'number' then
        if volume < 0 or volume > 100 then
            LoggerModule.error('AudioModule.set_sound_volume', 'volume must be between 0 and 100')
            return
        end
        if sound_name == nil then
            ExecuteAction('SOUND_SET_VOLUME', volume) -- (240)
        else
            ExecuteAction('AUDIO_OVERRIDE_VOLUME_TYPE', sound_name, volume) -- (178)
        end
    else
        if sound_name == nil then
            ExecuteAction('AUDIO_RESTORE_VOLUME_ALL_TYPE', volume) -- (180)
        else
            ExecuteAction('AUDIO_RESTORE_VOLUME_TYPE', sound_name, volume) -- (179)
        end
    end
end


-- TODO: test
--- 移除音效 (245)
--- @param sound_name SoundEnum 音效名称
AudioModule.remove_sound = function(sound_name)
    if type(sound_name) ~= 'string' then
        LoggerModule.error('AudioModule.remove_sound', 'sound_name must be a string')
        return
    end
    ExecuteAction('SOUND_REMOVE_TYPE', sound_name) -- (245)
end

-- TODO: test
--- 启用/禁用音效 (175)/(176)/(177)
--- @param sound_name SoundEnum | nil 音效名称, nil表示所有音效, 只能用于启用所有音效, 不能用于禁用所有音效
--- @param is_enable boolean 是否启用 (真: 启用, 假: 禁用)
AudioModule.enable_sound = function(sound_name, is_enable)
    if type(sound_name) ~= 'string' and sound_name ~= nil then
        LoggerModule.error('AudioModule.enable_sound', 'sound_name must be a string or nil')
        return
    end
    if type(is_enable) ~= 'boolean' then
        LoggerModule.error('AudioModule.enable_sound', 'is_enable must be a boolean')
        return
    end

    if sound_name == nil then
        if is_enable then
            ExecuteAction('SOUND_ENABLE_ALL') -- (177)
        else
            LoggerModule.error('AudioModule.enable_sound', 'sound_name cannot be nil when is_enable is nil')
            return
        end
    else
        if is_enable then
            ExecuteAction('SOUND_ENABLE_TYPE', sound_name) -- (176)
        else
            ExecuteAction('SOUND_DISABLE_TYPE', sound_name) -- (175)
        end
    end
end

-- TODO: test
--- 启用/触发/禁用环境音 （86)/(85)/(255)/(256)
--- @param is_enable boolean 是否启用 (真: 启用/触发, 假: 禁用)
--- @param unit_table_or_name SystemUnitTable | string | nil nil表示全局环境音
AudioModule.enable_unit_ambient_sound = function(unit_table_or_name, is_enable)
    if type(unit_table_or_name) ~= 'table' and type(unit_table_or_name) ~= 'string' and unit_table_or_name ~= nil then
        LoggerModule.error('AudioModule.enable_unit_ambient_sound', 'unit_table_or_name must be a table or string or nil')
        return
    end
    if unit_table_or_name == nil then
        if is_enable then
            ExecuteAction('SOUND_AMBIENT_RESUME') -- (86)
        else
            ExecuteAction('SOUND_AMBIENT_PAUSE') -- (85)
        end
    else
        if is_enable then
            ExecuteAction('ENABLE_OBJECT_SOUND', unit_table_or_name) -- (255)
        else
            ExecuteAction('DISABLE_OBJECT_SOUND', unit_table_or_name) -- (256)
        end
    end
end

-- TODO: test
--- 播放音效 后三个参数全部为nil, 或只能有一个不为nil (7)/(74)/(11)/(385)
--- @param sound_name SoundEnum 音效名称
--- @param from_unit_table_or_name SystemUnitTable | string | nil 播放音效的单位
--- @param from_waypoint_name string | nil 播放音效的路径点
--- @param from_team_name string | nil 播放音效的队伍
AudioModule.play_sound = function(sound_name, from_unit_table_or_name, from_waypoint_name, from_team_name)
    if type(sound_name) ~= 'string' then
        LoggerModule.error('AudioModule.play_sound', 'sound_name must be a string')
        return
    end
    if type(from_unit_table_or_name) ~= 'table' and type(from_unit_table_or_name) ~= 'string' and from_unit_table_or_name ~= nil then
        LoggerModule.error('AudioModule.play_sound', 'from_unit_table_or_name must be a table or string or nil')
        return
    end
    if type(from_waypoint_name) ~= 'string' and from_waypoint_name ~= nil then
        LoggerModule.error('AudioModule.play_sound', 'from_waypoint_name must be a string or nil')
        return
    end
    if type(from_team_name) ~= 'string' and from_team_name ~= nil then
        LoggerModule.error('AudioModule.play_sound', 'from_team_name must be a string or nil')
        return
    end
    if from_unit_table_or_name == nil and from_waypoint_name == nil and from_team_name == nil then
        ExecuteAction('PLAY_SOUND_EFFECT', sound_name) -- (7)
    elseif from_unit_table_or_name ~= nil and from_waypoint_name == nil and from_team_name == nil then
        ExecuteAction('SOUND_PLAY_NAMED', sound_name, from_unit_table_or_name) -- (74)
    elseif from_unit_table_or_name == nil and from_waypoint_name ~= nil and from_team_name == nil then
        ExecuteAction('PLAY_SOUND_EFFECT_AT', sound_name, from_waypoint_name) -- (11)
    elseif from_unit_table_or_name == nil and from_waypoint_name == nil and from_team_name ~= nil then
        ExecuteAction('PLAY_SOUND_EFFECT_AT_TEAM', sound_name, from_team_name) -- (385)
    else
        LoggerModule.error('AudioModule.play_sound', 'only one of from_unit_table_or_name, from_waypoint_name, from_team_name can be not nil')
        return
    end
end

-- TODO: test
--- 启用/禁用背景音效 (25)/(24)
AudioModule.enable_background_sound = function(is_enable)
    if is_enable then
        ExecuteAction('RESUME_BACKGROUND_SOUNDS') -- (25)
    else
        ExecuteAction('SUSPEND_BACKGROUND_SOUNDS') -- (24)
    end
end

-- ------------------ EVA 音效 ------------------

-- TODO: test
--- 启用/禁用 EVA (221)
--- @param is_enable boolean 是否启用
AudioModule.enable_eva = function(is_enable)
    ExecuteAction('EVA_SET_ENABLED_DISABLED', GameModule.to_ra3_boolean(is_enable)) -- (221)
end

-- TODO: test
--- 播放EVA音效, 后两个参数为选填项, 显示字幕 (570)/(569)/(497)/(496)
--- @param sound_name EvaSoundEnum EVA音效名称
--- @param boolean is_from_ai_commander 是否来自AI指挥官 (假: 来源于EVA)
--- @param map_str_key string | nil 字幕内容的key(在map.str中定义)
--- @param duration number | nil 字幕持续时间(秒) 
AudioModule.play_eva_sound = function(sound_name, is_from_ai_commander, map_str_key, duration)
    if type(sound_name) ~= 'string' then
        LoggerModule.error('AudioModule.play_eva_sound', 'sound_name must be a string')
        return
    end
    if type(is_from_ai_commander) ~= 'boolean' then
        LoggerModule.error('AudioModule.play_eva_sound', 'is_from_ai_commander must be a boolean')
        return
    end
    if type(map_str_key) ~= 'string' and map_str_key ~= nil then
        LoggerModule.error('AudioModule.play_eva_sound', 'map_str_key must be a string or nil')
        return
    end
    if type(duration) ~= 'number' and duration ~= nil then
        LoggerModule.error('AudioModule.play_eva_sound', 'duration must be a number or nil')
        return
    end
    if is_from_ai_commander then
        if map_str_key == nil and duration == nil then
            ExecuteAction('PLAY_SOUND_AS_AI_COCOMMANDER_DIALOG', sound_name) -- (569)
        elseif map_str_key ~= nil and duration ~= nil then
            ExecuteAction('PLAY_SOUND_AS_AI_COCOMMANDER_DIALOG_WITH_SUBTITLE', sound_name, map_str_key, duration) -- (570)
        else
            LoggerModule.error('AudioModule.play_eva_sound', 'map_str_key and duration must be both nil or both not nil')
            return
        end
    else
        if map_str_key == nil and duration == nil then
            ExecuteAction('PLAY_SOUND_AS_IF_IT_WAS_AN_EVA_EVENT', sound_name) -- (496)
        elseif map_str_key ~= nil and duration ~= nil then
            ExecuteAction('PLAY_SOUND_AS_IF_IT_WAS_AN_EVA_EVENT_WITH_SUBTITLE', sound_name, map_str_key, duration) -- (497)
        else
            LoggerModule.error('AudioModule.play_eva_sound', 'map_str_key and duration must be both nil or both not nil')
            return
        end
    end
end

-- ------------------ 音乐 ------------------

-- TODO: test
--- 是否正在播放音乐 (使用脚本进行播放) [104]
--- @return boolean
AudioModule.is_music_play_finished = function()
    return GameModule.from_ra3_boolean(EvaluateCondition('MUSIC_IS_PLAYING_FROM_SCRIPT'))
end

-- TODO: test
--- 将音乐加入播放列表 (105)