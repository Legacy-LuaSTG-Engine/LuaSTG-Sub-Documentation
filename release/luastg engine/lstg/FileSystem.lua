---@diagnostic disable: missing-return

--------------------------------------------------------------------------------
--- 文件信息

---@class lstg.FileSystem.FileInfo
---@field type '"file"' | '"directory"'
---@field name string
---@field path string

--------------------------------------------------------------------------------
--- 文件树

---@class lstg.FileSystem.FileTree
local FileTree = {}

---@param path string
---@return boolean
function FileTree:isFile(path)
end

---@param path string
---@return boolean
function FileTree:isDirectory(path)
end

---@param search_path string?
---@return lstg.FileSystem.FileInfo[]
function FileTree:findAll(search_path)
end

--------------------------------------------------------------------------------
--- 类

--- # 文件系统  
--- 
--- LuaSTG 引擎的文件系统是受限制的复合文件系统
--- 
--- ## 文件系统的路径  
--- 
--- 文件系统的路径由 `协议://域名/路径` 组成，目前支持以下协议：  
--- 
--- * `res://`：只读资源，包括脚本、图像、音频、模型等  
---     * `res://merged/`：【读】合并的文件系统  
---     * `res://application/`：【读】以应用程序可执行文件所在目录为根目录的文件系统  
---     * `res://working/`：【读】以工作目录为根目录的文件系统  
---     * `res://资源包名称/`：【读】资源包文件系统  
---     * `res://其他自定义域名/`：【读】  
--- * `user://`：用户数据  
---     * `user://local/`：【读/写】通用本地储存目录，包括日志、配置、存档、数据库等  
---     * `user://image/`：【写】用户图像目录  
---     * `user://audio/`：【写】用户音频目录  
---     * `user://video/`：【写】用户视频目录  
---     * `user://document/`：【写】用户文档目录  
---     * `user://download/`：【写】用户下载目录  
--- 
--- 不支持的协议将会抛出错误。  
--- 
--- 如果路径中缺少协议：  
--- 
--- * 读取资源文件时：默认按 `res://merged/路径` 处理  
--- * 可读写的 lua 标准库 `io.open` 等函数：默认按 `user://local/路径` 处理  
--- 
--- 用户数据的路径映射：
--- 
--- * Windows 平台：  
---     * `user://local/`：映射到 `C:/Users/用户名/AppData/Roaming/应用程序名称`  
---     * `user://image/`：映射到 `C:/Users/用户名/Pictures/应用程序名称`  
---     * `user://audio/`：映射到 `C:/Users/用户名/Music/应用程序名称`  
---     * `user://video/`：映射到 `C:/Users/用户名/Videos/应用程序名称`  
---     * `user://document/`：映射到 `C:/Users/用户名/Documents/应用程序名称`  
---     * `user://download/`：映射到 `C:/Users/用户名/Downloads/应用程序名称`  
---@class lstg.FileSystem
local FileSystem = {}

--------------------------------------------------------------------------------
--- 资源域名

--- 自定义资源域名，目标路径会成为该域名的根路径，目标路径仅支持
--- `res://` 协议，且不包括 `res://merged/`、`res://其他自定义域名/`  
---@param domain_name string
---@param path string
---@return boolean success
---@return string? message
function FileSystem.addResourceDomain(domain_name, path)
end

---@see lstg.FileSystem.addResourceDomain
---@param domain_name string
---@return boolean success
---@return string? message
function FileSystem.removeResourceDomain(domain_name)
end

---@see lstg.FileSystem.addResourceDomain
function FileSystem.removeAllResourceDomain()
end

--------------------------------------------------------------------------------
--- 资源包注册

---@param domain_name string
---@param resource_package lstg.FileArchive
---@return boolean success
---@return string? message
function FileSystem.addResourcePackage(domain_name, resource_package)
end

---@see lstg.FileSystem.addResourcePackage
---@param domain_name string
---@return boolean success
---@return string? message
function FileSystem.removeResourcePackage(domain_name)
end

---@see lstg.FileSystem.addResourcePackage
function FileSystem.removeAllResourcePackage()
end

--------------------------------------------------------------------------------
--- 文件夹管理

--- 创建文件夹，路径仅支持 `user://` 协议，如果路径中缺少协议，默认按
--- `user://local/路径` 处理  
---@param path string
---@param recursive boolean?
---@return boolean success
---@return string? message
function FileSystem.createDirectory(path, recursive)
end

--- 删除文件夹，路径仅支持 `user://` 协议，如果路径中缺少协议，默认按
--- `user://local/路径` 处理  
---@param path string
---@param recursive boolean?
---@return boolean success
---@return string? message
function FileSystem.removeDirectory(path, recursive)
end

--------------------------------------------------------------------------------
--- 静态方法

---@param path string
---@return boolean
function FileSystem.isFile(path)
end

---@param path string
---@return boolean
function FileSystem.isDirectory(path)
end

--- 列出文件和文件夹  
--- 
--- 支持的搜索路径：  
--- 
--- * 不传递参数默认按 `res://merged/` 处理  
--- * `res://` 及其子路径  
--- * `user://local/` 及其子路径  
---@param search_path string?
---@return lstg.FileSystem.FileInfo[]
function FileSystem.findAll(search_path)
end

return FileSystem
