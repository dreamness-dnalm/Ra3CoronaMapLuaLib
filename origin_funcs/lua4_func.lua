--- lua4_func.lua
--- Created by dreamness
--- DateTime: 01/05/2025 10:18 AM

--- 本文件记录了基础的lua4函数

------ table相关函数 -------

--- 获取table的长度
--- @param table table
--- @return number
function getn(table) end

--- 插入元素到table中
--- @param table table
--- @param pos number 可选参数, 插入位置
--- @param value any
function tinsert(table, pos, value) end

--- 移除table中的元素
--- @param table table
--- @param pos number 可选参数, 移除位置, 默认为最后一个元素
function tremove(table, pos) end

--- 对table进行排序
---@param table table 数组
---@param func function 可选参数, 排序函数
---@return table table
function sort(table, func) end

-------- 数学函数 --------

--- 取绝对值
--- @param x number
--- @return number
function abs(x) end

--- 向上取整
--- @param x number
--- @return number
function ceil(x) end

--- 向下取整
--- @param x number
--- @return number
function floor(x) end

--- 取最大值
--- @return number
function max(x, ...) end

--- 取最小值
--- @return number
function min(x, ...) end

--- 取余数
--- @param x number 被除数
--- @param y number 除数
--- @return number
function mod(x, y) end


--- 开方
--- @param x number
--- @return number
function sqrt(x) end

--- 计算余弦值
--- @param x number
--- @return number
function cos(x) end

--- 计算正弦值
--- @param angle number
--- @return number
function sin(angle) end

--- 计算正切值
--- @param angle number
--- @return number
function tan(angle) end

--- 计算反正切值
--- @param x number
--- @return number
function atan(x) end

--- 计算反正切值
--- @param y number
--- @param x number
--- @return number
function atan2(y, x) end

--- 计算反正弦值
--- @param x number
--- @return number
function asin(x) end

--- 计算反余弦值
--- @param x number
--- @return number
function acos(x) end

--- 计算以e为底x的对数
--- @param x number
--- @return number
function log(x) end

--- 计算以10为底x的对数
--- @param x number
--- @return number
function log10(x) end


--- 将角度转换为弧度
--- @param angle number
--- @return number
function rad(angle) end

--- 将弧度转换为角度
--- @param x number
--- @return number
function deg(x) end

--- 计算平方根
--- @param x number
--- @return number
function sqrt(x) end

--- 生成随机数 0-1
--- @return number
function random() end

--- 设置随机数种子
--- @param seed number
function randomseed(seed) end

--- 计算以e为底x的指数值
--- @param x number
--- @return number
function exp(x) end

--- 将x分解为m*2^e的形式
--- @param x number
--- @return number, number
function frexp(x) end

--- 将m*2^e的形式转换为x
--- @param m number
--- @param e number
--- @return number
function ldexp(m, e) end



------ 字符串 ---------

--- 将任意类型转换为字符串
--- @param any any 任意类型
--- @return string
function tostring(any) end

--- 将字符串转换为数字
--- @param s string
--- @return number
function tonumber(s) end

--- 获取字符串拷贝, 并转为小写
--- @param s string
--- @return string
function strlower(s) end

--- 获取字符串拷贝, 并转为大写
--- @param s string
--- @return string
function strupper(s) end

--- 字符串寻找
--- @param s string
--- @param pattern string 匹配的字符串
--- @param init number 可选参数, 开始位置
--- @param plain boolean 可选参数, 是否关闭模式匹配
--- @return number|nil
function strfind(s, pattern, init, plain) end

--- 字符串切片
--- @param s string
--- @param i number 开始位置
--- @param j number 可选参数, 结束位置
function strsub(s, i, j) end

--- 获取字符串长度
--- @param s string
--- @return number
function strlen(s) end

--- 获取字符串第几个元素
---@param str string 字符串
---@param index number 索引
---@return number
function strbyte(str, index) end

--- 字符串元素替换
---@param str string 字符串
---@param pattern string 匹配模式
---@param replacement string 替换字符串
---@param _count number  可选参数, 替换的次数
---@return string 替换后的字符串
function gsub(str, pattern, replacement, _count) end

--- 字符串重复
--- @param str string 字符串
--- @param n number 重复次数
--- @return string 重复后的字符串
function strrep(str, n) end

--- ascii码转字符
--- @param ... number 多个ascii码
function strchar(...) end

--- 格式化字符串
--- @param formatstring string 格式化字符串
--- @param ... any 多个参数
function format(formatstring, ...) end

-------- tag相关 -------

--- 创建一个新的tag
--- @return tag
function newtag() end

--- 设定table的tag
--- @param t table
--- @param tag tag
function settag(t, tag) end

--- Sets a new tag method to the given pair (tag, event) and returns the old method. If newmethod is nil, then settagmethod restores the default behavior for the given event. This function cannot be used to set a tag method for the ``gc'' event. (Such tag methods can only be manipulated by C code.)
--- @param tag tag
--- @param event string
--- @param newmethod function
--- @return function
function settagmethod(tag, event, newmethod) end

--- 获取table的tag
--- @param any any
--- @return tag
function tag(any) end

------ 其他 -------

--- 获取当前时间字符串
--- @param format string 可选参数, 时间格式
--- @return string
function date(format) end

--- 获取变量的类型
--- @param any any
--- @return string
function type(any) end

--- 获取全局变量table
--- @return table
function globals() end

--- 执行字符串
--- @param cmd string
--- @return any  失败返回nil
function dostring(cmd) end

--- 获取当前cpu时间 单位秒
--- @return number
function clock() end

