---@diagnostic disable: missing-return, unused-local, duplicate-set-field

--------------------------------------------------------------------------------
--- Class | 类

--- 带有透明度的 RGBA 颜色，每个通道由 32 位浮点数表示。  
--- 
--- 颜色值以线性颜色空间储存。  
--- 
--- 每个通道的取值范围应为 [0.0, 1.0]。  
--- 提交给引擎渲染时，超出范围是未定义行为，可能出现意料之外的问题。  
--- 计算时的中间结果可以取任意值，只要保证提交给引擎渲染时所有通道都没有超出范围即可。  
--- 
--- 为了覆盖更多应用场景，除了 `r`、`g`、`b`、`a` 四个基本属性外，还提供了多个辅助属性：  
--- * 带有 `8` 后缀的属性取值范围是 0 到 255；  
--- * 带有 `srgb_` 前缀的属性在 sRGB (Gamma 2.2) 颜色空间下操作；  
--- * `rgb` 属性可以读取/写入 `lstg.Color3`。  
--- 
--- 辅助属性均由对应的原始属性转换得来，不会额外占用内存。  
---@class lstg.Color4
---@field r number
---@field g number
---@field b number
---@field a number
---@field r8 number
---@field g8 number
---@field b8 number
---@field a8 number
---@field srgb_r number
---@field srgb_g number
---@field srgb_b number
---@field srgb_r8 number
---@field srgb_g8 number
---@field srgb_b8 number
---@field rgb lstg.Color3
---@operator add(lstg.Color4): lstg.Color4
---@operator add(number): lstg.Color4
---@operator sub(lstg.Color4): lstg.Color4
---@operator sub(number): lstg.Color4
---@operator mul(lstg.Color4): lstg.Color4
---@operator mul(number): lstg.Color4
---@operator div(lstg.Color4): lstg.Color4
---@operator div(number): lstg.Color4
---@operator unm: lstg.Color4
local Color4 = {}

--------------------------------------------------------------------------------
--- Methods | 成员方法

---@return lstg.Color4
function Color4:clone()
end

--- 从其他颜色或浮点向量类型设置颜色。  
--- 浮点向量的 xyzw 分量分别对应颜色 rgba 通道。  
--- 只有 3 个通道/分类的类型，视为不透明颜色（透明度通道为 1.0）。  
--- 提供 `a` 参数可以设置最终的透明度通道值。  
---@param color (lstg.Color3|lstg.Color4|lstg.Vector3|lstg.Vector4)? default Black
---@param a number? default color.a (or 1.0)
---@return lstg.Color4
function Color4.set(color, a)
end

--- 用线性颜色空间颜色设置颜色值。  
---@param r number
---@param g number
---@param b number
---@param a number? default 1.0
function Color4:set(r, g, b, a)
end

--- 用 sRGB (Gamma 2.2) 颜色空间颜色设置颜色值。  
--- 注意：透明度是线性的，不受颜色空间影响。  
---@param srgb_r number
---@param srgb_g number
---@param srgb_b number
---@param a number? default 1.0
function Color4:setSRGB(srgb_r, srgb_g, srgb_b, a)
end

--- 用 sRGB (Gamma 2.2) 颜色空间颜色设置颜色值。  
--- 所有通道取值范围为 [0, 255]，通常来自 8 位/通道 颜色。   
--- 注意：透明度是线性的，不受颜色空间影响。  
---@param srgb_r8 number
---@param srgb_g8 number
---@param srgb_b8 number
---@param a8 number? default 255
function Color4:setRGBA32(srgb_r8, srgb_g8, srgb_b8, a8)
end

--- 用线性颜色空间颜色设置颜色值。  
--- 所有通道取值范围为 [0, 255]，通常来自 8 位/通道 颜色。   
---@param r8 number
---@param g8 number
---@param b8 number
---@param a8 number? default 255
function Color4:setLinearRGBA32(r8, g8, b8, a8)
end

--------------------------------------------------------------------------------
--- Static methods | 静态方法

--- 从其他颜色或浮点向量类型创建实例。  
--- 浮点向量的 xyzw 分量分别对应颜色 rgba 通道。  
--- 只有 3 个通道/分类的类型，视为不透明颜色（透明度通道为 1.0）。  
--- 提供 `a` 参数可以设置最终的透明度通道值。  
---@param color (lstg.Color3|lstg.Color4|lstg.Vector3|lstg.Vector4)? default Black
---@param a number? default color.a (or 1.0)
---@return lstg.Color4
function Color4.create(color, a)
end

--- 使用线性颜色空间颜色创建实例
---@param r number? default 0.0
---@param g number? default 0.0
---@param b number? default 0.0
---@param a number? default 1.0
---@return lstg.Color4
function Color4.create(r, g, b, a)
end

--- 使用 sRGB (Gamma 2.2) 颜色空间颜色创建实例  
--- 注意：透明度是线性的，不受颜色空间影响。  
---@param srgb_r number
---@param srgb_g number
---@param srgb_b number
---@param a number? default 1.0
---@return lstg.Color4
function Color4.fromSRGB(srgb_r, srgb_g, srgb_b, a)
end

--- 使用 sRGB (Gamma 2.2) 颜色空间颜色创建实例。  
--- 
--- 所有通道取值范围为 [0, 255]，通常来自 8 位/通道 颜色。   
--- 注意：透明度是线性的，不受颜色空间影响。  
---@param srgb_r8 number
---@param srgb_g8 number
---@param srgb_b8 number
---@param a8 number? default 255
---@return lstg.Color4
function Color4.fromRGBA32(srgb_r8, srgb_g8, srgb_b8, a8)
end

--- 使用线性颜色空间颜色创建实例。  
--- 
--- 所有通道取值范围为 [0, 255]，通常来自 8 位/通道 颜色。   
---@param r8 number
---@param g8 number
---@param b8 number
---@param a8 number? default 255
---@return lstg.Color4
function Color4.fromLinearRGBA32(r8, g8, b8, a8)
end

return Color4
