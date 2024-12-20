--- AttributeModifierEnum.lua
--- Created by dreamness
--- DateTime: 10/15/2024 07:06 PM

---有些BUFF并未归入其中;
---使用BUFF时，最好手动添加相应时间，如600帧，30帧;
---相同名称BUFF不能叠加，但是不同名称BUFF的同一种效果能叠加，如3个不同加速BUFF可以叠加。
--- @class AttributeModifierEnum
AttributeModifierEnum = {
    -- todo test
    --- 缩小
    SHRINK = "AttributeMod_AlliedSupportAircraftShrinkRay",
    -- todo test
    --- 易伤
    LIABLE_DAMAGE = "AttributeMod_TargetPainted_HighTechnology",
    -- todo test??
    --- 无敌
    INVINCIBLE = "AttributeModifier_INVULNERABLE",
    -- todo test
    --- 铁幕
    IRON_CURTAIN = "AttributeModifier_IronCurtain",
    -- todo test
    --- 探测潜艇, 使得潜水的潜艇能在小地图显示
    DETECT_SUBMARINE = "AttributeMod_SubmarineDetection",
    -- todo test
    --- 停电Debuff
    POWER_OUTAGE = "AttributeModifier_CelestialLowPowerDebuff",
    -- todo test
    --- 缩短探测距离, 即使全图视野，射程也是减小状态
    SHORTEN_DETECT_1 = "AttributeModifier_Blind",
    -- todo test
    --- 缩短探测距离, 即使全图视野，射程也是减小状态
    SHORTEN_DETECT_2 = "AttributeModifier_CelestialSmokeBombDebuff",
    -- todo test
    --- 缩短探测距离, 即使全图视野，射程也只有贴脸
    SHORTEN_DETECT_3 = "AttributeModifier_DefenderTankSmokeEffect",
    -- todo test
    --- 潜艇上浮
    SUBMARINE_FLOAT = "AttributeMod_Submarine_Float",
    -- todo test
    --- 导弹打不准
    MISSILE_MISS = "AttributeMod_StopMissileGuiding",

    -- todo test
    --- 无法移动
    IMMOBILIZE_1 = "AttributeMod_TankdestroyerParalyzeWeapon",

    -- todo test
    --- 无法移动, 类似束缚状态，什么都干不了
    IMMOBILIZE_2 = "AttributeMod_CelestialNukeVehicleLaunchSelfParalyze",

    -- todo test
    --- 无法移动, 被冻住的效果(无视觉特效）[但只是单位护甲降低，并不会被秒杀]
    IMMOBILIZE_3 = "AttributeMod_CelestialNukeVehicleLaunchSelfParalyze",

    -- todo test
    --- 无法移动, 定在原地，能开火或转向
    IMMOBILIZE_4 = "AttributeModifer_MovieSpecialAnimationBuff",

    -- todo test
    --- 无法移动, 定在原地，某些单位不能开火，或者需要开F技能使其能开火，会启用单位模型状态中的USER_6
    IMMOBILIZE_5 = "AttributeModifer_CelestialShield",

    -- todo test
    --- 无法移动, 定在原地，能开火或转向
    IMMOBILIZE_6 = "AttributeModifier_AttributeModifier_PrismAA",

    -- todo test
    --- 无法移动
    IMMOBILIZE_7 = "AttributeModifier_CelestialRepairDroneSeedImmobile",

    -- todo test
    --- 隐藏血条, 无单位属性上的修改，对敌我双方都有效，血条都看不见（或许某些地图作者能用上此BUFF）
    HIDE_HP_BAR_1 = "AttributeMod_ContainedTurretREALLYDAMAGED",
    --- todo test
    HIDE_HP_BAR_2 = "AttributeModifier_AlliedCommandoDetonationFX_DragonShip",

    ARMOR_1 = "AttributeModifer_JapanNavalPower_JapanAntiVehicleShip",

    --- 攻击力变为1.1
    ATTACK_UPPER_1 = "AttributeMod_CenturionUpgradeLv1",
    --- 攻击力变为1.25
    ATTACK_UPPER_2 = "AttributeMod_CenturionUpgradeLv2",
    --- 攻击力变为1.25
    ATTACK_UPPER_3 = "AttributeMod_lightningTroop_Lv1",
    --- 攻击力变为1.5
    ATTACK_UPPER_4 = "AttributeMod_lightningTroop_Lv2",
    --- 攻击力变为1.75
    ATTACK_UPPER_5 = "AttributeMod_lightningTroop_Lv3",
    --- 提升射程
    ATTACK_RANGE_UPPER_1 = "AttributeModifier_CelestialZhuRongRapidFire",


}