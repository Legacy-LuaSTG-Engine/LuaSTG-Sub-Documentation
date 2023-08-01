--------------------------------------------------------------------------------
--- LuaSTG Sub 程序框架方法
--------------------------------------------------------------------------------

---@diagnostic disable: missing-return

--------------------------------------------------------------------------------
--- 迁移指南

-- 关于 lstg.ShowSplashWindow：
-- 已经 Xiliusha 连根拔掉，目前只留有一个空方法

-- 以下内容已经过时：  
-- 
-- 关于显示模式和刷新率：
-- 屏幕的刷新率为以分数储存的有理数，由分子、分母两个部分组成
-- 如果想正确进入独占全屏，最好通过 lstg.EnumResolutions 枚举支持的显示模式
-- 然后传递给 lstg.ChangeVideoMode
-- 窗口化则不需要传递刷新率参数
-- 
-- 随着画布模式的引入，全屏的内部实现已经交给引擎自动管理

--------------------------------------------------------------------------------
--- 版本信息
--- Version Informations

--- [LuaSTG Sub v0.15.6 新增]  
--- 获取引擎版本号，分别代表 major、minor、patch  
--- [LuaSTG Sub v0.15.6 Add]  
--- Get the engine version numbers, representing major, minor, patch  
---@return number, number, number
function lstg.GetVersionNumber()
end

--- [LuaSTG Sub v0.15.6 新增]  
--- 获取引擎版本友好名称，例如：LuaSTG Sub v0.10.0-beta  
--- [LuaSTG Sub v0.15.6 Add]  
--- Get the engine version friendly name, for example: LuaSTG Sub v0.10.0-beta  
---@return string
function lstg.GetVersionName()
end

--------------------------------------------------------------------------------
--- 输出日志

--- 输出一条日志
--- 1, 2, 3, 4, 5, 分别代表 debug, info, warning, error, fatal 共5个级别
---@param level number
---@param msg string
function lstg.Log(level, msg)
end

--- 输出一条信息，以 info 级别输出日志
---@param msg string
function lstg.SystemLog(msg)
end

--- 相当于 print 到引擎日志文件，以 info 级别输出日志
---@vararg string
function lstg.Print(...)
end

--------------------------------------------------------------------------------
--- 初始化方法

--- 初始化方法，仅在 launch 文件内生效，运行时调用该方法将会触发警告消息
--- 设置游戏是否窗口化显示
--- 默认设置为 true，即窗口化显示
---@param windowed boolean
function lstg.SetWindowed(windowed)
end

--- 初始化方法，仅在 launch 文件内生效，运行时调用该方法将会触发警告消息
--- 设置游戏是否启用垂直同步
--- 默认设置为 true，即开启垂直同步
---@param Vsync boolean
function lstg.SetVsync(Vsync)
end

--- [LuaSTG Sub v0.11.0 更改]  
--- 初始化方法，仅在 launch 文件内生效，运行时调用该方法将会触发警告消息  
--- 设置游戏窗口分辨率  
--- 默认设置为 640x480  
---@param width number
---@param height number
function lstg.SetResolution(width, height)
end

--- [LuaSTG Sub v0.11.0 新增]
--- [LuaSTG Sub v0.12.0 更改] 新增 dGPU_trick 参数
--- [LuaSTG Sub v0.19.5 更改] 移除 dGPU_trick 参数
--- 初始化方法，仅在 launch 文件内生效，运行时调用该方法将会触发警告消息
--- 设置引擎创建渲染设备时使用的显卡
---@param gpu string
function lstg.SetPreferenceGPU(gpu)
end

--------------------------------------------------------------------------------
--- 窗口与显示

--- 设置帧率限制，运行时将不会超过设置的帧率
--- 默认设置为 60，程序会以 60FPS 的帧率运行
---@param FPSlimit number
function lstg.SetFPS(FPSlimit)
end

--- 获取当前帧率
---@return number
function lstg.GetFPS()
end

--- 显示、隐藏鼠标指针
---@param show boolean
function lstg.SetSplash(show)
end

--- 更改窗口名称
---@param windowtitle string
function lstg.SetTitle(windowtitle)
end

--- lstg.EnumResolutions
--- 此 API 经历了多次变动，但是随着画布模式的推出，很多行为已经成为历史  
--- 
--- [LuaSTG Sub 更改]
--- 枚举支持的显示模式
--- 返回值为以 { width:number, height:number, refresh_rate_numerator:number, refresh_rate_denominator:number } 组成的数组
--- 比如 { { 640, 480, 60, 1 }, { 800, 600, 60, 1 } }
---   * lstg.EnumResolutions():number[][]

