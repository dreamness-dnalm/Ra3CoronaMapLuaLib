SerializeUtil = {}

-- TODO: doc
--- 序列化函数, 不支持function和userdata
--- @param v any 要序列化的值
--- @return string|nil 序列化后的字符串，失败时返回nil
--- @return boolean 是否序列化成功 (1: 成功, nil: 失败)
--- @return string 错误原因，成功时返回空字符串
SerializeUtil.serialize = function (v)
    local tagValue = tag(v)
    
    if tagValue == 1 or tagValue == 2 or tagValue == 6 then
        return tostring(v), 1, ""
    end
    
    -- 处理string (tag = 3)
    if tagValue == 3 then
        -- 转义特殊字符，注意顺序很重要
        local escaped = gsub(v, '\\', '\\\\')  -- 先转义反斜杠
        escaped = gsub(escaped, '"', '\\"')    -- 再转义双引号
        escaped = gsub(escaped, '\n', '\\n')   -- 转义换行符
        escaped = gsub(escaped, '\t', '\\t')   -- 转义制表符
        return '"' .. escaped .. '"', 1, ""
    end
    
    -- 处理table (tag = 4)
    if tagValue == 4 then
        local result = "{"
        local first = 1  -- 在lua4中，1表示true
        
        local key, value = next(v)
        while key do
            -- 跳过nil key
            if key ~= nil then
                if not first then  
                    result = result .. ","
                end
                first = nil  -- 设置为false
                
                -- 序列化key
                local keyStr
                if tag(key) == 3 then  -- string类型
                    keyStr = '["' .. gsub(key, '"', '\\"') .. '"]'
                else
                    local keyResult, keySuccess, keyError = SerializeUtil.serialize(key)
                if not keySuccess then
                    return nil, nil, "Failed to serialize key: " .. keyError
                end
                    keyStr = "[" .. keyResult .. "]"
                end
                
                -- 序列化value
                local valueStr, valueSuccess, valueError = SerializeUtil.serialize(value)
                if not valueSuccess then
                    return nil, nil, "Failed to serialize value: " .. valueError
                end
                
                result = result .. keyStr .. "=" .. valueStr
            end
            
            key, value = next(v, key)
        end
        
        result = result .. "}"
        return result, 1, ""
    end
    
    -- 处理userdata (tag = 0) 和 function (tag = 5) - 返回错误信息
    if tagValue == 0 then
        return nil, nil, "Cannot serialize userdata type"
    end
    if tagValue == 5 then
        return nil, nil, "Cannot serialize function type"
    end
    
    -- 其他类型
    return nil, nil, "Unsupported tag: " .. tagValue
end




-- TODO: doc
--- 反序列化
--- @param s string 序列化后的字符串
--- @return any 反序列化后的值
SerializeUtil.deserialize = function(s)
    return dostring("return " .. s)
end