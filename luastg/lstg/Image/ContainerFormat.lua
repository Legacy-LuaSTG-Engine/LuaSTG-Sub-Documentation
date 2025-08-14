--- 图像文件格式
---@enum lstg.Image.ContainerFormat
local ContainerFormat = {
    --- jpg (jpeg) 格式  
    --- 
    --- 特性：  
    --- * 数据压缩：有损  
    --- * 透明度通道：不支持  
    --- * 颜色空间：sRGB  
    jpg = 1,

    --- png 格式  
    --- 
    --- 特性：  
    --- * 数据压缩：无损  
    --- * 透明度通道：支持  
    --- * 颜色空间：线性/sRGB  
    png = 2,

    --- webp 格式  
    --- 
    --- 特性：  
    --- * 数据压缩：有损/无损  
    --- * 透明度通道：支持  
    --- * 颜色空间：sRGB  
    webp = 3,

    --- qoi 格式  
    --- 
    --- 特性：  
    --- * 数据压缩：无损  
    --- * 透明度通道：支持  
    --- * 颜色空间：线性/sRGB  
    qoi = 4,
}
return ContainerFormat
