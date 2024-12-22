--- brain_vehicle.lua
--- Created by dreamness
--- DateTime: 12/21/2024 7:21 PM

--- 这个示例实现一个脑车的效果, 可以控制周边的单位

DemoBrainVehicle = {}

LoggerModule.setup(LoggerLevelEnum.DEBUG, {LoggerTargetEnum.DEBUG_LOG_FILE})

--- 被控制单位的状态
DemoBrainVehicle.controlled_status_name = StatusEnum.HIJACKED

--- 脑车的单位名 (用苏联矿车当做脑车)
DemoBrainVehicle.brain_vehicle_thing = ThingEnum.SovietMiner

--- 免疫被控制的单位名
DemoBrainVehicle.immune_things = {
    DemoBrainVehicle.brain_vehicle_thing
}

--- 脑车的过滤器, 可以获取所有的脑车单位
DemoBrainVehicle.brain_vehicle_filter = FilterHelper.new_filter_builder()
    :set_rule(FilterRuleEnum.NONE)
    :add_include_things(DemoBrainVehicle.brain_vehicle_thing)
    :build()

--- 获取脑车攻击范围内的单位
DemoBrainVehicle.control_range_filter = FilterHelper.new_filter_builder()
    :set_rule(FilterRuleEnum.ALL)
    :add_relationships({FilterRelationshipEnum.ENEMIES, FilterRelationshipEnum.NEUTRAL})
    :add_include_kind_ofs({KindOfEnum.VEHICLE, KindOfEnum.INFANTRY})
    :add_exclude_statuses(DemoBrainVehicle.controlled_status_name)
    :add_exclude_things(DemoBrainVehicle.immune_things)
    :build()

--- 脑车的控制范围半径
DemoBrainVehicle.control_range_radius = 200
--- 脑车的控制的冷却时间
DemoBrainVehicle.control_interval = 15 * 2 -- 2s
--- 脑车控制了超额单位后受到的伤害
DemoBrainVehicle.suffer_over_controlling_damage = 10
--- 脑车超额伤害的冷却时间
DemoBrainVehicle.suffer_over_controlling_damage_interval = 15 * 2 -- 2s
--- 脑车最多控制的单位数量, 超过这个数量后会受到伤害
DemoBrainVehicle.max_controlling_unit_cnt = 3


--- @class DemoBrainVehicle.BrainMeta
--- @field unit Unit
--- @field last_control_frame_num number
--- @field last_suffer_damage_frame_num number
--- @field controlling_unitmetas DemoBrainVehicle.ControlledUnitMeta[]

--- @class DemoBrainVehicle.ControlledUnitMeta
--- @field unit Unit
--- @field origin_player_name PlayerEnum

--- 用于存储脑车的元数据
--- @type Table<number, DemoBrainVehicle.BrainMeta[]>
DemoBrainVehicle.storage_table = {}

