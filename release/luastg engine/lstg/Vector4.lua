---@diagnostic disable: missing-return, unused-local

--------------------------------------------------------------------------------
--- 类
--- Class

---@class lstg.Vector4
local Vector4 = {

    ---@type number
    x = 0.0,

    ---@type number
    y = 0.0,

    ---@type number
    z = 0.0,

    ---@type number
    w = 0.0,

}

--------------------------------------------------------------------------------
--- 静态方法
--- Static methods

---@param x number
---@param y number
---@param z number
---@param w number
---@return lstg.Vector4
function Vector4.create(x, y, z, w)
end

return Vector4
