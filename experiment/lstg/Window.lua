---@diagnostic disable: missing-return

---@class lstg.Window
local M = {}

--------------------------------------------------------------------------------
--- window setting

---@param text string
function M:setTitle(text)
end

---@return lstg.Display.Size size
function M:getClientAreaSize()
end

---@return lstg.Window.FrameStyle style
function M:getStyle()
end

---@return number scale
function M:getDisplayScale()
end

--------------------------------------------------------------------------------
--- cursor setting

--[[

---@param visible boolean
function M:setCursorVisibility(visible)
end

---@return boolean visible
function M:getCursorVisibility()
end

---@param shape lstg.Window.CursorShape
function M:setCursorCursorShape(shape)
end

---@return lstg.Window.CursorShape shape
function M:getCursorCursorShape()
end

--]]

--------------------------------------------------------------------------------
--- window placement

---@param display lstg.Display?
function M:centered(display)
end

---@param width number
---@param height number
---@param style lstg.Window.FrameStyle?
---@param display lstg.Display?
function M:setWindowed(width, height, style, display)
end

---@param display lstg.Display?
function M:setFullscreen(display)
end

--------------------------------------------------------------------------------
--- extension

---@generic T
---@param name `T`
---@return T?
function M:queryInterface(name)
end

--------------------------------------------------------------------------------
--- extension: Windows 11 window corner

---@class lstg.Window.Windows11Extension
local Windows11Extension = {}

---@param allow boolean
function Windows11Extension:setWindowCornerPreference(allow)
end

--------------------------------------------------------------------------------
--- known window instance

---@return lstg.Window
function M.getMain()
end

return M
