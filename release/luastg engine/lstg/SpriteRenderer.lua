---@diagnostic disable: missing-return, unused-local, duplicate-set-field

--------------------------------------------------------------------------------
--- 类
--- Class

---@class lstg.SpriteRenderer : lstg.Renderer
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

---@param sprite lstg.Sprite
function SpriteRenderer:setSprite(sprite)
end

---@param color lstg.Color
function SpriteRenderer:setColor(color)
end

---@param c1 lstg.Color
---@param c2 lstg.Color
---@param c3 lstg.Color
---@param c4 lstg.Color
function SpriteRenderer:setColor(c1, c2, c3, c4)
end

---@param blend lstg.BlendMode
function SpriteRenderer:setLegacyBlendState(blend)
end

--------------------------------------------------------------------------------
--- 辅助
--- Helper

---@param left number
---@param right number
---@param bottom number
---@param top number
function SpriteRenderer:setRect(left, right, bottom, top)
end

---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param x3 number
---@param y3 number
---@param x4 number
---@param y4 number
function SpriteRenderer:setQuad(x1, y1, x2, y2, x3, y3, x4, y4)
end

---@param x1 number
---@param y1 number
---@param z1 number
---@param x2 number
---@param y2 number
---@param z2 number
---@param x3 number
---@param y3 number
---@param z3 number
---@param x4 number
---@param y4 number
---@param z4 number
function SpriteRenderer:setQuad(x1, y1, z1, x2, y2, z2, x3, y3, z3, x4, y4, z4)
end

---@param x number
---@param y number
---@param rot number? default to 0
---@param hscale number? default to 1.0
---@param vscale number? default to hscale
function SpriteRenderer:setTransform(x, y, rot, hscale, vscale)
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