--- [LuaSTG Sub v0.19.100 废弃]
--- 注：该 API 的行为已发生巨大的变动，更多内容请查看上方的变更历史  
--- 由于引擎内部实现发生巨大变化，不再能枚举到显示模式  
--- 出于兼容性考虑，目前会固定返回一组分辨率  
---@deprecated
---@return number[][]
function lstg.EnumResolutions()
end

--- [LuaSTG Sub v0.11.0 新增]
--- 枚举可用的显卡，禁止在launch脚本中调用
---@return string[]
function lstg.EnumGPUs()
    return { "Intel XXXX", "NVIDIA YYYY", "AMD ZZZZ" }
end

--- lstg.ChangeVideoMode
--- 此 API 经历了多次变动，但是随着画布模式的推出，很多行为已经成为历史  
--- 现在它的使用方式更简单，而且不再需要处理复杂的显示模式枚举、挑选、应用、错误恢复  
--- 
--- [LuaSTG Sub 更改]  
--- 更改显示模式  
--- 如果要进入独占全屏，最好填写正确的宽、高和刷新率的分子和分母  
--- 不填写则由引擎自动决定，引擎会尽可能地选择 60Hz 的整数倍或者靠近 60Hz 的刷新率  
--- 运气差的时候可能会被自动选择到 75Hz、48Hz 这样的刷新率  
---   * lstg.ChangeVideoMode(width:number, height:number, windowed:boolean, vsync:boolean):boolean  
---   * lstg.ChangeVideoMode(width:number, height:number, windowed:boolean, vsync:boolean, refresh_rate_numerator:number, refresh_rate_denominator:number):boolean  
--- 
--- [LuaSTG Sub v0.19.6 更改]
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
--- 
--- [LuaSTG Sub v0.19.100 更改]  
--- 进行了以下修改：
---   * 全屏不再是固定的传统独占全屏
---   * 分辨率为画布分辨率而不是窗口、传统独占全屏显示模式的分辨率

--- [LuaSTG Sub v0.19.100 修改]  
--- 注：该 API 的行为已发生巨大的变动，更多内容请查看上方的变更历史  
--- 指定画面显示方式：画布分辨率、全屏、垂直同步  
--- 画布分辨率不再固定等同于窗口分辨率  
--- 窗口分辨率可以自由调整，而不改变画布分辨率  
--- 当画布分辨率和窗口不匹配时，引擎将自动缩放画布来显示画面  
--- 全屏模式不再固定使用传统的独占全屏：  
---   * Windows 10/11 使用桌面合成引擎  
---   * Windows 7/8/8.1 先尝试进入传统独占全屏，若失败则使用全屏无边框窗口  
---@param width number
---@param height number
---@param windowed boolean
---@param vsync boolean
---@return boolean
function lstg.ChangeVideoMode(width, height, windowed, vsync)
end

--------------------------------------------------------------------------------
--- 资源管理

--- [LuaSTG Sub v0.20.14 修改]  
--- 加载 lua 源文件，并返回源文件中返回的值  
---@param path string
---@param archivefile string
---@overload fun(scriptfilepath:string)
function lstg.DoFile(path, archivefile)
end

--- 从指定文件读取所有内容
--- 可读取任意文件，但是内容可能并非是纯文本
---@param path string
---@param archivepath string
---@return string
---@overload fun(path:string)
function lstg.LoadTextFile(path, archivepath)
end

--- 加载压缩包
---@param path string
---@param password string
---@overload fun(path:string)
function lstg.LoadPack(path, password)
end

--- 卸载压缩包，参数为加载该压缩包时填写的路径
---@param path string
function lstg.UnloadPack(path)
end

---将指定文件（可以是压缩包内的文件）复制到指定路径
---@param src string @源文件路径
---@param dest string @目标文件路径
function lstg.ExtractRes(src, dest)
end

--- 枚举指定目录下的文件，返回类似以下结构的table，第二项不为空时表示该文件在压缩包内
--- {
---     { "sample.file", nil },          -- 在文件系统中
---     { "dir/sample.file", nil },      -- 在文件系统中
---     { "sample.file", "sample.zip" }, -- 在压缩包内
--- }
---@param searchpath string
---@param extendname string
---@param packname string
---@return table[]
---@overload fun(searchpath:string)
---@overload fun(searchpath:string, extendname:string)
function lstg.FindFiles(searchpath, extendname, packname)
end
