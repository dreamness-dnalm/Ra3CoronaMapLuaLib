#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
获取lib目录下所有的lua文件名
"""

import os
import glob

def get_lua_files_in_lib(lib_path):
    """
    获取lib目录下所有的lua文件名
    
    Args:
        lib_path (str): lib目录的路径
        
    Returns:
        list: 包含所有lua文件路径的列表
    """
    lua_files = []
    
    # 使用glob递归搜索所有.lua文件
    pattern = os.path.join(lib_path, "**", "*.lua")
    lua_files = glob.glob(pattern, recursive=True)
    
    # 按文件名排序
    lua_files.sort()
    
    return lua_files

def print_lua_files(lib_path):
    """
    打印lib目录下所有的lua文件名，按目录分组显示
    
    Args:
        lib_path (str): lib目录的路径
    """
    lua_files = get_lua_files_in_lib(lib_path)
    
    # 按目录分组
    files_by_dir = {}
    for file_path in lua_files:
        dir_name = os.path.dirname(file_path)
        file_name = os.path.basename(file_path)
        
        if dir_name not in files_by_dir:
            files_by_dir[dir_name] = []
        files_by_dir[dir_name].append(file_name)
    
    print(f"lib目录下共有 {len(lua_files)} 个Lua文件：\n")
    
    # 按目录名排序
    for dir_name in sorted(files_by_dir.keys()):
        files = files_by_dir[dir_name]
        files.sort()
        
        if dir_name == lib_path:
            print("根目录:")
        else:
            # 获取相对于lib目录的子目录名
            rel_dir = os.path.relpath(dir_name, lib_path)
            print(f"{rel_dir}/:")
        
        for file_name in files:
            print(f"  - {file_name}")
        print()

def print_lua_file_names_only(lib_path):
    """
    只打印lua文件名，不包含路径
    
    Args:
        lib_path (str): lib目录的路径
    """
    lua_files = get_lua_files_in_lib(lib_path)
    
    # 提取文件名并排序
    file_names = []
    for file_path in lua_files:
        file_name = os.path.basename(file_path)
        file_names.append(file_name)
    
    file_names.sort()
    
    print(f"lib目录下共有 {len(file_names)} 个Lua文件：\n")
    
    for file_name in file_names:
        print(file_name)

def generate_lua_lib_auto_load(lib_path, output_path, template_path):
    """
    使用模板生成lua_lib_auto_load.lua文件
    
    Args:
        lib_path (str): lib目录的路径
        output_path (str): 输出文件路径
        template_path (str): 模板文件路径
    """
    lua_files = get_lua_files_in_lib(lib_path)
    
    # 按目录分组并排序
    files_by_dir = {}
    for file_path in lua_files:
        dir_name = os.path.dirname(file_path)
        file_name = os.path.basename(file_path)
        
        # 排除lua_lib_auto_load.lua自身，避免循环引用
        if file_name == "lua_lib_auto_load.lua":
            continue
            
        if dir_name not in files_by_dir:
            files_by_dir[dir_name] = []
        files_by_dir[dir_name].append(file_name)
    
    # 生成文件列表内容
    lib_files_content = []
    
    # 按目录顺序添加文件
    dir_order = [
        lib_path,  # 根目录
        os.path.join(lib_path, "_meta"),
        os.path.join(lib_path, "basic_module"),
        os.path.join(lib_path, "basic_util"),
        os.path.join(lib_path, "enums"),
        os.path.join(lib_path, "helper"),
        os.path.join(lib_path, "object")
    ]
    
    for dir_path in dir_order:
        if dir_path in files_by_dir:
            files = files_by_dir[dir_path]
            files.sort()
            
            # 添加目录注释
            if dir_path == lib_path:
                lib_files_content.append("            -- 根目录")
            else:
                rel_dir = os.path.relpath(dir_path, lib_path)
                lib_files_content.append(f"            -- {rel_dir}")
            
            # 添加文件
            for file_name in files:
                lib_files_content.append(f"    '{file_name}',")
            
            lib_files_content.append("")  # 空行分隔
    
    # 读取模板文件
    with open(template_path, 'r', encoding='utf-8') as f:
        template_content = f.read()
    
    # 替换模板中的占位符
    final_content = template_content.replace('{{LIB_FILES}}', '\n'.join(lib_files_content))
    
    # 写入文件
    with open(output_path, 'w', encoding='utf-8') as f:
        f.write(final_content)
    
    print(f"已生成 lua_lib_auto_load.lua 文件: {output_path}")
    print(f"包含 {len(lua_files)} 个Lua文件")

def main():
    """主函数"""
    # 获取当前脚本所在目录的上级目录（RA3CoronaMapLuaLib）
    script_dir = os.path.dirname(os.path.abspath(__file__))
    lib_path = os.path.join(script_dir, "..", "..", "lib")
    lib_path = os.path.normpath(lib_path)
    
    print(f"搜索路径: {lib_path}")
    print("=" * 50)
    
    if not os.path.exists(lib_path):
        print(f"错误: lib目录不存在: {lib_path}")
        return
    
    # 生成lua_lib_auto_load.lua文件
    output_path = os.path.join(lib_path, "lua_lib_auto_load.lua")
    template_path = os.path.join(script_dir, "lua_lib_auto_load_template.lua")
    generate_lua_lib_auto_load(lib_path, output_path, template_path)
    
    print("\n" + "=" * 50)
    print("文件列表预览:")
    print_lua_file_names_only(lib_path)

if __name__ == "__main__":
    main()
