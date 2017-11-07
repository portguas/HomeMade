//
//  NSDictionary+NotNullKey.h
//  HomeMade
//
//  Created by He,Yulong on 2017/9/10.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

#define NILORSLASH(obj) (obj != nil) ? obj : @"/"
#define NILORDASH(obj)  (obj != nil) ? obj : @"-"

@interface NSDictionary (NotNullKey)
+(NSDictionary *) dictionaryWithPropertiesOfObject:(id) obj;
- (id)objectForSafeKey:(id)key;

@end
