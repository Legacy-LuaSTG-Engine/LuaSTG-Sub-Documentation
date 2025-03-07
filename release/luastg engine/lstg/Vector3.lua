---@diagnostic disable: missing-return, unused-local

--------------------------------------------------------------------------------
--- 类
--- Class

---@class lstg.Vector3
local Vector3 = {

    ---@type number
    x = 0.0,

    ---@type number
    y = 0.0,

    ---@type number
    z = 0.0,

}

--------------------------------------------------------------------------------
--- 静态方法
--- Static methods

---@param x number
---@param y number
---@param z number
---@return lstg.Vector3
function Vector3.create(x, y, z)
end

return Vector3
