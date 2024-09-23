---@diagnostic disable: missing-return

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
--- monitor info

---@return number width
---@return number height
function M:getSize()
end

---@return number x left-top x
---@return number y left-top y
function M:getPosition()
end

---@return lstg.PlatformMonitor.Rect rect
function M:getRect()
end

---@return number width
---@return number height
function M:getWorkAreaSize()
end

---@return number x left-top x
---@return number y left-top y
function M:getWorkAreaPosition()
end

---@return lstg.PlatformMonitor.Rect rect
function M:getWorkAreaRect()
end

--------------------------------------------------------------------------------
--- query

---@return lstg.PlatformMonitor[]
function M.getAll()
end

---@return lstg.PlatformMonitor monitor
function M.getPrimary()
end

---@param window lstg.PlatformWindow
---@return lstg.PlatformMonitor monitor
function M.getNearestFromWindow(window)
end

return M
