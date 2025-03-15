---@diagnostic disable: missing-return, unused-local, duplicate-set-field

--------------------------------------------------------------------------------
--- 类
--- Class

---@class lstg.SpriteRenderer
local SpriteRenderer = {}

--------------------------------------------------------------------------------
--- 设置
--- Setup

---@param x number
---@param y number
function SpriteRenderer:setPosition(x, y)
end

---@param x number
---@param y number?
function SpriteRenderer:setScale(x, y)
end

---@param r number
function SpriteRenderer:setRotation(r)
end

---@param x number
---@param y number
---@param rot number
---@param hscale number
---@param vscale number
function SpriteRenderer:setTransform2D(x, y, rot, hscale, vscale)
end

---@param sprite lstg.Sprite
function SpriteRenderer:setSprite(sprite)
end

---@param color lstg.Color
function SpriteRenderer:setBlendColor(color)
end

---@param c1 lstg.Color
---@param c2 lstg.Color
---@param c3 lstg.Color
---@param c4 lstg.Color
function SpriteRenderer:setBlendColor(c1, c2, c3, c4)
end

---@param blend lstg.BlendMode
function SpriteRenderer:setLegacyBlendState(blend)
end

--------------------------------------------------------------------------------
--- 绘制
--- Draw

function SpriteRenderer:draw()
end

--------------------------------------------------------------------------------
--- 静态方法
--- Static methods

---@return lstg.SpriteRenderer
function SpriteRenderer.create()
end

---@param sprite lstg.Sprite
---@return lstg.SpriteRenderer
function SpriteRenderer.create(sprite)
end

return SpriteRenderer
