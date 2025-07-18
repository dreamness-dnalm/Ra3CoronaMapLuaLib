--- StatusEnum.lua
--- Created by dreamness
--- DateTime: 10/18/2024 5:52 PM
---

--- @enum StatusEnum
StatusEnum = {
    --- 缩小
    SHRUNK = "SHRUNK",
    --- 不可被选择,该状态施加到具有SELECTABLE标签的单位上时，赋予其特殊的“半选中”模式：鼠标覆盖会显示高亮边缘和血条，可以成为攻击等指令的目标，但无法真正选中。
    UNSELECTABLE = "UNSELECTABLE",
    --- 单位或建筑展开中, 技能前摇
    UNPACKING = "UNPACKING",
    UNDER_CONSTRUCTION = "UNDER_CONSTRUCTION",
    --- 无音效
    INAUDIBLE = "INAUDIBLE",

    --- 仅作标记用, 无实际效果
    PLAYER_POWER_1 = "PLAYER_POWER_1",
    PLAYER_POWER_2 = "PLAYER_POWER_2",
    PLAYER_POWER_3 = "PLAYER_POWER_3",
    PLAYER_POWER_4 = "PLAYER_POWER_4",
    PLAYER_POWER_5 = "PLAYER_POWER_5",
    --- 无特殊效果
    HIJACKED = "HIJACKED",
    --- 不可攻击
    NO_ATTACK = "NO_ATTACK",
    --- 不可被出售
    CANNOT_BE_SOLD = "CANNOT_BE_SOLD",

    PLACED_BY_PLAYER = "PLACED_BY_PLAYER",
    LOADED_BY_MAP = "LOADED_BY_MAP",
    
    --- 不可移动
    IMMOBILE = "IMMOBILE",

}