// test/test.cpp
#include <iostream>
#include "myMath/baseFunc.h" // 注意：这里引用的是我们刚刚写的头文件

int main()
{
    std::cout << mylib_version() << std::endl;
    std::cout << "2 + 3 = " << mylib_add(2, 3) << std::endl;
    return 0;
}