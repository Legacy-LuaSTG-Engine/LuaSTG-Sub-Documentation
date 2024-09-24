---@diagnostic disable: missing-return

--------------------------------------------------------------------------------
--- 操作系统坐标系
--- OS coordinate system
--- Windows: https://learn.microsoft.com/en-us/windows/win32/gdi/multiple-display-monitors



--                            |
--                            |
--                            |
--            ....+-----------+----------------+....
--            :   |           .                |   :
--            :   |           .                |   :
--            :   |         [Monitor 2]        |   :
--            :   |           .                |   :
--            :   |           .                |   :
-- -----------+---+-----------+----------------+---+------> +X
--            |               |\_ (0, 0)           |
--            |  [Monitor 3]  |                    |
--            |               |     [Monitor 1]    |
--            +---------------+      (primary)     |
--            :               |                    |
--            :...............+--------------------+
--                            |
--            ^               |
--            |               |
--      virtual-screen        |
--                            v
--                            
--                           +Y



--    left-top
--        v
--        +-----------------[Monitor]---------------+-----> +X
--        |         System Status Bar, etc...       |    ^
--        +-----------------------------------------+    |
--        |                                         |    |
--        |                                         |    |
--        |                                         |    |
--        |                                         |    |
--        |               [Work Area]               | monitor-height
--        |                                         |    |
--        |                                         |    |
--        |                                         |    |
--        |                                         |    |
--        +-----------------------------------------+    |
--        |           System TaskBar, etc...        |    v
--        +-----------------------------------------+   ---
--        |
--        |<------------ monitor-width ------------>|
--        |
--        v
--        
--       +Y



--    left-top
--        v
--        +-----------------[Monitor]---------------+-----> +X
--        |                                         |    ^
--        | left-top                                |    |
--        |    v                                    |    |
--        |    +------[Window]------+     ---       |    |
--        |    |                    |      ^        |    |
--        |    |                    |      |        |    |
--        |    |                    | window-height | monitor-height
--        |    |                    |      |        |    |
--        |    |                    |      v        |    |
--        |    +--------------------+     ---       |    |
--        |                                         |    |
--        |    |<-- window-width -->|               |    |
--        |                                         |    v
--        +-----------------------------------------+   ---
--        |
--        |<------------ monitor-width ------------>|
--        |
--        v
--        
--       +Y



-- 操作系统提供了各式各样的窗口装饰，如标题栏、边框……
-- System provides Window Decorations: TitleBar, Borders, etc...
--
-- (0, 0) +-----------------[Window]----------------+-----> +X
--        |              TitleBar, etc... [-][#][X] |    ^
--        |+---------------------------------------+|    |
--        ||                                       ||    |
--        ||                                       ||    |
--        ||                                       ||    |
--        ||                                       ||    |
--        ||             [Client Area]             || window-height
--        ||                                       ||    |
--        ||                                       ||    |
--        ||                                       ||    |
--        ||                                       ||    |
--        ||                                       ||    |
--        ||_______________________________________/|    v
--        +-----------------Borders-----------------+   ---
--        |
--        |<------------- window-width ------------>|
--        |
--        v
--        
--       +Y

--------------------------------------------------------------------------------
--- 类
--- Class

---@class lstg.PlatformMonitor.Rect
local _ = {
    left = 0,
    top = 0,
    right = 0,
    bottom = 0,
}

---@class lstg.PlatformMonitor
local M = {}

--------------------------------------------------------------------------------
--- 显示器信息
--- Monitor info

--- 获取逻辑显示器尺寸（像素）  
--- Get logical monitor size (in pixels)  
---@return number width
---@return number height
function M:getSize()
end

--- 获取逻辑显示器位置（像素），即左上角的坐标  
--- 只有一个物理显示器的设备，唯一的逻辑显示器位置一般为 (0, 0)  
--- 具有多个物理显示器的设备，每个逻辑显示器的位置由显示器布局决定  
--- Get logical monitor position (in pixels), i.e. the coordinates of left-top  
--- For devices with only one physical monitor,
--- the only one logical monitor position is typically (0, 0)  
--- For devices with multiple physical monitors, position of
--- each logical monitor is determined by the Monitor Layout
---@return number x
---@return number y
function M:getPosition()
end

--- 获取逻辑显示器矩形（像素）  
--- Get logical monitor rect (in pixels)  
---@return lstg.PlatformMonitor.Rect rect
function M:getRect()
end

--- 获取逻辑显示器工作区尺寸（像素）  
--- 工作区不包含操作系统提供的界面，如状态栏、任务栏等  
--- Get logical monitor work-area size (in pixels)  
--- Work-area does not contain shells provided by the OS,
--- such as the StatusBar, TaskBar, etc...
---@return number width
---@return number height
function M:getWorkAreaSize()
end

---@see lstg.PlatformMonitor.getPosition
---@see lstg.PlatformMonitor.getWorkAreaSize
---@return number x
---@return number y
function M:getWorkAreaPosition()
end

---@see lstg.PlatformMonitor.getRect
---@see lstg.PlatformMonitor.getWorkAreaSize
---@return lstg.PlatformMonitor.Rect rect
function M:getWorkAreaRect()
end

--- 判断当前逻辑显示器是否为主显示器  
--- 主显示器的位置一般位于虚拟屏幕的原点，即 (0, 0)  
--- Determines whether the current logical monitor is the primary  
--- The position of the logical primary monitor is generally at
--- the origin of the Virtual Screen, i.e. (0, 0) 
---@return boolean primary
function M:isPrimary()
end

--- 获取逻辑显示器显示缩放，初始值为 1.0（100%）  
--- 用户可能在操作系统设置中设置了更高的缩放值，且可能为每个逻辑显示器设置了不同的缩放值    
--- 更高的缩放值可以使窗口、控件、文本等内容以更大的尺寸显示，以适配高像素密度显示器  
--- Get logical monitor display scale, initial value is 1.0 (100%)  
--- Users may set a higher value in the OS Settings,
--- and may set a different value for each logical monitor  
--- Higher values allow windows, controls, text, and more
--- to be displayed at a larger size to accommodate high-pixel density monitors
---@return number scale
function M:getDisplayScale()
end

--------------------------------------------------------------------------------
--- 查询
--- Query

--- 获取所有逻辑显示器  
--- 返回的对象**不应该缓存**  
--- 用户插拔物理显示器、修改逻辑显示器布局、
--- 修改逻辑显示器显示模式、切换应用程序全屏等，都会导致 `lstg.PlatformMonitor` 对象失效  
--- Get all logical monitors  
--- The returned objects **should not be cached**  
--- users plugging and unplugging physical monitors,
--- modifying logical monitor layouts,
--- modifying logical monitor display modes,
--- switching applications fullscreen mode, etc...,
--- will invalidate `lstg.PlatformMonitor` object  
---@return lstg.PlatformMonitor[]
function M.getAll()
end

---@see lstg.PlatformMonitor.getAll
---@see lstg.PlatformMonitor.isPrimary
---@return lstg.PlatformMonitor monitor
function M.getPrimary()
end

--- 查找离指定窗口最近的逻辑显示器  
--- 如果查找失败，默认返回主逻辑显示器  
--- Find the logical monitor closest to the specified window  
--- If it fails, returns the primary logical monitor by default  
---   
---@see lstg.PlatformMonitor.getAll
---@see lstg.PlatformMonitor.getPrimary
---@param window lstg.PlatformWindow
---@return lstg.PlatformMonitor monitor
function M.getNearestFromWindow(window)
end

return M
