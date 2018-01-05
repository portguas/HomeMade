//
//  NetWorkManager.m
//  HomeMade
//
//  Created by He,Yulong on 2017/9/7.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import "NetWorkManager.h"
#import "NetWorkRequestClient.h"
#import "NSDate+Common.h"
#import "DuoBanBean.h"

@implementation NetWorkManager

+ (instancetype)sharedManager {
    static NetWorkManager * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[NetWorkManager alloc] init];
    });
    
    return manager;
}


- (void)request_login_withPath:(NSString *)path params:(id)params andBlock:(void (^)(id data, NSError *error))block{
    NetWorkRequestClient *client = [NetWorkRequestClient sharedClient];
    [client requestJsonDataWithPath:path withParams:params withMethodType:Post andBlock:^(id data, NSError *error) {
        id result = [data valueForKeyPath:@"data"];
        if (result) {
            // 请求成功返回的结果进行解析
//            block()
        }else {
            block(nil, error);
        }
    }];
}

- (void)request_recommnad_withPath:(NSString *)path date:(NSDate *)date andBlock:(void (^)(id data, NSError *error))block{
    // 去当前日期的推荐
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:10];
    NSString * str = @"2016-8-1";//[[NSDate date] dateToNString];
    path = [path stringByAppendingString:str];
    [[NetWorkRequestClient sharedClient] requestJsonDataWithPath:path withParams:nil withMethodType:Get andBlock:^(id data, NSError *error) {
        //
        if (!data) {
            block(nil, error);
        }else{
            NSArray *posts = [data objectForKey:@"posts"];
            if (posts != nil && posts.count != 0) {
                for (NSDictionary *dic in posts) {
                    DuoBanBean *bean = [[DuoBanBean alloc] initWithDic:dic];
                    if (bean.thumbs.count != 0) {
                        [array addObject: bean];
                    }
                }
                block(array,nil);
            }
        }
    }];
}

- (void)requet_category_toplist_withPath:(NSString *)path andBlock:(void (^)(id, NSError *))block {
    [[NetWorkRequestClient sharedClient] requestJsonDataWithPath:path withParams:nil withMethodType:Get andBlock:^(id data, NSError *eeor) {
        if (!data) {
            block(nil, eeor);
        }else {
            // TODO获取列表成功
        }
    }];
}

- (void)request_ad_withPath:(NSString *)path andBlock:(void (^)(id, NSError *))block {
    [[NetWorkRequestClient sharedClient] requestAdDataWithPath:path andBlock:^(id data, NSError *error) {
        if (!data) {
            block(nil, error);
        }else {
            block(data, nil);
        }
    }];
}

@end
