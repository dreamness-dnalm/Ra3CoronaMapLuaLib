OreModule = {}

-- TODO: test, package
--- 重置矿脉的 EVA 播报状态
--- @param unit_table SystemUnitTable 需要是一个有 OreNodeBody 模块的单位（例如矿脉）
OreModule.reset_ore_eva = function(unit_table)
    if type(unit_table) ~= 'table' then
        LoggerModule.error("OreModule.reset_ore_eva", "unit_table is not a table")
        return
    end
    ObjectResetOreNodeBehaviorEvaState(unit_table)
end

-- TODO: test, package
--- 设置已经开采的矿石数量
--- @param unit_table SystemUnitTable 需要是一个有 OreNodeBody 模块的单位（例如矿脉）
--- @param amount number 矿石数量
--- @param reset_eva boolean 是否重置 EVA 播报状态
OreModule.set_ore_gathered_amount = function(unit_table, amount, reset_eva)
    if type(unit_table) ~= 'table' then
        LoggerModule.error("OreModule.set_ore_gathered_amount", "unit_table is not a table")
        return
    end
    if type(amount) ~= 'number' then
        LoggerModule.error("OreModule.set_ore_gathered_amount", "amount is not a number")
        return
    end

    if reset_eva then
        OreModule.reset_ore_eva(unit_table)
    end

    ObjectSetGatheredOreAmount(unit_table, amount)
end

-- TODO: test, package
--- 获取已经开采的矿石数量
--- @param unit_table SystemUnitTable 需要是一个有 OreNodeBody 模块的单位（例如矿脉）
--- @return number 矿石数量
OreModule.get_ore_gathered_amount = function(unit_table)
    if type(unit_table) ~= 'table' then
        LoggerModule.error("OreModule.get_ore_gathered_amount", "unit_table is not a table")
        return nil
    end
    return ObjectGetGatheredOreAmount(unit_table)
end

