cmake_minimum_required(VERSION 3.10)
project(RectSelector)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(OpenCV REQUIRED)
if(NOT OpenCV_FOUND)
    message(FATAL_ERROR "OpenCV not found!")
endif()

add_executable(rect_selector 
    main.cpp 
    rect_selector.cpp
)

target_link_libraries(rect_selector ${OpenCV_LIBS})

include_directories(${OpenCV_INCLUDE_DIRS})