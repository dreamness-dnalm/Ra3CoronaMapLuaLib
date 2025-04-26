
--- 获取单位附着物体
--- @return Unit[] 附着物体列表, number 附着物体数量
function Unit:get_attachers()
    local attachers, attachers_count = UnitAttachModule.get_attachers(self.id)

    local attachers_table = {}
    for i = 1, attachers_count do
        local attacher = UnitHelper.get_unit_from_table(attachers[i])
        tinsert(attachers_table, attacher)
    end
    return attachers_table, attachers_count
end

--- 获取单位被附着物体
--- @return Unit[] 被附着物体列表, number 被附着物体数量
function Unit:get_attachee()
    local attachees, attachees_count = UnitAttachModule.get_attachee(self.id)

    local attachees_table = {}
    for i = 1, attachees_count do
        local attachee = UnitHelper.get_unit_from_table(attachees[i])
        tinsert(attachees_table, attachee)
    end
    return attachees_table, attachees_count
end

--- 附着到其他物体 
--- @param be_attached_unit Unit 被附着物体
function Unit:attach_to_other_unit(be_attached_unit)
    UnitAttachModule.attach_to_object(self.id, be_attached_unit.id)
end

--- 添加附着物体
--- @param attachable_unit Unit 附着物体
function Unit:add_attacher(attachable_unit)
    UnitAttachModule.attach_to_object(attachable_unit.id, self.id)
end

--- 添加附着物体
--- @param attachable_thing_name AttachableThingEnum 附着物体名称
--- @param tmp_waypoint_name string 临时路径点名称
--- @return Unit 附着物体
function Unit:add_attacher_by_name(attachable_thing_name, tmp_waypoint_name)
    if type(attachable_thing_name) ~= "string" then
        LoggerModule.error("Unit:add_attacher_by_name", "attachable_thing_name must be a string")
        return nil
    end
    if type(tmp_waypoint_name) ~= "string" then
        LoggerModule.error("Unit:add_attacher_by_name", "tmp_waypoint_name must be a string")
        return nil
    end

    local attachable_unit = UnitCreateHelper.create_unit_at_waypoint(
        UnitHelper.get_unit_auto_name(),
        attachable_thing_name,
        TeamModule.from_player_name(self:get_owner_player()),
        tmp_waypoint_name,
        nil, nil, nil
    )

    self:add_attacher(attachable_unit)
    return attachable_unit
end