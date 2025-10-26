
-- LuaLib_DisableSaveFeature 
-- if true, then the lua lib will never take over the save feature

if LuaLib_DisableSaveFeature then
    exDisableWBScript("lua_lib_auto_load.lua")
end


if _meta == nil then
    local libs = {
{{LIB_FILES}}
    }

    for i = 1, getn(libs) do
        exEnableWBScript(libs[i])
    end
end

