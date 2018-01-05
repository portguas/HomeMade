//
//  NetWorkRequestClient.h
//  HomeMade
//
//  Created by He,Yulong on 2017/9/7.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <AFNetworking.h>
#import "AFNetworking.h"

typedef NS_ENUM(NSInteger, NetworkMethod){
    Get = 0,
    Post,
    Put,
    Delete
};

@interface NetWorkRequestClient : AFHTTPSessionManager

+ (instancetype)sharedClient ;
- (instancetype)changeClient;


/**
 获取列表的json信息

 @param path url路径
 @param params 请求参数
 @param method 请求的方式 post/get
 @param block 回调
 */
- (void)requestJsonDataWithPath:(NSString *)path
                     withParams:(NSDictionary *)params
                 withMethodType:(NetworkMethod)method
                       andBlock:(void (^)(id data, NSError *eeor))block;



@end
