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

---@return boolean primary
function M:isPrimary()
end

---@return number x
---@return number y
function M:getDisplayScale()
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
