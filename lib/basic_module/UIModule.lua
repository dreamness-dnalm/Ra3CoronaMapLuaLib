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

-- TODO: test
--- 设置左下角协议按钮是否可见
UIModule.set_protocol_button_visible = function(visible)
    if visible then
        exAptHidePlayerTechButton()
    else
        exAptShowPlayerTechButton()
    end
end

-- TODO: test 
--- 启用/禁用玩家输入(鼠标/键盘) (84) / (83)
--- @param enable boolean
UIModule.enable_input = function(enable)
    if enable then
        ExecuteAction("ENABLE_INPUT") -- (84)
    else
        ExecuteAction("DISABLE_INPUT") -- (83)
    end
end

-- TODO: test
--- 显示单位介绍 (561)
--- @param thing ThingEnum
UIModule.show_unit_intro = function(thing)
    ExecuteAction("SHOW_UNIT_INTRO") -- (561)
end

-- TODO: test
--- 启用/禁用 协作命令面板 (522)
--- @param enable boolean
UIModule.enable_coop_command_panel = function(enable)
    ExecuteAction("SET_COOP_AI_COMMAND_UI_ENABLED", GameModule.to_ra3_boolean(enable)) -- (522)
end

-- TODO: test
--- 启用/禁用 ai协作界面 (567)
--- @param player_name PlayerEnum
--- @param enable boolean
UIModule.enable_ai_coop_ui = function(player_name, enable)
    if type(player_name) ~= "string" then
        LoggerModule.error("UIModule.enable_ai_coop_ui", "player_name must be a string")
    end
    ExecuteAction("PLAYER_ALLOWED_TOBE_COOPAI", player_name, GameModule.to_ra3_boolean(enable)) -- (567)
end