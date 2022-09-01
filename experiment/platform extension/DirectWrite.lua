--------------------------------------------------------------------------------
--- Windows 平台 DirectWrite 拓展
--- 璀境石
--------------------------------------------------------------------------------

---@class DirectWrite
local M = {}

--------------------------------------------------------------------------------
--- example

local function example()
    --- step 0: cimport module

    ---@type DirectWrite
    local DirectWrite = require("DirectWrite")

    --- step 1: create a font collection

    -- let's begin with Windows built-in font 微软雅黑
    local font_file_list = {}
    ---@param path string
    local function insert_if_exist(path)
        if lstg.FileManager.FileExist(path) then
            table.insert(font_file_list, path)
        end
    end
    -- Windows 8, 8.1, 10, 11
    insert_if_exist("C:/Windows/Fonts/msyh.ttc")
    insert_if_exist("C:/Windows/Fonts/msyhbd.ttc")
    insert_if_exist("C:/Windows/Fonts/msyhl.ttc")
    -- Windows 7 special case (fallback)
    if #font_file_list < 1 then
        insert_if_exist("C:/Windows/Fonts/msyh.ttf")
        insert_if_exist("C:/Windows/Fonts/msyhbd.ttf")
    end
    local font_collection = DirectWrite.CreateFontCollection(font_file_list)
    -- optional debug information
    lstg.Print(string.format("Font Collection Detail:\n%s", font_collection:GetDebugInformation()))

    --- step 2: create a text format

    local text_format = DirectWrite.CreateTextFormat(
        "微软雅黑", -- font family name (see DirectWrite.FontCollection:GetDebugInformation result)
        font_collection,
        DirectWrite.FontWeight.Regular,
        DirectWrite.FontStyle.Normal,
        DirectWrite.FontStretch.Normal,
        16.0, -- font size in DIP (device independent point, or pixel)
        ""
    )

    --- step 3: create a text layout

    local text_layout_1 = DirectWrite.CreateTextLayout(
        "Hello, DirectWrite!\n你好，DirectWrite！",
        text_format,
        256, -- layout box width
        64 -- layout box height
    )

    local text_layout_2 = DirectWrite.CreateTextLayout(
        "海内存知己，天涯若比邻。",
        text_format,
        256, -- layout box width
        64 -- layout box height
    )

    --- step 4: create LuaSTG texture resource from text layout

    DirectWrite.CreateTextureFromTextLayout(
        text_layout_1,
        "global", -- resource pool type
        "tex:hello-dwrite" -- texture resource name
    )

    DirectWrite.CreateTextureFromTextLayout(
        text_layout_2,
        "global", -- resource pool type
        "tex:hello-dwrite", -- texture resource name
        4 -- optional stroke width
    )
end

--------------------------------------------------------------------------------
--- C enum

---@class DirectWrite.FontStretch
local FontStretch = {}
M.FontStretch = FontStretch
FontStretch.Undefined = 0
FontStretch.UltraCondensed = 1
FontStretch.ExtraCondensed = 2
FontStretch.Condensed = 3
FontStretch.SemiCondensed = 4
FontStretch.Normal = 5
FontStretch.Medium = 5
FontStretch.SemiExpanded = 6
FontStretch.Expanded = 7
FontStretch.ExtraExpanded = 8
FontStretch.UltraExpanded = 9

---@class DirectWrite.FontStyle
local FontStyle = {}
M.FontStyle = FontStyle
FontStyle.Normal = 0
FontStyle.Oblique = 1
FontStyle.Italic = 2

---@class DirectWrite.FontWeight
local FontWeight = {}
M.FontWeight = FontWeight
FontWeight.Thin = 100
FontWeight.ExtraLight = 200
FontWeight.UltraLight = 200
FontWeight.Light = 300
FontWeight.SemiLight = 350
FontWeight.Normal = 400
FontWeight.Regular = 400
FontWeight.Medium = 500
FontWeight.DemiBold = 600
FontWeight.SemiBold = 600
FontWeight.Bold = 700
FontWeight.ExtraBold = 800
FontWeight.UltraBold = 800
FontWeight.Black = 900
FontWeight.Heacy = 900
FontWeight.ExtraBlack = 950
FontWeight.UltraBlack = 950

---@class DirectWrite.LineSpacingMethod
local LineSpacingMethod = {}
M.LineSpacingMethod = LineSpacingMethod
LineSpacingMethod.Default = 0
LineSpacingMethod.Uniform = 1

---@class DirectWrite.TextAlignment
local TextAlignment = {}
M.TextAlignment = TextAlignment
TextAlignment.Leading = 0
TextAlignment.Trailing = 1
TextAlignment.Center = 2
TextAlignment.Justified = 3

---@class DirectWrite.ParagraphAlignment
local ParagraphAlignment = {}
M.ParagraphAlignment = ParagraphAlignment
ParagraphAlignment.Near = 0
ParagraphAlignment.Far = 1
ParagraphAlignment.Center = 2

