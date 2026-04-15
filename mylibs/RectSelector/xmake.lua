-- ==========================================
-- File: mylibs/RectSelector/xmake.lua
-- ==========================================

-- 添加构建模式规则（调试/发布）
add_rules("mode.debug", "mode.release")

-- 设置 C++ 标准为 C++11 (对应原 CMake: set(CMAKE_CXX_STANDARD 11))
set_languages("cxx11")

-- 添加 OpenCV 依赖
-- {system = true} 表示优先使用系统安装的 OpenCV，避免重复编译
add_requires("opencv", {system = true})

-- 定义目标：RectSelector 库
target("RectSelector")
    -- 设置目标类型为静态库 (static library)
    -- 如果希望生成动态库 (.so)，请改为 set_kind("shared")
    set_kind("static")
    
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