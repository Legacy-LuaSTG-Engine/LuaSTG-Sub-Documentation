---@diagnostic disable: missing-return, unused-local

---@class lstg.TextRenderer : lstg.Renderer
local TextRenderer = {}

--------------------------------------------------------------------------------
--- 设置
--- Setup

---@param x number
---@param y number
function TextRenderer:setPosition(x, y)
end

---@param color lstg.Color
function TextRenderer:setColor(color)
end

--- 设置光栅化密度，即每单位包含多少像素  
---@param density integer
function TextRenderer:setRasterizationDensity(density)
end

--------------------------------------------------------------------------------
--- 静态方法
--- Static methods

---@param text_layout lstg.TextLayout?
---@return lstg.TextRenderer
function TextRenderer.create(text_layout)
end

return TextRenderer
