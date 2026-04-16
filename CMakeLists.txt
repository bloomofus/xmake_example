cmake_minimum_required(VERSION 3.10)
project(RectSelector)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 查找依赖库
find_package(OpenCV REQUIRED)
if(NOT OpenCV_FOUND)
    message(FATAL_ERROR "OpenCV not found!")
endif()

# 添加头文件目录
include_directories(./include)
include_directories(./libs/RectSelector/include)

# 收集源文件
file(GLOB_RECURSE RECT_SELECTOR_SOURCES "./libs/RectSelector/src/*.cpp")


# 添加源文件
add_executable(main
    ./src/main.cpp
    ${RECT_SELECTOR_SOURCES}
)

# 链接库
target_link_libraries(main ${OpenCV_LIBS})  # 链接依赖库
include_directories(${OpenCV_INCLUDE_DIRS}) # 依赖库的头文件