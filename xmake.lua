-- ~/cppRepo/test_cv/xmake.lua

add_rules("mode.debug", "mode.release")
set_languages("cxx11")

-- 添加子xmake依赖
includes("libs/RectSelector")
-- 添加三方库依赖
add_requires("opencv", {system = true})

-- 一些路径环境变量
local libPath_myMath="./libs/myMath"

target("main")
    -- 基础属性设置
    set_kind("binary")
    set_targetdir("./build/")
    set_rundir("$(projectdir)")

    -- 添加源文件
    add_files("./src/main.cpp")

    -- 添加头文件
    add_includedirs("./include")
    
    -- 链接子xmake依赖
    add_deps("RectSelector")
    -- 链接三方库依赖
    add_packages("opencv", {public = true})
    -- 添加运行库依赖
    -- 如果别的项目依赖这个的话可以加上{public=true}
    add_includedirs(path.join(libPath_myMath,"include"),{public=true}) 
    add_linkdirs(path.join(libPath_myMath,"lib"))
    add_links("myMath")
