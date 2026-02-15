---@diagnostic disable: missing-return, unused-local, duplicate-set-field

--------------------------------------------------------------------------------
--- Class | 类

--- RGB 颜色，每个通道由 32 位浮点数表示。  
--- 
--- 颜色值以线性颜色空间储存。  
--- 
--- 每个通道的取值范围应为 [0.0, 1.0]。  
--- 提交给引擎渲染时，超出范围是未定义行为，可能出现意料之外的问题。  
--- 计算时的中间结果可以取任意值，只要保证提交给引擎渲染时所有通道都没有超出范围即可。  
--- 
--- 为了覆盖更多应用场景，除了 `r`、`g`、`b` 三个基本属性外，还提供了多个辅助属性：  
--- * 带有 `8` 后缀的属性取值范围是 0 到 255；  
--- * 带有 `srgb_` 前缀的属性在 sRGB (Gamma 2.2) 颜色空间下操作。  
--- 
--- 辅助属性均由对应的原始属性转换得来，不会额外占用内存。  
---@class lstg.Color3
---@field r number
---@field g number
---@field b number
---@field r8 number
---@field g8 number
---@field b8 number
---@field srgb_r number
---@field srgb_g number
---@field srgb_b number
---@field srgb_r8 number
---@field srgb_g8 number
---@field srgb_b8 number
---@operator add(lstg.Color3): lstg.Color3
---@operator add(number): lstg.Color3
---@operator sub(lstg.Color3): lstg.Color3
---@operator sub(number): lstg.Color3
---@operator mul(lstg.Color3): lstg.Color3
---@operator mul(number): lstg.Color3
---@operator div(lstg.Color3): lstg.Color3
---@operator div(number): lstg.Color3
---@operator unm: lstg.Color3
local Color3 = {}

--------------------------------------------------------------------------------
--- Methods | 成员方法

---@return lstg.Color3
function Color3:clone()
end

--- 从其他颜色或浮点向量类型设置颜色。  
--- 浮点向量的 xyzw 分量分别对应颜色 rgba 通道。透明度通道会被丢弃。  
---@param color (lstg.Color3|lstg.Color4|lstg.Vector3|lstg.Vector4)? default Black
function Color3.set(color)
end

--- 用线性颜色空间颜色设置颜色值。  
---@param r number
---@param g number
---@param b number
function Color3:set(r, g, b)
end

--- 用 sRGB (Gamma 2.2) 颜色空间颜色设置颜色值。  
---@param srgb_r number
---@param srgb_g number
---@param srgb_b number
function Color3:setSRGB(srgb_r, srgb_g, srgb_b)
end

--- 用 sRGB (Gamma 2.2) 颜色空间颜色设置颜色值。  
--- 所有通道取值范围为 [0, 255]，通常来自 8 位/通道 颜色。   
---@param srgb_r8 number
---@param srgb_g8 number
---@param srgb_b8 number
function Color3:setRGBA32(srgb_r8, srgb_g8, srgb_b8)
end

--- 用线性颜色空间颜色设置颜色值。  
--- 所有通道取值范围为 [0, 255]，通常来自 8 位/通道 颜色。   
---@param r8 number
---@param g8 number
---@param b8 number
function Color3:setLinearRGB23(r8, g8, b8)
end

--------------------------------------------------------------------------------
--- Static methods | 静态方法

--- 从其他颜色或浮点向量类型创建实例。  
--- 浮点向量的 xyzw 分量分别对应颜色 rgba 通道。透明度通道会被丢弃。  
---@param color (lstg.Color3|lstg.Color4|lstg.Vector3|lstg.Vector4)? default Black
---@return lstg.Color3
function Color3.create(color)
end

--- 使用线性颜色空间颜色创建实例
---@param r number? default 0.0
---@param g number? default 0.0
---@param b number? default 0.0
---@return lstg.Color3
function Color3.create(r, g, b)
end

--- 使用 sRGB (Gamma 2.2) 颜色空间颜色创建实例  
---@param srgb_r number
---@param srgb_g number
---@param srgb_b number
---@return lstg.Color3
function Color3.fromSRGB(srgb_r, srgb_g, srgb_b)
end

--- 使用 sRGB (Gamma 2.2) 颜色空间颜色创建实例。  
--- 
--- 所有通道取值范围为 [0, 255]，通常来自 8 位/通道 颜色。  
---@param srgb_r8 number
---@param srgb_g8 number
---@param srgb_b8 number
---@return lstg.Color3
function Color3.fromRGB24(srgb_r8, srgb_g8, srgb_b8)
end

--- 使用线性颜色空间颜色创建实例。  
--- 
--- 所有通道取值范围为 [0, 255]，通常来自 8 位/通道 颜色。   
---@param r8 number
---@param g8 number
---@param b8 number
---@return lstg.Color3
function Color3.fromLinearRGB24(r8, g8, b8)
end

return Color3
