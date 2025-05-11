--- UI模块
UIModule = {}

--- 设置右下角技能ui是否可见
--- @param visible boolean 是否可见
UIModule.set_skill_ui_visible = function(visible)
    if visible then
        exAptShowObjectDetailsArea()
    else
        exAptHideObjectDetailsArea()
    end
end

--- 设置左下角协议按钮是否可见
UIModule.set_protocol_button_visible = function(visible)
    if visible then
        exAptShowPlayerTechButton()
    else
        exAptHidePlayerTechButton()
    end
end

--- 启用/禁用玩家输入(鼠标/键盘) (84) / (83)
--- 慎用, esc也不能用了
--- @param enable boolean
UIModule.enable_input = function(enable)
    if enable then
        ExecuteAction("ENABLE_INPUT") -- (84)
    else
        ExecuteAction("DISABLE_INPUT") -- (83)
    end
end

--- 显示单位介绍 (561)
--- @param thing ThingEnum
UIModule.show_unit_intro = function(thing)
    ExecuteAction("SHOW_UNIT_INTRO", thing) -- (561)
end

--- 启用/禁用 协作命令面板 (522)
--- 面板会变灰, 但是不会消失
--- @param enable boolean
UIModule.enable_coop_command_panel = function(enable)
    ExecuteAction("SET_COOP_AI_COMMAND_UI_ENABLED", GameModule.to_ra3_boolean(enable)) -- (522)
end

--- 设置所有ui是否可见 (264) / (263)
--- @param visible boolean
UIModule.set_all_ui_visible = function(visible)
    if visible then
        ExecuteAction("SHOW_UI") -- (264)
    else
        ExecuteAction("HIDE_UI")    -- (263)
    end
end
