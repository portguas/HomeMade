//
//  NetWorkManager.h
//  HomeMade
//
//  Created by He,Yulong on 2017/9/7.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetWorkManager : NSObject

+ (instancetype)sharedManager;

// login
- (void)request_login_withPath:(NSString *)path params:(id)params andBlock:(void (^)(id data, NSError *error)) block ;

// recommand
- (void)request_recommnad_withPath:(NSString *)path date:(NSDate *)date andBlock:(void (^)(id data, NSError *error)) block;

- (void)requet_category_toplist_withPath:(NSString *)path andBlock:(void (^)(id data, NSError *error)) block;
@end
