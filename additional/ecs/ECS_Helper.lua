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