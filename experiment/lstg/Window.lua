---@diagnostic disable: missing-return

---@class lstg.Window
local M = {}

--------------------------------------------------------------------------------
--- window setting

---@param width number
---@param height number
function M:setClientAreaSize(width, height)
end

---@return lstg.Display.Size size
function M:getClientAreaSize()
end

---@param text string
function M:setTitle(text)
end

---@param style lstg.Window.FrameStyle
function M:setStyle(style)
end

--[[

---@return lstg.Window.FrameStyle style
function M:getStyle()
end

---@param visibility lstg.Window.Visibility
function M:setVisibility(visibility)
end

---@return lstg.Window.Visibility visibility
function M:getVisibility()
end

--]]

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

--[[

function M:minimize()
end

function M:maximize()
end

function M:restore()
end

function M:close()
end

--]]

---@param display lstg.Display?
function M:centered(display)
end

-- TODO: 应该把 client 区域尺寸、窗口样式等一起放在 setWindowed 的参数中

---@param display lstg.Display?
function M:setWindowed(display)
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

---@enum lstg.Window.Windows11WindowCornerPreferenceExtension.WindowCornerPreference
local WindowCornerPreference = {
    default = 0,
    disable = 1,
    enable = 2,
    small = 3,
}

---@class lstg.Window.Windows11WindowCornerPreferenceExtension
local Windows11WindowCornerPreferenceExtension = {}

---@param value lstg.Window.Windows11WindowCornerPreferenceExtension.WindowCornerPreference
function Windows11WindowCornerPreferenceExtension:setWindowCornerPreference(value)
end

--------------------------------------------------------------------------------
--- known window instance

---@return lstg.Window
function M.getMain()
end

return M
