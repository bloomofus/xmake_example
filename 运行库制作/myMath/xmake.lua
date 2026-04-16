target("myMath")
    set_kind("static")  -- 静态库
    set_targetdir("$(projectdir)/lib")


    add_files("src/*.c", "src/*.cpp")
    add_includedirs("include", {public = true})  -- 公开头文件目录

