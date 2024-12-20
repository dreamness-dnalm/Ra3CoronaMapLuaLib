--- FP.lua
--- Created by dreamness
--- DateTime: 10/19/2024 12:32 AM
---

--- 这是一个实验性的模块, 为库带来一些函数式编程的可能性
FP = {}

-- TODO: test
--- map
--- @param t table
--- @param func function
--- @return table
FP.map = function(t, func)
    if type(t) ~= "table" then
        LoggerModule.error("FP.map", "t must be a table, actual: " .. type(t))
        return {}
    end
    if type(func) ~= "function" then
        LoggerModule.error("FP.map", "func must be a function, actual: " .. type(func))
        return {}
    end
    local new_table = {}
    for i = 1, getn(t) do
        tinsert(new_table, func(t[i]))
    end
    return new_table
end

-- TODO: test
--- foreach
--- @param t table
--- @param func function
FP.foreach = function(t, func)
    if type(t) ~= "table" then
        LoggerModule.error("FP.foreach", "t must be a table, actual: " .. type(t))
        return
    end
    if type(func) ~= "function" then
        LoggerModule.error("FP.foreach", "func must be a function, actual: " .. type(func))
        return
    end
    for i = 1, getn(t) do
        func(t[i])
    end
end

-- TODO: test
--- filter
--- @param t table
--- @param func function
--- @return table
FP.filter = function(t, func)
    if type(t) ~= "table" then
        LoggerModule.error("FP.filter", "t must be a table, actual: " .. type(t))
        return {}
    end
    if type(func) ~= "function" then
        LoggerModule.error("FP.filter", "func must be a function, actual: " .. type(func))
        return {}
    end
    local new_table = {}
    for i = 1, getn(t) do
        if func(t[i]) then
            tinsert(new_table, t[i])
        end
    end
    return new_table
end


-- TODO: test
--- fold_left
--- @param t table
--- @param func function
--- @param init any
--- @return any
FP.fold_left = function(t, func, init)
    if type(t) ~= "table" then
        LoggerModule.error("FP.fold_left", "t must be a table, actual: " .. type(t))
        return init
    end
    if type(func) ~= "function" then
        LoggerModule.error("FP.fold_left", "func must be a function, actual: " .. type(func))
        return init
    end
    local acc = init
    for i = 1, getn(t) do
        acc = func(acc, t[i])
    end
    return acc
end

-- TODO: test
--- fold_right
--- @param t table
--- @param func function
--- @param init any
--- @return any
FP.fold_right = function(t, func, init)
    if type(t) ~= "table" then
        LoggerModule.error("FP.fold_right", "t must be a table, actual: " .. type(t))
        return init
    end
    if type(func) ~= "function" then
        LoggerModule.error("FP.fold_right", "func must be a function, actual: " .. type(func))
        return init
    end

    local acc = init
    for i = getn(t), 1, -1 do
        acc = func(acc, t[i])
    end
    return acc
end

-- TODO: test
--- reduce
--- @param t table
--- @param func function
--- @return any
FP.reduce = function(t, func)
    if type(t) ~= "table" then
        LoggerModule.error("FP.reduce", "t must be a table, actual: " .. type(t))
        return nil
    end
    if type(func) ~= "function" then
        LoggerModule.error("FP.reduce", "func must be a function, actual: " .. type(func))
        return nil
    end
    local len = getn(t)
    if len == 0 then
        return nil
    end
    local acc = t[1]
    for i = 2, len do
        acc = func(acc, t[i])
    end
    return acc
end