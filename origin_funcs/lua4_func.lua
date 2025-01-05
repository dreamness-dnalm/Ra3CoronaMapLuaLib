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