FreezeTimeModule = {}

--- 冻结时间, 所有单位原地不动 (22)/(114)/(115)
--- 不是真的冻结, 只是单位不动, 单位还是会移动; 恢复后显示在移动后的位置, 而不是冻结时的位置
--- @param is_enable boolean 是否启用冻结时间
--- @param only_for_camera_moving boolean 是否只用于相机移动
FreezeTimeModule.enable_freeze_time = function(is_enable, only_for_camera_moving)
    if is_enable then
        if only_for_camera_moving then
            ExecuteAction('CAMERA_MOD_FREEZE_TIME') -- (22)
        else
            ExecuteAction('FREEZE_TIME') -- (114)
        end
    else
        ExecuteAction('UNFREEZE_TIME') -- (115)
    end
end