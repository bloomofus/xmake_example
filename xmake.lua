-- ~/cppRepo/test_cv/xmake.lua

add_rules("mode.debug", "mode.release")
set_languages("cxx11")

-- 方法 1: 直接添加本地子项目作为依赖
-- add_requires("RectSelector", {rootdir = "mylibs/RectSelector"}) 
-- 注意：xmake 的 add_requires 通常用于远程包。对于本地库，更推荐下面这种方法：

-- 方法 2 (推荐): 使用 add_subdirs 或直接定义依赖
-- 在主 xmake.lua 中引入子目录
includes("mylibs/RectSelector/xmake.lua")

target("rect_selector_app")
    set_kind("binary")
    add_files("main.cpp")
    
    -- 依赖上面定义的 RectSelector 目标
    add_deps("RectSelector")

    set_rundir("$(projectdir)")