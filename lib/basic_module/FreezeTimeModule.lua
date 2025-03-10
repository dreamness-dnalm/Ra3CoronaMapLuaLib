FreezeTimeModule = {}

-- TODO: test
--- 冻结时间, 所有单位原地不动 (26)/(114)/(115)
--- @param is_enable boolean 是否启用冻结时间
--- @param only_for_camera_moving boolean 是否只用于相机移动
FreezeTimeModule.enable_freeze_time = function(is_enable, only_for_camera_moving)
    if is_enable then
        if only_for_camera_moving then
            ExecuteAction('CAMERA_MOD_FREEZE_TIME') -- (26)
        else
            ExecuteAction('FREEZE_TIME') -- (114)
        end
    else
        ExecuteAction('UNFREEZE_TIME') -- (115)
    end
end