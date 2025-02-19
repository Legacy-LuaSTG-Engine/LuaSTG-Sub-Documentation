---@diagnostic disable: unused-local, missing-return

local PrimitiveTopology = require("lstg.PrimitiveTopology")

---@class lstg.Mesh
local Mesh = {}

---@class lstg.Mesh.CreateOptions
local CreateOptions = {
    --- 顶点数量  
    ---@type integer
    vertex_count = 0,

    --- 顶点索引数量  
    --- 不提供该字段或将值设为 0 时，不启用顶点索引功能  
    ---@type integer?
    index_count = 0,

    --- 图元拓扑  
    --- 不提供该字段时，默认使用三角形列表（`lstg.PrimitiveTopology.triangle_list`）  
    ---@see lstg.PrimitiveTopology
    ---@type lstg.PrimitiveTopology?
    primitive_topology = PrimitiveTopology.triangle_list,
}

--- 示例代码：  
--- ```lua
--- local Mesh = require("lstg.Mesh")
--- local PrimitiveTopology = require("lstg.PrimitiveTopology")
--- local mesh1 = Mesh.create({
---     vertex_count = 10,
---     index_count = 24,
---     primitive_topology = PrimitiveTopology.triangle_list,
--- })
--- ```
---@param options lstg.Mesh.CreateOptions
---@return lstg.Mesh
function Mesh.create(options)
end

return Mesh
