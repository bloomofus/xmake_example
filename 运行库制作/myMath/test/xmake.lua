add_rules("mode.debug", "mode.release")

target("myMath_test")
    set_kind("binary")

    -- 添加源文件
    add_files("../src/**.c*")
    add_files("./test.cpp")

    -- 添加头文件
    add_includedirs("../include")
