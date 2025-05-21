---@diagnostic disable: unused-local, missing-return, duplicate-set-field

---@class lstg.Image
local Image = {}

--------------------------------------------------------------------------------
--- 基本信息
--- Basic information

---@return lstg.Vector2 size
function Image:getSize()
end

--------------------------------------------------------------------------------
--- 像素操作方法
--- Pixels operation methods

---@param position lstg.Vector2
---@param color lstg.Color
---@return lstg.Image self
function Image:setPixel(position, color)
end

---@param x integer
---@param y integer
---@param color lstg.Color
---@return lstg.Image self
function Image:setPixel(x, y, color)
end

---@param position lstg.Vector2
---@return lstg.Color color
function Image:getPixel(position)
end

---@param x integer
---@param y integer
---@return lstg.Color color
function Image:getPixel(x, y)
end

--------------------------------------------------------------------------------
--- 输出方法
--- Output methods

---@return lstg.Image cloned_image
function Image:clone()
end

---@param path string
---@return boolean success
---@return string? error_message
function Image:saveToFile(path)
end

--------------------------------------------------------------------------------
--- 静态方法
--- Static methods

---@param size lstg.Vector2
---@return lstg.Image new_image
function Image.create(size)
end

---@param width integer
---@param height integer
---@return lstg.Image new_image
function Image.create(width, height)
end

---@param path string
---@return lstg.Image? new_image
---@return string? error_message
function Image.loadFromFile(path)
end

return Image
