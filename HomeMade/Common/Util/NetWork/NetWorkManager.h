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

/**
 登录请求

 @param path 登录请求的url
 @param params 登录需要的参数
 @param block 登录后的回调
 */
- (void)request_login_withPath:(NSString *)path params:(id)params andBlock:(void (^)(id data, NSError *error)) block ;


/**
 推荐文章列表请求

 @param path 文章的url
 @param date 文章对应的日期
 @param block 获取后的回调
 */
- (void)request_recommnad_withPath:(NSString *)path date:(NSDate *)date andBlock:(void (^)(id data, NSError *error)) block;


/**
 分类文章列表的请求

 @param path 分类文章的url
 @param block 获取后的回调
 */
- (void)requet_category_toplist_withPath:(NSString *)path andBlock:(void (^)(id data, NSError *error)) block;


/**
 获取启动屏的广告

 @param path 广告的地址url
 @param block 获取后的回调
 */
- (void)request_ad_withPath:(NSString *)path andBlock:(void(^)(id data, NSError *erroe)) block;
@end
