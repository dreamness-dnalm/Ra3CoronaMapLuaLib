--- UnitTopTextModule.lua
--- Created by dreamness
--- DateTime: 10/14/2024 10:42 PM
---

--- 控制单位顶部文字

UnitTopTextModule = {}

--- @param object_id number 对象id
--- @param content string 文字内容
--- @param z_offset number z轴偏移量
--- @param color number 颜色 (十进制) 请使用ColorUtil进行转换
--- @param player_name_list string|string[]|nil 玩家名字列表
UnitTopTextModule.set_or_update = function(object_id, content, z_offset, color, player_name_list)
    if type(object_id) ~= 'number' then
        LoggerModule.error('UnitTopTextModule.set_or_update', 'object_id is not a number, object_id=' .. tostring(object_id))
        return
    end

    if type(content) ~= 'string' then
        LoggerModule.error('UnitTopTextModule.set_or_update', 'content is not a string, content=' .. tostring(content))
        return
    end

    if type(z_offset) ~= 'number' then
        LoggerModule.error('UnitTopTextModule.set_or_update', 'z is not a number, z=' .. tostring(z_offset))
        return
    end

    if type(color) ~= 'number' then
        LoggerModule.error('UnitTopTextModule.set_or_update', 'color is not a number, color=' .. tostring(color))
        return
    end

    if player_name_list == nil then
        exObjectShowTextAtTop(object_id, content, z_offset, color)
        exObjectUpdateTextAtTop(object_id, content, z_offset, color)
    elseif type(player_name_list) == 'table' then
        for i = 1, getn(player_name_list) do
            if type(player_name_list[i]) ~= 'string' then
                LoggerModule.warn('UnitTopTextModule.set_or_update', 'player_name_list element type error:' .. type(player_name_list[i]))
            else
                exObjectShowTextAtTopForPlayer(player_name_list[i], object_id, content, z_offset, color)
                exObjectUpdateTextAtTopForPlayer(player_name_list[i], object_id, content, z_offset, color)
            end
        end
    elseif type(player_name_list) == 'string' then
        exObjectShowTextAtTopForPlayer(player_name_list, object_id, content, z_offset, color)
        exObjectUpdateTextAtTopForPlayer(player_name_list, object_id, content, z_offset, color)
    end
end

-- -- TODO: 等待修复
-- --- 删除单位顶部文字
-- --- @param object_id number 对象id
-- --- @param player_name_list string|string[]|nil 玩家名字列表
-- UnitTopTextModule.remove = function(object_id, player_name_list)
--     if type(object_id) ~= 'number' then
--         LoggerModule.error('UnitTopTextModule.delete', 'object_id is not a number, object_id=' .. tostring(object_id))
--         return
--     end
--     if type(player_name_list) ~= 'string' and player_name_list ~= nil and type(player_name_list) ~= 'table' then
--         LoggerModule.error('UnitTopTextModule.delete', 'player_name_list type error:' .. type(player_name_list))
--         return
--     end
--     if player_name_list == nil then
--         exObjectDeleteTextAtTop(object_id)
--     elseif type(player_name_list) == 'table' then
--         for i = 1, getn(player_name_list) do
--             if type(player_name_list[i]) ~= 'string' then
--                 LoggerModule.warn('UnitTopTextModule.delete', 'player_name_list element type error:' .. type(player_name_list[i]))
--             else
--                 exObjectDeleteTextAtTopForPlayer(player_name_list[i], object_id)
--             end
--         end
--     elseif type(player_name_list) == 'string' then
--             exObjectDeleteTextAtTopForPlayer(player_name_list, object_id)
--     end
-- end

--- 显示浮动整数数字
--- @param object_id number 对象id
--- @param value number 数值
UnitTopTextModule.show_float_int_number = function(object_id, value)
    if type(object_id) ~= 'number' then
        LoggerModule.error('UnitTopTextModule.show_float_int_number', 'object_id is not a number, object_id=' .. tostring(object_id))
        return
    end
    if type(value) ~= 'number' then
        LoggerModule.error('UnitTopTextModule.show_float_int_number', 'value is not a number, value=' .. tostring(value))
        return
    end
    exShowFloatingIntAtObject(object_id, value)
end