---@class DirectWrite.FlowDirection
local FlowDirection = {}
M.FlowDirection = FlowDirection
FlowDirection.TopToBottom = 0
FlowDirection.BottomToTop = 1
FlowDirection.LeftToRight = 2
FlowDirection.RightToLeft = 3

---@class DirectWrite.ReadingDirection
local ReadingDirection = {}
M.ReadingDirection = ReadingDirection
ReadingDirection.LeftToRight = 0
ReadingDirection.RightToLeft = 1

---@class DirectWrite.WordWrapping
local WordWrapping = {}
M.WordWrapping = WordWrapping
WordWrapping.Wrap = 0
WordWrapping.NoWrap = 1

--------------------------------------------------------------------------------
--- IDWriteFontCollection

---@class DirectWrite.FontCollection
local FontCollection = {}

---@return string
function FontCollection:GetDebugInformation()
end

--------------------------------------------------------------------------------
--- IDWriteTextFormat

---@class DirectWrite.TextFormat
local TextFormat = {}

--------------------------------------------------------------------------------
--- IDWriteTextLayout

---@class DirectWrite.TextLayout
local TextLayout = {}

-- basic format

---@param font_collection DirectWrite.FontCollection
---@param start_position number
---@param length number
function TextLayout:SetFontCollection(font_collection, start_position, length)
end

---@param font_family_name string
---@param start_position number
---@param length number
function TextLayout:SetFontFamilyName(font_family_name, start_position, length)
end

---@param locale_name string
---@param start_position number
---@param length number
function TextLayout:SetLocaleName(locale_name, start_position, length)
end

---@param font_size number
---@param start_position number
---@param length number
function TextLayout:SetFontSize(font_size, start_position, length)
end

--- font_style: `DirectWrite.FontStyle`  
---@param font_style number
---@param start_position number
---@param length number
function TextLayout:SetFontStyle(font_style, start_position, length)
end

--- font_weight: `DirectWrite.FontWeight`  
---@param font_weight number
---@param start_position number
---@param length number
function TextLayout:SetFontWeight(font_weight, start_position, length)
end

--- font_stretch: `DirectWrite.FontStretch`  
---@param font_stretch number
---@param start_position number
---@param length number
function TextLayout:SetFontStretch(font_stretch, start_position, length)
end

-- extend format

---@param enable boolean
---@param start_position number
---@param length number
function TextLayout:SetStrikethrough(enable, start_position, length)
end

---@param enable boolean
---@param start_position number
---@param length number
function TextLayout:SetUnderline(enable, start_position, length)
end

-- block format

---@param value number
function TextLayout:SetIncrementalTabStop(value)
end

--- line_spacing_method: `DirectWrite.LineSpacingMethod`  
---@param line_spacing_method number
---@param line_spacing number
---@param baseline number
function TextLayout:SetLineSpacing(line_spacing_method, line_spacing, baseline)
end

--- align: `DirectWrite.TextAlignment`  
---@param align number
function TextLayout:SetTextAlignment(align)
end

--- align: `DirectWrite.ParagraphAlignment`  
---@param align number
function TextLayout:SetParagraphAlignment(align)
end

--- dir: `DirectWrite.FlowDirection`  
---@param dir number
function TextLayout:SetFlowDirection(dir)
end

--- dir: `DirectWrite.ReadingDirection`  
---@param dir number
function TextLayout:SetReadingDirection(dir)
end

--- wrap: `DirectWrite.WordWrapping`  
---@param wrap number
function TextLayout:SetWordWrapping(wrap)
end

-- layout box

---@param max_width number
function TextLayout:SetMaxWidth(max_width)
end

---@param max_width number
function TextLayout:SetMaxHeight(max_width)
end

-- metrics

---@return number
function TextLayout:DetermineMinWidth()
end

--------------------------------------------------------------------------------
--- IDwriteFactory

---@param font_files string[]
---@return DirectWrite.FontCollection
function M.CreateFontCollection(font_files)
end

--- font_weight: `DirectWrite.FontWeight`  
--- font_style: `DirectWrite.FontStyle`  
--- font_stretch: `DirectWrite.FontStretch`  
---@param font_family_name string
---@param font_collection DirectWrite.FontCollection|nil
---@param font_weight number
---@param font_style number
---@param font_stretch number
---@param font_size number
---@param locale_name string
---@return DirectWrite.TextFormat
function M.CreateTextFormat(font_family_name, font_collection, font_weight, font_style, font_stretch, font_size, locale_name)
end

---@param text string
---@param text_format DirectWrite.TextFormat
---@param max_width number
---@param max_height number
---@return DirectWrite.TextLayout
function M.CreateTextLayout(text, text_format, max_width, max_height)
end

--------------------------------------------------------------------------------
--- DirectWrite & LuaSTG

---@param text_layout DirectWrite.TextLayout
---@param resource_pool_type lstg.ResourcePoolType
---@param texture_name string
---@param outline_width number
---@overload fun(text_layout:DirectWrite.TextLayout, resource_pool_type:lstg.ResourcePoolType, texture_name:string)
function M.CreateTextureFromTextLayout(text_layout, resource_pool_type, texture_name, outline_width)
end

--------------------------------------------------------------------------------
--- end

return M
