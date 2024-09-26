
---@class lstg.ResourceManager
local M = {}

lstg.ResourceManager = M

---@param name lstg.ResourcePoolType
---@return lstg.ResourceCollection
function M.getResourceCollection(name)
    ---@diagnostic disable-next-line: missing-return
end

---@param name lstg.ResourcePoolType
function M.setCurrentResourceCollection(name)
end

---@return lstg.ResourcePoolType
function M.getCurrentResourceCollection()
    ---@diagnostic disable-next-line: missing-return
end

return M
