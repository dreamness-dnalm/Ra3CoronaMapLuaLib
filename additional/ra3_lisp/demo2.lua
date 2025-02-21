
-- LISP解释器核心组件
local env = {
    ["+"] = function(args) return args + args end,
    ["-"] = function(args) return args - args end,
    ["*"] = function(args) return args * args end,
    ["/"] = function(args) return args / args end,
    ["print"] = function(args) print(args) return args end
}

function tokenize(s)
    local tokens = {}
    local i = 1
    while i <= string.len(s) do
        local c = string.sub(s, i, i)
        if c == '(' or c == ')' then
            tinsert(tokens, c)
            i = i + 1
        elseif c == ' ' or c == '\t' or c == '\n' then
            i = i + 1
        else
            local start = i
            while i <= string.len(s) do
                local c = string.sub(s, i, i)
                if c == '(' or c == ')' or c == ' ' or c == '\t' or c == '\n' then
                    break
                end
                i = i + 1
            end
            tinsert(tokens, string.sub(s, start, i-1))
        end
    end
    return tokens
end

function parse(tokens)
    local pos = 1
    local function walk()
        local token = tokens[pos]
        pos = pos + 1
        
        if token == '(' then
            local node = {}
            while tokens[pos] ~= ')' do
                table.insert(node, walk())
            end
            pos = pos + 1
            return node
        elseif token == ')' then
            error("unexpected )")
        else
            return tonumber(token) or token
        end
    end
    return walk()
end

function eval(exp, env)
    if type(exp) == "number" then
        return exp
    elseif type(exp) == "string" then
        return env[exp]
    elseif type(exp) == "table" then
        if exp == "define" then
            local _, name, value = unpack(exp)
            env[name] = eval(value, env)
            return env[name]
        elseif exp == "lambda" then
            return {
                type = "lambda",
                params = exp,
                body = exp,
                env = env
            }
        else
            local fn = eval(exp, env)
            local args = {}
            for i=2, #exp do
                table.insert(args, eval(exp[i], env))
            end
            
            if type(fn) == "function" then
                return fn(args)
            elseif fn.type == "lambda" then
                local new_env = {}
                for k,v in pairs(fn.env) do new_env[k] = v end
                for i,param in ipairs(fn.params) do
                    new_env[param] = args[i]
                end
                return eval(fn.body, new_env)
            end
        end
    end
end

-- 使用示例
local code = "(begin (define a 1) (define b (+ a 2)) (print b))"
local tokens = tokenize(code)
local ast = parse(tokens)
eval(ast, env)  -- 输出3