function DemoBrainVehicle:update()
    local curr_frame_num = GameModule.get_frame_number()
    LoggerModule.debug("DemoBrainVehicle:update", "step 1")
    local brain_vehicles, brain_vechicle_cnt = DemoBrainVehicle.brain_vehicle_filter:filter_units(nil, nil)
    LoggerModule.debug("DemoBrainVehicle:update", "brain_vechicle_cnt: " .. brain_vechicle_cnt)
    LoggerModule.debug("DemoBrainVehicle:update", "step 2")
    -- 该循环用于初始化脑车的元数据, 并控制周围的单位
    for i = 1, brain_vechicle_cnt do
        local curr_brain_vehicle = brain_vehicles[i]
        local curr_brain_vehicle_id = curr_brain_vehicle.id

        -- 初始化新脑车的元数据
        if DemoBrainVehicle.storage_table[curr_brain_vehicle_id] == nil then
            DemoBrainVehicle.storage_table[curr_brain_vehicle_id] = { unit=curr_brain_vehicle, last_control_frame_num=0, last_suffer_damage_frame_num=0, controlling_unitmetas={} }
        end

        local curr_brain_meta = DemoBrainVehicle.storage_table[curr_brain_vehicle_id]

        -- 如果结束了控制的冷却时间, 尝试控制周围的单位
        if curr_brain_meta.last_control_frame_num == nil or curr_frame_num - curr_brain_meta.last_control_frame_num >= DemoBrainVehicle.control_interval then
            local x, y, z = curr_brain_vehicle:get_position()
            local filter_area = FilterHelper.new_area_config(
                x, y, z, 
                DemoBrainVehicle.control_range_radius, 
                AreaDistTypeEnum.CENTER_2D)
            local surrounding_units, surrounding_unit_cnt = DemoBrainVehicle.control_range_filter:filter_units(filter_area, curr_brain_vehicle)
            
            -- 如果周围有单位, 则控制其中一个单位
            if surrounding_unit_cnt > 0 then
                local curr_controlled_unit = surrounding_units[1]
                tinsert(curr_brain_meta.controlling_unitmetas, {unit=curr_controlled_unit, origin_player_name=curr_controlled_unit:get_owner_player()})

                curr_controlled_unit:remove_status(DemoBrainVehicle.controlled_status_name)
                curr_controlled_unit:set_owner_player(curr_brain_vehicle:get_owner_player())
                UnitHighlightModule.unit_white_flash(curr_controlled_unit.unit_table, 3)
                -- UnitHighlightModule.unit_outline(curr_controlled_unit.unit_table, UnitOutlineTypeEnum.HOVER_ATTACK)
                curr_brain_meta.last_control_frame_num = curr_frame_num
            end
        end
    end
    LoggerModule.debug("DemoBrainVehicle:update", "step 3")
    for i = getn(DemoBrainVehicle.storage_table), 1, -1 do
        local curr_brain_meta = DemoBrainVehicle.storage_table[i]
        --- @type Unit
        local curr_brain_vehicle = curr_brain_meta.unit
        LoggerModule.debug("DemoBrainVehicle:update", "step 3.1")
        LoggerModule.debug("DemoBrainVehicle:update", "brain_vehicle_id.is_alive: " .. tostring(curr_brain_vehicle:is_alive()))
        if curr_brain_vehicle:is_alive() then
            LoggerModule.debug("DemoBrainVehicle:update", "brain_vehicle is alive")
            -- 如果脑车还活着
            local curr_brain_meta = DemoBrainVehicle.storage_table[curr_brain_vehicle.id]
            -- 从元数据中移除已经死亡的被控单位
            for i = getn(curr_brain_meta.controlling_unitmetas), 1, -1 do
                local curr_controlled_unitmeta = curr_brain_meta.controlling_unitmetas[i]
                if not curr_controlled_unitmeta.unit:is_alive() then
                    tremove(curr_brain_meta.controlling_unitmetas, i)
                end
            end

            -- 如果脑车控制的单位超过了最大数量, 则受到伤害
            if getn(curr_brain_meta.controlling_unitmetas) > DemoBrainVehicle.max_controlling_unit_cnt then
                if curr_brain_meta.last_suffer_damage_frame_num == nil or curr_frame_num - curr_brain_meta.last_suffer_damage_frame_num >= DemoBrainVehicle.suffer_over_controlling_damage_interval then
                    curr_brain_vehicle:suffer_damage(DemoBrainVehicle.suffer_over_controlling_damage * (getn(curr_brain_meta.controlling_unitmetas) - DemoBrainVehicle.max_controlling_unit_cnt))
                    curr_brain_meta.last_suffer_damage_frame_num = curr_frame_num
                    local x, y, z = curr_brain_vehicle:get_position()
                    curr_brain_vehicle:fire_with_temp_weapon(WeaponEnum.JapanAntiInfantryInfantryWeapon, x, y, z, curr_brain_vehicle)

                end
            end

        else
            LoggerModule.debug("DemoBrainVehicle:update", "brain_vehicle is dead")
            -- 如果脑车死了, 释放被控制的单位
            local curr_brain_controlling_unitmetas = DemoBrainVehicle.storage_table[curr_brain_vehicle.id].controlling_unitmetas
            LoggerModule.debug("DemoBrainVehicle:update", "controlling_unit_cnt: " .. getn(curr_brain_controlling_unitmetas))
            for i = 1, getn(curr_brain_controlling_unitmetas) do
                local curr_controlled_unitmeta = curr_brain_controlling_unitmetas[i]
                --- @type Unit
                local curr_controlled_unit = curr_controlled_unitmeta.unit
                curr_controlled_unit:remove_status(DemoBrainVehicle.controlled_status_name)
                curr_controlled_unit:set_owner_player(curr_controlled_unitmeta.origin_player_name)
            end
            tremove(DemoBrainVehicle.storage_table, i)
        end

    end
    LoggerModule.debug("DemoBrainVehicle:update", "finished.")
end
