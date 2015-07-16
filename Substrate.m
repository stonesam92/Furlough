//
//  Substrate.c
//  ShimStrate Example Project
//
//  Created by Sam Stone on 28/06/2015.
//  Copyright (c) 2015 Sam Stone. All rights reserved.
//

#include <stdio.h>
#include <objc/runtime.h>
#include <dlfcn.h>
#include "fishhook.h"
#include "Substrate.h"

void MSHookFunction(void *symbol, void *hook, void **old) {
    Dl_info symbolInfo;
    if (dladdr(symbol, &symbolInfo) == 0)
        return; //symbol not found
    
    struct rebinding rebindings[1];
    rebindings[0] = (struct rebinding){(char*)symbolInfo.dli_sname, hook};
    
    // set old to point to original symbol
    if (old)
        *old = symbol;
    
    rebind_symbols(rebindings, 1);
}

void MSHookMessageEx(Class _class, SEL message, IMP hook, IMP *old) {
    Method oldMethod = class_getInstanceMethod(_class, message);
    if (old != NULL)
        *old = method_getImplementation(oldMethod);
    method_setImplementation(oldMethod, hook);
}

MSImageRef MSGetImageByName(const char *file) {
    return dlopen(file, RTLD_NOW);
}

void *MSFindSymbol(MSImageRef image, const char *name) {
    // remove underscore prefix for dlsym
    return dlsym((void*)image, name+1);
}