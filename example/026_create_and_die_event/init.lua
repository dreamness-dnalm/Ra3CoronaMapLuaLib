logger.setup(LoggerLevelEnum.DEBUG, {LoggerTargetEnum.DEBUG_LOG_FILE})

EventHelper.register_unit_create_event(ThingEnum.JapanPowerPlantEgg, 
function(unit)
    logger.info("test", "poweregg created, unit id: " .. tostring(unit.id))
end)

EventHelper.register_unit_die_event(ThingEnum.JapanPowerPlantEgg,
function(dying_unit, killer_unit)
    local dying_unit_id = dying_unit.id
    local killer_unit_id = nil
    if killer_unit then
        killer_unit_id = killer_unit.id
    end
    logger.info("test", "poweregg died, unit id: " .. tostring(dying_unit_id) .. "; killer unit id: " .. tostring(killer_unit_id))
end
)