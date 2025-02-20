-- Lisp 解释器实现
function new_env(parent)
    local env = { parent = parent, vars = {} }
    env["nil"] = nil
    return env
end

global_env = new_env(_G) -- 继承 Lua 全局环境

function lookup_var(env, name)
    while env do
        if env.vars[name] ~= nil then
            return env.vars[name]
        end
        env = env.parent
    end
    return nil
end

function eval(expr, env)
    if type(expr) == "table" then
        -- 列表求值
        local first = expr[1]
        
        -- 特殊形式处理
        if first == "def" then
            local name = expr[2]
            local value = eval(expr[3], env)
            env.vars[name] = value
            return value
        elseif first == "fn" then
            local params = expr[2]
            local body = expr[3]
            return function(...)
                local args = arg
                local new_env = new_env(env)
                for i=1,getn(params) do
                    new_env.vars[params[i]] = args[i]
                end
                return eval(body, new_env)
            end
        elseif first == "if" then
            local cond = eval(expr[2], env)
            if cond then
                return eval(expr[3], env)
            else
                return eval(expr[4], env)
            end
        else
            -- 函数调用
            local f = eval(first, env)
            local args = {}
            for i=2,getn(expr) do
                tinsert(args, eval(expr[i], env))
            end
            return f(unpack(args))
        end
    elseif type(expr) == "string" then
        -- 变量查找
        local val = lookup_var(env, expr)
        if val == nil then
            error("Undefined variable: "..expr)
        end
        return val
    else
        -- 字面量
        return expr
    end
end

-- Lisp 解析器
function parse(str)
    local tokens = {}
    str = gsub(str, "(%()", " %1 ")
    str = gsub(str, "(%))", " %1 ")
    str = gsub(str, "\"", " \" ")
    
    for token in strgfind(str, "[^ \t\n\r]+") do
        if token == "(" then
            tinsert(tokens, { tag = "list_start" })
        elseif token == ")" then
            tinsert(tokens, { tag = "list_end" })
        else
            -- 识别数据类型
            local num = tonumber(token)
            if token == "nil" then
                tinsert(tokens, nil)
            elseif num then
                tinsert(tokens, num)
            elseif strsub(token, 1, 1) == "\"" then
                tinsert(tokens, gsub(token, "\"", ""))
            else
                tinsert(tokens, token)
            end
        end
    end
    
    local stack = {}
    local current = {}
    tinsert(stack, current)
    
    for _,token in ipairs(tokens) do
        if type(token) == "table" then
            if token.tag == "list_start" then
                local new_list = {}
                tinsert(current, new_list)
                tinsert(stack, current)
                current = new_list
            else
                current = tremove(stack)
            end
        else
            tinsert(current, token)
        end
    end
    
    return current[1]
end

-- REPL 交互
function repl(input)

        if input == "exit" then break end
        
        local ok, result = pcall(function()
            local parsed = parse(input)
            return eval(parsed, global_env)
        end)
        
        if ok then
            if result == nil then
                print("nil")
            else
                print(result)
            end
        else
            print("Error: "..result)
        end
end

-- 测试示例
print("Simple Lisp interpreter (Lua 4)")
print("Try: (def add (fn (a b) (+ a b)))")
print("Then: (add 3 4)")
repl("(def add (fn (a b) (+ a b)))")
repl("(add 3 4)")