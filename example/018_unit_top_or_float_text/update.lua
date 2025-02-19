--- 每帧运行


local curr_frame_num = GameModule.get_frame_number()
local unit = UnitHelper.get_unit_from_name("unit1")

-- 每10秒修改一次头顶文字
if mod(curr_frame_num, 15 * 10) == 0 then

    unit:set_top_text("当前帧序号: " .. tostring(curr_frame_num), 50, ColorEnum.BLUE, nil)    

end    



-- 每5秒飘过一个[1,100)的随机数
if mod(curr_frame_num, 15 * 5) == 0 then
    unit:show_float_int_number(RandomHelper.random_range_int(1, 100))
end