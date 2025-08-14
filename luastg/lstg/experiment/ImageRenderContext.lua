---@diagnostic disable: missing-return, unused-local, duplicate-set-field

---@class lstg.experiment.ImageRenderContext
local ImageRenderContext = {}

---@param image lstg.Image
---@return lstg.experiment.ImageRenderContext self
function ImageRenderContext:setRenderTarget(image)
end

---@param color lstg.Color
---@return lstg.experiment.ImageRenderContext self
function ImageRenderContext:clear(color)
end

---@param left integer
---@param top integer
---@param right integer
---@param bottom integer
---@param color lstg.Color
---@return lstg.experiment.ImageRenderContext self
function ImageRenderContext:fillRect(left, top, right, bottom, color)
end

---@param left integer
---@param top integer
---@param right integer
---@param bottom integer
---@param thickness integer
---@param color lstg.Color
---@return lstg.experiment.ImageRenderContext self
function ImageRenderContext:drawRect(left, top, right, bottom, thickness, color)
end

---@param left integer
---@param top integer
---@param right integer
---@param bottom integer
---@param image lstg.Image
---@return lstg.experiment.ImageRenderContext self
function ImageRenderContext:drawImage(left, top, right, bottom, image)
end

---@return lstg.experiment.ImageRenderContext
function ImageRenderContext.create()
end

return ImageRenderContext
