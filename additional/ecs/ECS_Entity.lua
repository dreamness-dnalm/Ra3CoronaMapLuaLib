
--- @class ECS_Entity
--- @field components ECS_Component[]
ECS_Entity = {}


function ECS_Entity:has_component(component_name)
    for i = 1, getn(self.components) do
        local component = self.components[i]

        if component.component_name == component_name then
            return true
        end
    end

    return false
end