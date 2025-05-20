---@diagnostic disable: missing-return, unused-local

--- 字体管理器：字体注册中心  
---@class lstg.FontManager
local FontManager = {}

--- 注册一个字体文件，字体文件中包含的所有字体变体都会加载到字体管理器中  
---@param path string
---@return boolean
function FontManager.registerFont(path)
end

--- 取消注册一个字体文件  
---@param path string
---@return boolean
function FontManager.unregisterFont(path)
end

return FontManager
