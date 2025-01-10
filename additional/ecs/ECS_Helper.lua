ECS_Helper = {}

ECS_Helper._meta = {
    tags = {
        ECS_Manager_tag = newtag(),
        ECS_Entity_tag = newtag(),
        ECS_Component_tag = newtag(),
    }
}

--- @return ECS_Manager
ECS_Helper.new_ECS_Manager = function()
    --- @type ECS_Manager
    local obj = { entities = {}, systems = {} }

    settag(obj, ECS_Helper._meta.tags.ECS_Manager_tag)

    settagmethod(_meta.tags.unit_tag, "index", function(t, key)
        return Unit[key]
    end)

    return obj
end

--- @return ECS_Entity
ECS_Helper.new_ECS_Entity = function()
    --- @type ECS_Entity
    local obj = { components = {} }

    settag(obj, ECS_Helper._meta.tags.ECS_Entity_tag)

    settagmethod(_meta.tags.unit_tag, "index", function(t, key)
        return Unit[key]
    end)

    return obj
end

--- @param required_component_names string[]
--- @param optional_component_names string[]
--- @param excluded_component_names string[]
--- @param update fun(self:ECS_System, required_components: ECS_Component[], optional_components: ECS_Component[], entity: ECS_Entity)
--- @return ECS_Component
ECS_Helper.new_ECS_System = function(required_component_names, optional_component_names, excluded_component_names, update)
    --- @type ECS_System
    local obj = { 
        required_component_names = required_component_names,
        optional_component_names = optional_component_names,
        excluded_component_names = excluded_component_names,
        update = update
    }

    settag(obj, ECS_Helper._meta.tags.ECS_System_tag)

    settagmethod(_meta.tags.unit_tag, "index", function(t, key)
        return Unit[key]
    end)

    return obj
end