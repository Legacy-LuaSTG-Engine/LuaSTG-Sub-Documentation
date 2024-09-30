---@diagnostic disable: missing-return

--------------------------------------------------------------------------------
--- 类
--- Class

---@class lstg.Window
local M = {}

--------------------------------------------------------------------------------
--- 窗口信息
--- Window info

--- 获取当前窗口客户区尺寸（像素）  
---   
--- Get current client-area size (in pixels)  
---@return lstg.Display.Size size
function M:getClientAreaSize()
end

--- 获取当前窗口框体样式，初始值为 `lstg.Window.FrameStyle.normal`  
--- 注意：全屏模式下返回的是上次设置的样式，而不是当前窗口的样式（无边框模式）  
---   
--- Get the current Window Decorations style, initial value is `lstg.Window.FrameStyle.normal`  
--- Note: Fullscreen mode returns the last style set by `lstg.Window.setWindowed`
--- or other APIs, not the current window's style (borderless)  
---@see lstg.Window.setWindowed
---@return lstg.Window.FrameStyle style
function M:getStyle()
end

---@see lstg.Display.getDisplayScale
---@return number scale
function M:getDisplayScale()
end

--------------------------------------------------------------------------------
--- 窗口设置
--- Window setup

--- 设置窗口标题栏文本  
--- 
--- Modify the text of the window TitleBar  
---@param text string
function M:setTitle(text)
end

--- 进入窗口模式  
--- 参数 `width` 和 `height` 决定了窗口客户区的尺寸（像素）  
--- 可选的参数 `style` 用于修改窗口框体样式  
--- 可选的参数 `display` 用于指定窗口位于哪个显示器  
---   
--- Enter windowed mode  
--- The parameter `width` and `height` specify the client-area size (in pixels)  
--- The optional parameter `style` is used to modify Window Decorations style  
--- The optional parameter `display` is used to specify the Display
--- in which the window is located  
---@param width number
---@param height number
---@param style lstg.Window.FrameStyle?
---@param display lstg.Display?
function M:setWindowed(width, height, style, display)
end

--- 进入全屏模式  
--- 可选的参数 `display` 用于指定窗口位于哪个显示器  
---   
--- Enter fullscreen mode  
--- The optional parameter `display` is used to specify the Display
--- in which the window is located  
---@param display lstg.Display?
function M:setFullscreen(display)
end

--------------------------------------------------------------------------------
--- cursor setting

---@param visible boolean
function M:setCursorVisibility(visible)
end

---@return boolean visible
function M:getCursorVisibility()
end

--[[

---@param shape lstg.Window.CursorShape
function M:setCursorCursorShape(shape)
end

---@return lstg.Window.CursorShape shape
function M:getCursorCursorShape()
end

--]]

--------------------------------------------------------------------------------
--- 拓展
--- Extension

--- 查询特定的拓展接口是否可用，接口不存在或者不支持将返回 nil  
---   
--- Query whether a specific extention interface is available,
--- return `nil` if the interface does not exist or is not supported  
---   
--- 例如 | Example:  
---   
--- ```lua
--- local Window = require("lstg.Window")
--- local main_window = Window.getMain()
--- local extension = main_window:queryInterface("lstg.Window.Windows11Extension")
--- if extension then
---     -- todo...
--- end
--- ```
---@generic T
---@param name `T`
---@return T?
function M:queryInterface(name)
end

--------------------------------------------------------------------------------
--- 拓展：Windows 11 相关拓展
--- Extension: Windows 11

---@class lstg.Window.Windows11Extension
local Windows11Extension = {}

--- 通过该方法可以强制关闭 Windows 11 提供的窗口圆角样式  
---   
--- This method allow to force disable the window rounded corner style
--- provided by Windows 11  
---@param allow boolean
function Windows11Extension:setWindowCornerPreference(allow)
end

--- 在 Windows 11 上启用自动隐藏标题栏功能  
---   
--- Enable auto hide TitlBar on Windows 11  
---@param allow boolean
function Windows11Extension:setTitleBarAutoHidePreference(allow)
end

--------------------------------------------------------------------------------
--- 静态方法
--- Static methods

--- 获取主窗口  
--- 
--- Get instance of main window  
---@return lstg.Window
function M.getMain()
end

return M
