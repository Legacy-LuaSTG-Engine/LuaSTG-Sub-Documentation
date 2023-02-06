---@diagnostic disable: missing-return

--- [LuaSTG Sub v0.19.5 新增]
--- 运行时切换使用的显卡  
--- 警告：如果在游戏内设置界面提供切换显卡的功能，请务必提醒用户可能会耗费很长时间！  
---@param gpu string
function lstg.ChangeGPU(gpu)
end

---@class lstg.MonitorInfo
local _ = {
    x = 0,
    y = 0,
    width = 0,
    height = 0,
}

--- [LuaSTG Sub v0.19.6 新增]
---@return lstg.MonitorInfo[]
function lstg.ListMonitor()
end
