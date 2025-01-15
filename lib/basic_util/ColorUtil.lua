--- ColorUtil.lua
--- Created by dreamness
--- DateTime: 10/20/2024 5:14 PM
---

--- @class Color
--- @field r number 红色值
--- @field g number 绿色值
--- @field b number 蓝色值
--- @field hex_value string 十六进制值
--- @field dec_value number 十进制值

--- 颜色工具库
ColorUtil = {}

-- TODO: test
--- 从rgb值获取颜色
--- @param r number 红色值
--- @param g number 绿色值
--- @param b number 蓝色值
--- @return Color
ColorUtil.get_color_from_rgb = function(r, g, b)
    local color = {}
    color.r = r
    color.g = g
    color.b = b
    color.hex_value = StringUtil.LPad(MathUtil.dec_to_hex(color.r), 2, '0') .. StringUtil.LPad(MathUtil.dec_to_hex(color.g), 2, '0') .. StringUtil.LPad(MathUtil.dec_to_hex(color.b), 2, '0')
    color.dec_value = MathUtil.hex_to_dec(color.hex_value)
    return color
end

-- TODO: test
--- 从十六进制值获取颜色
--- @param hex_value string 十六进制值
--- @return Color
ColorUtil.get_color_from_hex = function(hex_value)
    local color = {}
    color.hex_value = hex_value
    color.dec_value = MathUtil.hex_to_dec(hex_value)
    color.r = floor(color.dec_value / 65536)
    color.g = floor((mod(color.dec_value, 65536)) / 256)
    color.b = mod(color.dec_value, 256)
    return color
end

ColorEnum = {
    RED = ColorUtil.get_color_from_rgb(255, 0, 0),
    GREEN = ColorUtil.get_color_from_rgb(0, 255, 0),
    BLUE = ColorUtil.get_color_from_rgb(0, 0, 255),
    YELLOW = ColorUtil.get_color_from_rgb(255, 255, 0),
    PURPLE = ColorUtil.get_color_from_rgb(255, 0, 255),
    CYAN = ColorUtil.get_color_from_rgb(0, 255, 255),
    WHITE = ColorUtil.get_color_from_rgb(255, 255, 255),
    BLACK = ColorUtil.get_color_from_rgb(0, 0, 0),
    ORANGE = ColorUtil.get_color_from_rgb(255, 165, 0),
    GRAY = ColorUtil.get_color_from_rgb(128, 128, 128),
    LIGHT_GRAY = ColorUtil.get_color_from_rgb(192, 192, 192),
    DARK_GRAY = ColorUtil.get_color_from_rgb(64, 64, 64),
    BROWN = ColorUtil.get_color_from_rgb(165, 42, 42),
    PINK = ColorUtil.get_color_from_rgb(255, 192, 203),
    LIGHT_BLUE = ColorUtil.get_color_from_rgb(173, 216, 230),
    LIGHT_GREEN = ColorUtil.get_color_from_rgb(144, 238, 144),
    LIGHT_YELLOW = ColorUtil.get_color_from_rgb(255, 255, 224),
    LIGHT_PURPLE = ColorUtil.get_color_from_rgb(221, 160, 221),
    LIGHT_CYAN = ColorUtil.get_color_from_rgb(224, 255, 255),
    LIGHT_ORANGE = ColorUtil.get_color_from_rgb(255, 218, 185),
    LIGHT_BROWN = ColorUtil.get_color_from_rgb(210, 180, 140),
    LIGHT_PINK = ColorUtil.get_color_from_rgb(255, 182, 193),
    DARK_RED = ColorUtil.get_color_from_rgb(139, 0, 0),
    DARK_GREEN = ColorUtil.get_color_from_rgb(0, 100, 0),
    DARK_BLUE = ColorUtil.get_color_from_rgb(0, 0, 139),
    DARK_YELLOW = ColorUtil.get_color_from_rgb(139, 139, 0),
    DARK_PURPLE = ColorUtil.get_color_from_rgb(139, 0, 139),
    DARK_CYAN = ColorUtil.get_color_from_rgb(0, 139, 139),
    DARK_ORANGE = ColorUtil.get_color_from_rgb(255, 140, 0),
    DARK_BROWN = ColorUtil.get_color_from_rgb(139, 69, 19),
    DARK_PINK = ColorUtil.get_color_from_rgb(255, 20, 147),
    DARK_GRAY = ColorUtil.get_color_from_rgb(169, 169, 169)
}