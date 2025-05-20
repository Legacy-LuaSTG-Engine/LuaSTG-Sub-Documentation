--- 通用字重（zhòng），决定文字笔画的粗细。  
--- 
--- 对于可变字体，字重可以平滑地在 100 到 1000 之间变化，
--- 此时通用字重相当于字重参数轴上的一系列预设（preset）点。  
--- 
--- LuaSTG 暂不支持可变字体。  
--- 
--- 注意：字重的比较仅在同一个字体族内有意义，对于不同的字体族，
--- 由于字体设计者个人风格、艺术和视觉表达等考虑的差异，即使设
--- 为相同字重，字形外观仍然会有不同程度的差异。  
---@enum lstg.FontWeight
local FontWeight = {
    thin = 100,

    extra_light = 200,

    light = 300,

    --- 基准字重，有时也称为 regular，是字体设计时的基准  
    normal = 400,

    medium = 500,

    semi_bold = 600,

    --- 通用粗体，大部分字体的加粗变体会定为该字重  
    bold = 700,

    extra_bold = 800,

    black = 900,
}

return FontWeight
