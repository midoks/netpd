/*
 * Copyright (C) midoks@163.com (midoks)
 */


#include <stdio.h>
#include <stdlib.h>

#include <pd.h>
#include <netpd_lua.h>

int main(void)
{

    do_lua_script();
    test();
    printf("Usage: %s base exponent \n", "22");
    return 0;
}
