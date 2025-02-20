

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


function lexical_analyse(cmd)
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


-- ast: {token, children}
function grammar_analyse(tokens)
    local ast = {token=nil, children={}}
    local token_cnt = getn(tokens)
    if token_cnt == 0 then
        return ast
    end
    if token_cnt == 1 then
        local token = tokens[1]
        if(token == '(' or token == ')') then
            return nil, 'invalid token: ' .. tostring(token) 
        end
        ast.token = token
        return ast
    end

    local stack = {}
    if tokens[1].token_type ~= 'left_bracket' then
        return nil, 'invalid token: ' .. tostring(tokens[1].token_value)
    end
    tinsert(stack, tokens[1])
    for i = 2, token_cnt do
        local token = tokens[i]
        if token.token_type == 'left_bracket' then
            tinsert(stack, token)
        elseif token.token_type == 'right_bracket' then
            if getn(stack) == 0 then
                return nil, 'invalid token: ' .. tostring(token.token_value)
            end
            local left_bracket_index = nil
            for i = i, 1, -1 do
                if tokens[i].token_type == 'left_bracket' then
                    left_bracket_index = i
                    break
                end
            end
            tinsert(ast.children, grammar_analyse(array_split(tokens, left_bracket_index, i)))
        else
            tinsert(ast.children, token)
        end
    end
end

function execute(ast)
end


function eval(cmd)
    local tokens = lexical_analyse(cmd)
    print('---- TOKEN -----')
    for i = 1, getn(tokens) do
        print(tokens[i].token_value, tokens[i].token_type)
    end
    
    local ast = grammar_analyse(tokens)
    local ret = execute(ast)
    print('---- RESULT -----')
    print(ret)
end




eval("(add a nil)")