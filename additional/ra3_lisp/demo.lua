

function __analyse_token(token)
    if token == '(' then
        return {token_value='(', token_type='left_bracket'}
    elseif token == ')' then
        return {token_value=')', token_type='right_bracket'}
    elseif token == 'nil' then
        return {token_value=nil, token_type='nil'}
    else
        local num = tonumber(token)
        if num ~= nil then
            return {token_value=num, token_type='number'}
        else
            return {token_value=token, token_type='symbol'}
        end
    end
end


function tokenize(cmd)
    local tokens = {}

    local loading_str = ''
    local loading_status = nil -- nil, 'string', 'other'
    local string_quote = nil
    
    for i = 1, strlen(cmd) do
        local curr_char = strsub(cmd, i, i)
        if curr_char == '\n' or curr_char == '\t' or curr_char == '\r' then
            curr_char = ' '
        end
        if loading_status == nil then
            if curr_char == '(' then
                tinsert(tokens, {token_value='(', token_type='left_bracket'})
            elseif curr_char == ')' then
                tinsert(tokens, {token_value=')', token_type='right_bracket'})
            elseif curr_char == ' ' then
                -- do nothing
            elseif curr_char == '"' then
                loading_str = ''
                loading_status = 'string'
                string_quote = '"'
            elseif curr_char == "'" then
                loading_str = ''
                loading_status = 'string'
                string_quote = "'"
            else
                loading_str = curr_char
                loading_status = 'other'
            end
        elseif loading_status == 'string' then
            if curr_char == string_quote then
                tinsert(tokens, {token_value=loading_str, token_type='string'})
                loading_status = nil
                loading_str = ''
                string_quote = nil
            else
                loading_str = loading_str .. curr_char
            end
        elseif loading_status == 'other' then
            if curr_char == ' ' or curr_char == '(' or curr_char == ')' then
                tinsert(tokens, __analyse_token(loading_str))
                loading_status = nil
                loading_str = ''
                if curr_char == '(' then
                    tinsert(tokens, {token_value='(', token_type='left_bracket'})
                elseif curr_char == ')' then
                    tinsert(tokens, {token_value=')', token_type='right_bracket'})
                end
            else
                loading_str = loading_str .. curr_char
            end
        end
    end

    if loading_status ~= nil then
        if loading_status == 'string' then
            error('string not closed')
        else
            tinsert(tokens, __analyse_token(loading_str))
        end
    end
    return tokens
end

function array_split(arr, start, end_pos)
    local ret = {}
    for i = start, end_pos do
        tinsert(ret, arr[i])
    end
    return ret
end

function print_arr(t)
    -- local s = '['
    -- for i = 1, getn(t) do
    --     s = s .. tostring(t[i].token) .. ', '
    -- end
    -- s = s .. ']'
    -- print(s)
end

function print_tokens(tokens)
    local s = 'tokens: ['
    for i = 1, getn(tokens) do
        if(tokens[i] == nil) then
            s = s .. '<nil>, '
        else
            s = s .. tostring(tokens[i].token_value) .. ', '
        end
    end
    s = s .. ']'
    print(s)
end

function print_ast(ast)
    if ast.token ~= nil then
        print(ast.token.token_value)
    end
    for i = 1, getn(ast.children) do
        print_ast(ast.children[i])
    end
end

function parse(tokens)

    local token_cnt = getn(tokens)
    print('token_cnt: ' .. tostring(token_cnt))
    print_tokens(tokens)


    local ast = {token=nil, children={}}
    if token_cnt == 0 then
        print('error: empty token')
        return nil, 'empty token'
    end
    if token_cnt == 1 then
        print('------')
        local token = tokens[1]
        if token.token_type == 'left_bracket' or token.token_type == 'right_bracket' then
            print('error: invalid token: ' .. tostring(token.token_value))
            return nil, 'invalid token: ' .. tostring(token.token_value)
        end
        ast.token = token
        print(ast.token.token_value)
        return ast
    end
    if token_cnt == 2 then
        print('error: invalid token: ' .. tostring(tokens[1].token_value))
        return nil, 'invalid token: ' .. tostring(tokens[1].token_value)
    end
    if tokens[1].token_type ~= 'left_bracket' then
        print('error: invalid token: ' .. tostring(tokens[1].token_value))
        return nil, 'invalid token: ' .. tostring(tokens[1].token_value)
    end
    if tokens[token_cnt].token_type ~= 'right_bracket' then
        print('error: invalid token: ' .. tostring(tokens[token_cnt].token_value))
        return nil, 'invalid token: ' .. tostring(tokens[token_cnt].token_value)
    end
    ast.token = tokens[2]
    local stack = {}
    for i = 3, token_cnt - 1 do
        local token = tokens[i]
        if token.token_type == 'left_bracket' then
            tinsert(stack, token)
        elseif token.token_type == 'right_bracket' then
            if getn(stack) == 0 then
                print('error: invalid token: ' .. tostring(token.token_value))
                return nil, 'invalid token: ' .. tostring(token.token_value)
            end
            tinsert(stack, token)
            print_arr(stack)
            local left_bracket_index = nil
            for j = getn(stack) - 1, 1, -1 do
                if stack[j].token_type == 'left_bracket' then
                    left_bracket_index = j
                    break
                end
            end

            local sub_ast = parse(array_split(stack, left_bracket_index, getn(stack)))
            -- print('left_bracket_index: ' .. tostring(left_bracket_index))
            -- print('sub_ast: ')
            -- print_ast(sub_ast)
            tinsert(ast.children, sub_ast)
            for j = getn(stack) - left_bracket_index + 1, 1, -1 do
                tremove(stack)
            end
            print('after remove stack...')
            print_arr(stack)
        else
            print('======')
            if getn(stack) == 0 then
                print('!!!!!!!')
                tinsert(ast.children, parse({token}))
            else
                tinsert(stack, token)
            end
        end
    end
    return ast
end

-- env = {}
function execute(ast)
    local token = ast.token
    if token.token_type == 'number' or token.token_type == 'string' or token.token_type == 'nil' then
        return token.token_value
    elseif token.token_type == 'symbol' then
        local token_value = token.token_value
        local children_cnt = getn(token.children)
        if token_value == 'define' then
            if children_cnt < 2 then
                print('error: bad define')
                return nil, 'bad define'
            end

        else
        end
    else
        return nil
    end
end



function eval(cmd)
    local tokens = tokenize(cmd)
    print('---- TOKEN -----')
    for i = 1, getn(tokens) do
        print(tokens[i].token_value, tokens[i].token_type)
    end
    
    local ast, error = parse(tokens)
    print('---- AST -----')
    
    print('error:' .. tostring(error))

    print_ast(ast)

    local ret = execute(ast)
    print('---- RESULT -----')
    print(ret)
end


-- eval('(define x 1) (define y 2) (+ x y)')
-- eval('(define (x a b) (+ a b))')
-- eval('(+ 1 2)')
eval('nil')