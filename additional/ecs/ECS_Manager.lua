
--- @class ECS_Manager
--- @field entities ECS_Entity[]
--- @field systems ECS_System[]
ECS_Manager = {}

function ECS_Manager:register_system(system)
    tinsert(self.systems, system)
    return getn(self.systems)
end

function ECS_Manager:register_entity(entity)
    tinsert(self.entities, entity)
    return getn(self.entities)
end

function ECS_Manager:update()
    for i = 1, getn(self.systems) do
        local system = self.systems[i]

        for j = 1, getn(self.entities) do
            local entity = self.entities[j]
            
        end
    end
end