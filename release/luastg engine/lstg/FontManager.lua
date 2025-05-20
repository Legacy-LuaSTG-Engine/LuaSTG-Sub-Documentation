---@diagnostic disable: missing-return, unused-local

--- 字体管理器：字体注册中心  
--- 
--- 字体管理器按字体族-字体变体的树状结构管理所有字体，例如：  
---  
--- * 新宋体  
---     * 常规  
--- * 微软雅黑  
---     * 常规  
---     * 粗体  
---     * 细体  
--- * Cascadia Mono  
---     * 常规  
---     * 斜体  
---     * 粗体  
---     * 粗体斜体  
--- 
--- 已注册的字体可以在 `lstg.TextLayout` 中使用，在指定了
--- 字体族名称、字重等参数后，字体管理器会自动匹配最符合的字体。  
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
