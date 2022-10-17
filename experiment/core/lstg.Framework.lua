
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

--- [LuaSTG Sub 更改]  
--- [LuaSTG Sub v0.19.6 更改]
--- 更改显示模式  
--- 如果要进入独占全屏，最好填写正确的宽、高和刷新率的分子和分母  
--- 不填写则由引擎自动决定，引擎会尽可能地选择 60Hz 的整数倍或者靠近 60Hz 的刷新率  
--- 运气差的时候可能会被自动选择到 75Hz、48Hz 这样的刷新率  
---   
--- 从 LuaSTG Sub v0.19.6 开始，参数的传递方式有所变化。  
---   
--- 窗口化写法，此时 windowed 必须为 true：  
---   * lstg.ChangeVideoMode(windowed:boolean, width:number, height:number, vsync:boolean):boolean  
---   * lstg.ChangeVideoMode(windowed:boolean, width:number, height:number, vsync:boolean, monitor_rect:lstg.MonitorInfo):boolean  
---   * lstg.ChangeVideoMode(windowed:boolean, width:number, height:number, vsync:boolean, monitor_rect:lstg.MonitorInfo, borderless:boolean):boolean  
---   
--- 全屏无边框窗口写法，此时 windowed 必须为 true：  
---   * lstg.ChangeVideoMode(windowed:boolean, monitor_rect:lstg.MonitorInfo, vsync:boolean):boolean  
---   
--- 独占全屏写法，此时 windowed 必须为 false：  
---   * lstg.ChangeVideoMode(windowed:boolean, width:number, height:number, vsync:boolean):boolean  
---   * lstg.ChangeVideoMode(windowed:boolean, width:number, height:number, vsync:boolean, refresh_rate_numerator:number, refresh_rate_denominator:number):boolean  
---   
--- 出于兼容性考虑，以下传统写法仍然支持：  
---   * lstg.ChangeVideoMode(width:number, height:number, windowed:boolean, vsync:boolean):boolean  
---@param windowed boolean
---@param width number
---@param height number
---@param vsync boolean
---@return boolean
---@overload fun(windowed:boolean, width:number, height:number, vsync:boolean, monitor_rect:lstg.MonitorInfo):boolean
---@overload fun(windowed:boolean, width:number, height:number, vsync:boolean, monitor_rect:lstg.MonitorInfo, borderless:boolean):boolean
---@overload fun(windowed:boolean, monitor_rect:lstg.MonitorInfo, vsync:boolean):boolean
---@overload fun(windowed:boolean, width:number, height:number, vsync:boolean, refresh_rate_numerator:number, refresh_rate_denominator:number):boolean
function lstg.ChangeVideoMode(windowed, width, height, vsync)
end
