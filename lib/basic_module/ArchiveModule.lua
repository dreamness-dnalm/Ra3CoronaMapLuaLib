ArchiveModule = {}

ArchiveModule.__custom_auto_load_lua_files = {}

ArchiveModule.__last_load_data_frame_num = nil

if  GetFrame() > 1 then
    ArchiveModule.__last_load_data_frame_num = GetFrame()
    exEnableWBScript("LuaLibAutoLoadRunner.lua")
end

-- TODO: doc
--- 添加自动加载的lua文件
--- @param lua_script_names string|table 要添加的lua文件名或文件名列表
ArchiveModule.set_auto_load_lua_files = function(lua_script_names)
    if type(lua_script_names) == "table" then
        ArchiveModule.__custom_auto_load_lua_files = lua_script_names
    
    elseif type(lua_script_names) == "string" then
        ArchiveModule.__custom_auto_load_lua_files = {lua_script_names}
    else
    logger.error("ArchiveModule.set_auto_load_lua_files", "lua_script_names is not a table or string")
    end
end

-- TODO: doc
--- 设置保存数据函数
--- @param save_data_function function 保存数据函数 没有参数, 返回值为table(需要保存的数据)
ArchiveModule.set_save_data_function = function(save_data_function)
    ArchiveModule.__save_data_function = save_data_function
end

-- TODO: doc
--- 获取保存的数据
--- @return any 保存的数据, 如果没有保存数据则返回nil
ArchiveModule.fetch_and_clean_saved_data = function()
    local res = ArchiveModule.__custom_saved_data
    ArchiveModule.__custom_saved_data = nil
    return res
end

-- TODO: test, doc
--- 禁用保存功能 (不可逆)
ArchiveModule.disable_save_feature = function()
    LuaLib_DisableSaveFeature = true
    exDisableWBScript("lua_lib_auto_load.lua")
end

-- TODO: test, doc
--- 允许/禁止保存功能 (默认允许)
--- @param is_allow boolean 是否允许玩家保存
ArchiveModule.allow_save = function(is_allow)
    LuaLib_TemporaryForbidSaveFeature = not is_allow
end

-- TODO: test
--- 设置回调函数, 在触发保存时调用
--- @param func function 没有参数
ArchiveModule.set_save_data_callback = function(func)
    ArchiveModule.__save_data_callback = func
end

--- 获取上一次加载数据的时间帧序号
--- @return number 上一次加载数据的时间帧序号, 如果没有加载数据则返回nil
ArchiveModule.get_last_load_data_frame_number = function()
    return ArchiveModule.__last_load_data_frame_num
end


--- 加载数据 (内部函数)
ArchiveModule.__load_data = function()
    if SavedGameDataTable == nil then
        return
    end
    local lua_lib_data_str = SavedGameDataTable[1]
    local custom_data_str = SavedGameDataTable[2]
    SavedGameDataTable = nil

    if lua_lib_data_str ~= nil then
        local lua_lib_data = SerializeUtil.deserialize( lua_lib_data_str)
        UnitHelper.__unit_auto_number = lua_lib_data.__unit_auto_number
        ArchiveModule.__custom_auto_load_lua_files = lua_lib_data.__custom_auto_load_lua_files
    end

    -- 执行用户的静态数据

    for i = 1, getn(ArchiveModule.__custom_auto_load_lua_files) do
        exEnableWBScript(ArchiveModule.__custom_auto_load_lua_files[i])
    end


    if custom_data_str ~= nil then
        local custom_data = SerializeUtil.deserialize( custom_data_str)
        ArchiveModule.__custom_saved_data = custom_data
    else
        ArchiveModule.__custom_saved_data = nil
    end
end

-- globals().OnSaveGame = function (data)
function OnSaveGame(data)
    logger.warn("ArchiveModule.OnSaveGame", "OnSaveGame start")
    if ArchiveModule.__save_data_callback then
        ArchiveModule.__save_data_callback()
    end

    if LuaLib_DisableSaveFeature then
        logger.warn("ArchiveModule.OnSaveGame", "OnSaveGame end, return false because LuaLib_DisableSaveFeature is true")
        return false
    end

    if LuaLib_TemporaryForbidSaveFeature then
        logger.warn("ArchiveModule.OnSaveGame", "OnSaveGame end, return false because LuaLib_TemporaryForbidSaveFeature is true")
        return false
    end


    -- 存储lua库内部的变量
    -- TODO: EventHelper 和 DialogModule中的变量是否需要保存?
    local lua_lib_data = {
        __unit_auto_number = UnitHelper.__unit_auto_number,
        __custom_auto_load_lua_files = ArchiveModule.__custom_auto_load_lua_files,
    }

    local lua_lib_data_str, lua_lib_data_success, lua_lib_data_error = SerializeUtil.serialize( lua_lib_data)


    if not lua_lib_data_success then
        logger.error("ArchiveModule.OnSaveGame", "OnSaveGame end, return false because failed to serialize lua_lib_data: " .. tostring(lua_lib_data_error))
        return false
    end


    tinsert(data, lua_lib_data_str)


    local custom_data = ArchiveModule.__save_data_function()


    local custom_data_str, custom_data_success, custom_data_error = SerializeUtil.serialize( custom_data)

    if not custom_data_success then
        logger.error("ArchiveModule.OnSaveGame", "OnSaveGame end, return false because failed to serialize custom_data: " .. tostring(custom_data_error))
        return false
    end


    tinsert(data, custom_data_str)


    logger.warn("ArchiveModule.OnSaveGame", "OnSaveGame end, return true")

    return true
end
