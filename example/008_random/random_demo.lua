--- random_demo.lua
--- Created by dreamness
--- DateTime: 12/22/2024 10:39 AM


LoggerModule.setup(LoggerLevelEnum.DEBUG, {LoggerTargetEnum.PUBLIC_BOARD})

-- 随机生成一个0-1之间的浮点数
LoggerModule.info("DemoRandom", "random float: " .. tostring(RandomHelper.random_float()))

-- 根据指定范围生成浮点数, 左闭右开
LoggerModule.info("DemoRandom", "random range float: " .. tostring(RandomHelper.randon_range_float(1, 10)))

-- 根据指定范围生成整数, 左闭右开
LoggerModule.info("DemoRandom", "random range int: " .. tostring(RandomHelper.random_range_int(1, 10)))

-- 从数组中随机选择一个元素
LoggerModule.info("DemoRandom", "choice: " .. tostring(RandomHelper.choice({1, 2, 3, 4, 5})))

-- 从数组中随机选择多个元素, 并且不重复
LoggerModule.info("DemoRandom", "choices: " .. TableUtil.arr_to_string(RandomHelper.choices({1, 2, 3, 4, 5}, 2)))

-- 打乱数组
LoggerModule.info("DemoRandom", "shuffled table: " .. TableUtil.arr_to_string(RandomHelper.shuffle({1, 2, 3, 4, 5})))

