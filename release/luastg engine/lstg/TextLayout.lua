---@diagnostic disable: unused-local

---@class lstg.TextLayout
local TextLayout = {}

---@param text string
function TextLayout:setText(text)
end

---@param width number
---@param height number
function TextLayout:setLayoutRect(width, height)
end

---@param text_alignment lstg.TextLayout.TextAlignment
function TextLayout:setTextAlignment(text_alignment)
end

---@param paragraph_alignment lstg.TextLayout.ParagraphAlignment
function TextLayout:setParagraphAlignment(paragraph_alignment)
end

---@param font_family string
function TextLayout:setFontFamily(font_family)
end

---@param size number
function TextLayout:setFontSize(size)
end

---@param weight lstg.FontWeight
function TextLayout:setFontWeight(weight)
end

---@param style lstg.FontStyle
function TextLayout:setFontStyle(style)
end

return TextLayout
