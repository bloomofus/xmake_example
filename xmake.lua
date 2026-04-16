-- ~/cppRepo/test_cv/xmake.lua

add_rules("mode.debug", "mode.release")
set_languages("cxx11")

-- 方法 1: 直接添加本地子项目作为依赖
-- add_requires("RectSelector", {rootdir = "libs/RectSelector"}) 
-- 注意：xmake 的 add_requires 通常用于远程包。对于本地库，更推荐下面这种方法：

-- 方法 2 (推荐): 使用 add_subdirs 或直接定义依赖
-- 在主 xmake.lua 中引入子目录
includes("libs/RectSelector/xmake.lua")

target("main")
    -- 基础属性设置
    set_kind("binary")
    set_targetdir("./build/")
    set_rundir("$(projectdir)")

    -- 添加源文件
    add_files("./src/main.cpp")

    -- 添加头文件
    add_includedirs("./include")
    
    -- 添加子依赖
    add_deps("RectSelector")
