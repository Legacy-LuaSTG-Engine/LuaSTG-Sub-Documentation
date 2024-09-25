---@diagnostic disable: missing-return

---@class lstg.Window
local M = {}

--------------------------------------------------------------------------------
--- window setting

---@param width number
---@param height number
function M:setSize(width, height)
end

---@return number width
---@return number height
function M:getSize()
end

---@param text string
function M:setTitle(text)
end

---@return string text
function M:getTitle()
end

---@param style lstg.Window.FrameStyle
function M:setStyle(style)
end

---@return lstg.Window.FrameStyle style
function M:getStyle()
end

--[[

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

---@param display lstg.Display?
function M:centered(display)
end

--]]

---@param display lstg.Display?
function M:setWindowed(display)
end

---@param display lstg.Display?
function M:setFullscreen(display)
end

--------------------------------------------------------------------------------
--- known window instance

---@return lstg.Window
function M.getMain()
end

return M
