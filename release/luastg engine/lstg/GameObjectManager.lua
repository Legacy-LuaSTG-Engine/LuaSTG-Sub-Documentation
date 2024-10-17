---@diagnostic disable: missing-return, duplicate-set-field

--------------------------------------------------------------------------------
--- 类
--- Class

---@class lstg.GameObjectManager.Metrics
local Metrics = {
    capacity = 32768,
    allocated = 0,
    unallocated = 32768,
}

---@class lstg.GameObjectManager
local GameObjectManager = {}

---@return lstg.GameObjectManager.Metrics
function GameObjectManager:getMetrics()
end

function GameObjectManager:reset()
end

--------------------------------------------------------------------------------

function GameObjectManager:updateNextFrame()
end

function GameObjectManager:update()
end

---@param group_id number
---@param group_id_other number
function GameObjectManager:checkIntersection(group_id, group_id_other)
end

---@param group_pairs { [1]:number, [2]:number }[]
function GameObjectManager:checkIntersection(group_pairs)
end

---@param left number
---@param right number
---@param bottom number
---@param top number
function GameObjectManager:setWorldBoundary(left, right, bottom, top)
end

function GameObjectManager:checkWorldBoundary()
end

--------------------------------------------------------------------------------

function GameObjectManager:draw()
end

--------------------------------------------------------------------------------

---@generic T : lstg.GameObject
---@return T
function GameObjectManager:allocate()
end

---@generic C
---@generic T : lstg.GameObject
---@param game_object_class C
---@return T
function GameObjectManager:allocate(game_object_class)
end

-- init, del, kill 都可以在 lua 层实现

---@generic T : lstg.GameObject
---@param game_object T
function GameObjectManager:queueFree(game_object)
end

-- lstg.SetV, lstg.GetV, lstg.Angle, lstg.Dist 都可以在 lua 层实现

--------------------------------------------------------------------------------

---@generic T : lstg.GameObject
---@param game_object T
function GameObjectManager:isInsideWorldBoundary(game_object)
end

--------------------------------------------------------------------------------

---@return fun(game_object: lstg.GameObject, i: number?): lstg.GameObject, number
function GameObjectManager:iterator()
end

---@param group_id number
---@return fun(game_object: lstg.GameObject, i: number?): lstg.GameObject, number
function GameObjectManager:iterator(group_id)
end

--------------------------------------------------------------------------------
--- 查询
--- Query

---@return lstg.GameObjectManager
function GameObjectManager.getDefault()
end

return GameObjectManager
