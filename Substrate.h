//
//  Substrate.h
//  ShimStrate Example Project
//
//  Created by Sam Stone on 28/06/2015.
//  Copyright (c) 2015 Sam Stone. All rights reserved.
//

#ifndef ShimStrate_Example_Project_Substrate_h
#define ShimStrate_Example_Project_Substrate_h
typedef const void *MSImageRef;
void MSHookFunction(void *symbol, void *hook, void **old);
void MSHookMessageEx(Class _class, SEL message, IMP hook, IMP *old);

MSImageRef MSGetImageByName(const char *file);
void *MSFindSymbol(MSImageRef image, const char *name);
#endif
