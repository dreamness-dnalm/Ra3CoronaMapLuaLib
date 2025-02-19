local unit1 = UnitHelper.get_unit_from_name('unit1')
-- 闪烁10s
unit1:highlight_flash(10)

local unit2 = UnitHelper.get_unit_from_name('unit2')
-- 闪烁10s
unit2:highlight_white_flash(10)

local unit3 = UnitHelper.get_unit_from_name('unit3')
-- 不显示轮廓
unit3:highlight_outline(UnitOutlineTypeEnum.NONE)

local unit4 = UnitHelper.get_unit_from_name('unit4')
-- 黄色轮廓
unit4:highlight_outline(UnitOutlineTypeEnum.YELLOW)

local unit5 = UnitHelper.get_unit_from_name('unit5')
-- 白色轮廓
unit5:highlight_outline(UnitOutlineTypeEnum.WHITE)

local unit6 = UnitHelper.get_unit_from_name('unit6')
-- 红色轮廓
unit6:highlight_outline(UnitOutlineTypeEnum.RED)