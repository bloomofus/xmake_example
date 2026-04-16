// include/baseFunc.h
#ifndef BASEFUNC_H
#define BASEFUNC_H

#ifdef __cplusplus
extern "C"
{
#endif

    // 声明一个简单的加法函数
    int mylib_add(int a, int b);

    // 声明一个打印版本信息的函数
    const char *mylib_version(void);

#ifdef __cplusplus
}
#endif

#endif // MYLIB_H