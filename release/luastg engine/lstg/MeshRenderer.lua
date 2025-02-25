---@diagnostic disable: unused-local, missing-return, duplicate-set-field

--------------------------------------------------------------------------------
--- 类
--- Class

---@class lstg.MeshRenderer
local MeshRenderer = {}

--------------------------------------------------------------------------------
--- 设置
--- Setup

---@param x number
---@param y number
---@param z number? @default 0.0
function MeshRenderer:setPosition(x, y, z)
end

---@param x number
---@param y number
---@param z number? @default 1.0
function MeshRenderer:setScale(x, y, z)
end

---@param yaw number
---@param pitch number
---@param roll number
function MeshRenderer:setRotationYawPitchRoll(yaw, pitch, roll)
end

---@param mesh lstg.Mesh
function MeshRenderer:setMesh(mesh)
end

---@param texture lstg.Texture2D
function MeshRenderer:setTexture(texture)
end

--------------------------------------------------------------------------------
--- 绘制
--- Draw

function MeshRenderer:draw()
end

--------------------------------------------------------------------------------
--- 静态方法
--- Static methods

---@return lstg.MeshRenderer
function MeshRenderer.create()
end

---@param mesh lstg.Mesh
---@param texture lstg.Texture2D
---@return lstg.MeshRenderer
function MeshRenderer.create(mesh, texture)
end

return MeshRenderer
