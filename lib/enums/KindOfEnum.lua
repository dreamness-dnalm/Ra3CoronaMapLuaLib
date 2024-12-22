--- KindOfEnum.lua
--- Created by dreamness
--- DateTime: 10/18/2024 5:55 PM
---

--- @class KindOfEnum
KindOfEnum = {
    --- 可以被选择，既指可以被点选也指可以被选作攻击目标，配合步兵、载具、建筑可显示该物体血条，进度条等，可以被AI操控
    SELECTABLE = "SELECTABLE",

    TARGETABLE = "TARGETABLE",
    --- 载具，进入容器时无法转动
    VEHICLE = "VEHICLE",
    --- 飞行器，此类单位无法进入容器，航母小飞机返回母体则为例外(火箭天使蹭进民房原理不明)，
    ---原版出现于维护者、阿波罗、冷冻、世纪、航母+航母锤小飞机、女神轰炸机、战役伞兵世纪、气球炸弹、神风飞机、火箭天使、双刃、米格、基洛夫、袋狸、各种维修蜂
    AIRCRAFT = "AIRCRAFT",
    --- 步兵，无法压树木，原版出现于狗、PK、标枪、间谍、谭雅、海豚、武士、帽子、忍者、天使、百合子、A4机场天狗、天皇、熊、动员兵、铁饼、磁暴兵、娜塔莎、蜘蛛、三工兵
    INFANTRY = "INFANTRY",

    STRUCTURE = "STRUCTURE",

    --- 纳米核心
    EGG = "EGG",

    --- 平民建筑
    CIVILIAN_BUILDING = "CIVILIAN_BUILDING",
}