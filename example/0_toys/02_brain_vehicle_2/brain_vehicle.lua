logger.setup(LoggerLevelEnum.DEBUG, {LoggerTargetEnum.DEBUG_LOG_FILE})

--- 控制单元太费电了, 只能无限电了
for _, player_name in PlayerEnum do
    PowerModule.set_base_power(player_name, 900000)
end

DemoBrainVehicle2 = {}

DemoBrainVehicle2.brain_vehicle_thing = ThingEnum.SovietMiner

--- 免疫被控制的单位名
DemoBrainVehicle2.immune_things = {
    DemoBrainVehicle2.brain_vehicle_thing
}

--- 脑车的控制范围半径
DemoBrainVehicle2.control_range_radius = 300
--- 脑车的控制的冷却时间
DemoBrainVehicle.control_interval = 10 -- 2/3s
--- 脑车最多控制的单位数量, 超过这个数量后会受到伤害
DemoBrainVehicle2.max_control_unit_cnt = 3
--- 脑车控制了超额单位后受到的伤害
DemoBrainVehicle2.suffer_over_controlling_damage = 10
--- 脑车超额伤害的冷却时间
DemoBrainVehicle2.suffer_over_controlling_damage_interval = 15 -- 1s

DemoBrainVehicle2.brain_vehicle_filter = FilterHelper.new_filter_builder()
    :set_rule(FilterRuleEnum.NONE)
    :add_include_things(DemoBrainVehicle2.brain_vehicle_thing)
    :build()


DemoBrainVehicle2.control_range_filter = FilterHelper.new_filter_builder()
    :set_rule(FilterRuleEnum.ALL)
    :add_relationships({FilterRelationshipEnum.ENEMIES, FilterRelationshipEnum.NEUTRAL})
    :add_include_kind_ofs({KindOfEnum.VEHICLE, KindOfEnum.INFANTRY})
    :add_exclude_statuses(DemoBrainVehicle2.controlled_status_name)
    :add_exclude_things(DemoBrainVehicle2.immune_things)
    :build()

--- @class DemoBrainVehicle2.BrainMeta
--- @field unit Unit
--- @field last_control_frame_num number
--- @field last_suffer_damage_frame_num number
--- @field sub_units Unit[]
--- @field owner_player_name PlayerEnum


--- @type Table<string, DemoBrainVehicle2.BrainMeta>
DemoBrainVehicle2.meta = {}

SchedulerModule.call_every_x_frame(function()
    local curr_frame_num = GameModule.get_frame_number()

    -- ---------  移除死亡的脑车, 并释放被控制的单位 ---------
    for _curr_brain_id_str, curr_brain_meta in DemoBrainVehicle2.meta do
        local curr_brain_vehicle = curr_brain_meta.unit
        if not curr_brain_vehicle:is_alive() then
            for i = 1, getn(curr_brain_meta.sub_units) do
                --- @type Unit
                local curr_sub_unit = curr_brain_meta.sub_units[i]
                curr_sub_unit:kill()
            end
            DemoBrainVehicle2.meta[_curr_brain_id_str] = nil
        end
    end
    
    -- ---------  注册新脑车 ---------
    local brain_vehicles, brain_vechicle_cnt = DemoBrainVehicle2.brain_vehicle_filter:filter_units(nil, nil)
    for i = 1, brain_vechicle_cnt do
        local curr_brain_vehicle = brain_vehicles[i]
        local curr_brain_vehicle_id_str = tostring(curr_brain_vehicle.id)
        
        if DemoBrainVehicle2.meta[curr_brain_vehicle_id_str] == nil then
            DemoBrainVehicle2.meta[curr_brain_vehicle_id_str] = {
                unit = curr_brain_vehicle,
                last_control_frame_num = 0,
                last_suffer_damage_frame_num = 0,
                sub_units = {},
                owner_player_name = curr_brain_vehicle:get_owner_player(),
            }
        end
    end

    for _curr_brain_id_str, curr_brain_meta in DemoBrainVehicle2.meta do
        --- @type Unit
        local curr_brain_vehicle = curr_brain_meta.unit
        local x, y, z = curr_brain_vehicle:get_position()

        -- ---------  移除没用的控制单元 ---------
        for i = getn(curr_brain_meta.sub_units), 1, -1 do
            --- @type Unit
            local curr_sub_unit = curr_brain_meta.sub_units[i]
            if not curr_sub_unit:get_temporary_owned_unit() then
                curr_sub_unit:kill()
                tremove(curr_brain_meta.sub_units, i)
            end
        end
        -- ---------  控制新的单位 ---------
        if curr_brain_meta.last_control_frame_num == nil or curr_frame_num - curr_brain_meta.last_control_frame_num >= DemoBrainVehicle2.control_interval then
            local surrounding_units, surrounding_unit_cnt = DemoBrainVehicle2.control_range_filter:filter_units(nil, curr_brain_vehicle)
            if surrounding_unit_cnt > 0 then

                local curr_sub_unit = UnitCreateHelper.create_unit_at_waypoint(
                    UnitHelper.get_unit_auto_name(),
                    ThingEnum.SovietMiner,
                    TeamModule.from_player_name(curr_brain_meta.owner_player_name),
                    'Waypoint 3',
                    {AttributeModifierEnum.INVINCIBLE}, 999999999,
                    {
                        StatusEnum.UNSELECTABLE, 
                        StatusEnum.CANNOT_BE_SOLD
                    }
                )
                -- curr_sub_unit
                tinsert(curr_brain_meta.sub_units, curr_sub_unit)
                curr_brain_meta.last_control_frame_num = curr_frame_num
            end
        end


        -- --------- 更新控制单元的物理信息 ---------
        for i = 1, getn(curr_brain_meta.sub_units) do
            --- @type Unit
            local curr_sub_unit = curr_brain_meta.sub_units[i]
            local x, y, z = curr_sub_unit:get_position()
            curr_sub_unit:set_position(x, y, z)
            curr_sub_unit:set_scale(0.01)
        end


        -- ---------  结算超额控制伤害 ---------
        if getn(curr_brain_meta.sub_units) > DemoBrainVehicle2.max_control_unit_cnt then
            if curr_brain_meta.last_suffer_damage_frame_num == nil or curr_frame_num - curr_brain_meta.last_suffer_damage_frame_num >= DemoBrainVehicle2.suffer_over_controlling_damage_interval then
                curr_brain_vehicle:suffer_damage(DemoBrainVehicle2.suffer_over_controlling_damage * (getn(curr_brain_meta.sub_units) - DemoBrainVehicle2.max_control_unit_cnt))
                curr_brain_meta.last_suffer_damage_frame_num = curr_frame_num
                curr_brain_vehicle:fire_with_temp_weapon(WeaponEnum.JapanAntiInfantryInfantryWeapon, x, y, z, curr_brain_vehicle)
            end
        end

        


    end


end, 1, nil)