---@diagnostic disable: missing-return

--------------------------------------------------------------------------------
--- 类

--- 文件归档是将一个或多个文件或文件夹合并储存在同一个文件内的技术，常见格式有 zip、tar 等  
--- 
--- 文件归档可以视为一个单独的只读文件系统，文件路径的格式一般为：`目录1/目录2/.../文件`
--- 路径开头不需要额外的 `/`，且不支持 URL 协议  
--- 
--- 比如以下的文件归档 `example.zip`：  
--- 
--- * `resources/`
--- * `resources/background.png`
--- * `resources/avatar.jpg`
--- * `readme.txt`
--- * `manifest.json`
--- 
--- 根目录下有一个文件夹 `resources`，两个文件 `readme.txt`、`manifest.json`；  
--- 文件夹 `resources` 内有两个文件 `background.png`、`avatar.jpg`  
---@class lstg.FileArchive : lstg.FileSystem.FileTree
local FileArchive = {}

--------------------------------------------------------------------------------
--- 静态方法

---@param path string
---@param secret string?
---@return lstg.FileArchive? archive
---@return string message?
function FileArchive.open(path, secret)
end

return FileArchive
