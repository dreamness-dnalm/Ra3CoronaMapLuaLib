--- logger_demo.lua
--- Created by dreamness
--- DateTime: 12/14/2024 10:24 PM

--- 设定日志级别为info
--- 设定输出目标, 同时在4个目标上输出日志
--- 全局设置一次就行了
LoggerModule.setup(LoggerLevelEnum.INFO, 
    {
                LoggerTargetEnum.DEBUG_LOG_FILE,
                LoggerTargetEnum.DLL_LOG_FILE,
                LoggerTargetEnum.PUBLIC_BOARD,
                LoggerTargetEnum.CHAT_MSG

            })

--- 输出一条info级别的日志, 第一个参数pos代表这条日志产生的位置, 便于排查问题; 第二个参数msg是日志内容
LoggerModule.info('logger_demo.lua', 'a info log')

--- 输出一条warn级别的日志
LoggerModule.warn('logger_demo.lua', 'a warn log')

--- 输出一条error级别的日志
LoggerModule.error('logger_demo.lua', 'a error log')

--- 这条日志不会被输出, 因为日志级别是info
LoggerModule.debug('logger_demo.lua', 'a debug log')

--- 忽略日志等级, 强制在聊天框输出一条日志
LoggerModule.log('a forced log', LoggerTargetEnum.CHAT_MSG)
