
--- @class ECS_Entity
--- @field components ECS_Component[]
ECS_Entity = {}

--- @param component_name string
--- @return boolean
function ECS_Entity:has_component(component_name)
    for i = 1, getn(self.components) do
        local component = self.components[i]

        if component.component_name == component_name then
            return true
        end
    end

    return false
end

--- @param component ECS_Component
function ECS_Entity:remove_component_by_ref(component)
    for i = 1, getn(self.components) do
        if self.components[i] == component then
            tremove(self.components, i)
        end
    end
end

--- @param component_name string
function ECS_Entity:remove_component_by_component_name(component_name)
    for i = 1, getn(self.components) do
        local component = self.components[i]

        if component.component_name == component_name then
            tremove(self.components, i)
        end
    end
end

--- @param component ECS_Component
function ECS_Entity:add_component(component)
    tinsert(self.components, component)
end