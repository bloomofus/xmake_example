-- ==========================================
-- File: mylibs/RectSelector/xmake.lua
-- ==========================================
add_rules("mode.debug", "mode.release")
set_languages("cxx11")

-- 添加 OpenCV 依赖
add_requires("opencv", {system = true})

-- 定义目标：RectSelector 库
target("RectSelector")
    -- 基础属性设置
    set_kind("static") -- 设置目标类型为静态库，如果希望生成动态库 (.so)，请改为 set_kind("shared")
    set_targetdir("$(projectdir)/bin") -- 让所有库都生成到主项目的 bin 目录
    add_rpathdirs("$ORIGIN") -- $ORIGIN 代表动态库文件自身所在的目录，传递给引用该库的库
    
    -- 添加源文件
    add_files("src/rect_selector.cpp")
    
    -- 添加头文件搜索路径
    -- 这相当于 CMake 的 target_include_directories(... PUBLIC ...)
    -- 这样依赖此库的其他目标也能找到 rect_selector.h
    add_includedirs("include", {public = true})
    
    -- 链接 OpenCV 包
    -- {public = true} 表示如果其他项目链接了 RectSelector，
    -- 它们也会自动链接 OpenCV。这对应 CMake 中 target_link_libraries 的 PUBLIC 属性。
    add_packages("opencv", {public = true})