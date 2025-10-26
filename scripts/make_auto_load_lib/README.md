# Make Auto Load Lib

自动生成 `lua_lib_auto_load.lua` 文件的工具。

## 文件说明

- `make_auto_lib.py` - Python脚本，用于扫描lib目录并生成自动加载文件
- `lua_lib_auto_load_template.lua` - Lua模板文件，包含文件结构模板

## 使用方法

```bash
python make_auto_lib.py
```

## 功能特点

- 自动扫描 `../lib` 目录下的所有 `.lua` 文件
- 按目录分组排序（_meta → basic_module → basic_util → enums → helper → object）
- 使用模板填充方式生成文件，结构清晰易维护
- 自动排除 `lua_lib_auto_load.lua` 自身，避免循环引用
- 生成的文件符合Lua4语法规范

## 输出

脚本会在 `../lib/lua_lib_auto_load.lua` 生成完整的自动加载文件。

## 模板说明

模板文件使用 `{{LIB_FILES}}` 作为占位符，Python脚本会将扫描到的文件列表替换到这个位置。
