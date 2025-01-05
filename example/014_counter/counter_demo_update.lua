--- counter_demo_update.lua
--- Created by dreamness
--- DateTime: 01/05/2025 10:19 PM


--- 每帧运行

if mod(GameModule.get_frame_number() , 15) == 0 then
    local n = CounterModule.get_counter_value("counter_1")
    n = n + 10
    CounterModule.set_counter_value("counter_1", n)
end
