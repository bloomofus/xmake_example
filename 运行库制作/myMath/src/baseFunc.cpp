// src/baseFunc.c
#include "myMath/baseFunc.h"
#include <stdio.h>

int mylib_add(int a, int b)
{
    return a + b;
}

const char *mylib_version(void)
{
    return "1.0.0";
}