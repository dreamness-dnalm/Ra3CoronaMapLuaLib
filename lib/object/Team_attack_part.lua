
-- TODO: doc
--- 捕猎
function Team:hunt()
    if type(self.name) ~= "string" then
        logger.error("Team:hunt", "name must be a string")
    end
    TeamAttackModule.hunt(self.name)
end







