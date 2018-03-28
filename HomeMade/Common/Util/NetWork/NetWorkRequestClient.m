//
//  NetWorkRequestClient.m
//  HomeMade
//
//  Created by He,Yulong on 2017/9/7.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import "NetWorkRequestClient.h"
#import "Api.h"
#import "Helper.h"

static NetWorkRequestClient *instance = nil;
@implementation NetWorkRequestClient

+ (instancetype)sharedClient {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[NetWorkRequestClient alloc] initWithBaseURL:[NSURL URLWithString:kBaseUrl]];
    });
    
    return instance;
}

- (instancetype)changeClient {
    instance = [[NetWorkRequestClient alloc] initWithBaseURL:[NSURL URLWithString:kBaseUrl]];
    return instance;
}

- (instancetype)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    self.responseSerializer = [AFJSONResponseSerializer serializer];
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", @"text/html", nil];
    [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [self.requestSerializer setValue:url.absoluteString forHTTPHeaderField:@"Referer"];
    return self;
}

// 发起请求的地方
- (void)requestJsonDataWithPath:(NSString *)path withParams:(NSDictionary *)params withMethodType:(NetworkMethod)method andBlock:(void (^)(id data, NSError *error))block{
    if (!path || path.length <= 0) {
        return;
    }
    if (params) {
        NSEnumerator *emu = [params keyEnumerator];
        id key;
        while (key = [emu nextObject]) {
            NSLog(@"HM请求参数key:%@, 值:%@", key, params[key]);
        }
    }else {
        NSLog(@"HM请求参数为空");
    }
    
    if (method == Get) {
        NSLog(@"HM请求方法为Get:%@", path);
    }else {
        NSLog(@"HM请求方法为Post:%@", path);
    }
    
    // 如果链接是https://或者http://开头的话就会吧://和转化了导致访问不对. 以后做路径转换只做后面参数的 一级域名不做
//    path = [path stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLPathAllowedCharacterSet]];
    
    switch (method) {
        case Get:
        {
            NSMutableString *localPath = [path mutableCopy];
            if (params) {
                [localPath appendString:params.description];
            }
            [self GET:path parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
                // TODO 下载进度
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                // afn解析
                id error = [self handleResponse:responseObject];
                if (error) {
                    // TODO错误处理
                    block(responseObject, error);
                }else{
                    if ([responseObject isKindOfClass:[NSDictionary class]]) {
                        //获取数据缓存到本地
                        [self saveResponseData:responseObject toPath:localPath];
                    }
                    block(responseObject, nil);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                // TODO 请求失败
                block(nil, error);
            }];
        }
            break;
        case Post:
        {
            [self POST:path parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
                // TODO 进度
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                //
                id error = [self handleResponse:responseObject];
                if (error) {
                    block(nil, error);
                }else {
                    block(responseObject, nil);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                //
                block(nil, error);
            }];
        }
            break;
        default:
            break;
    }
}


#pragma helper
- (id)handleResponse:(id)response{
    NSError *error = nil;
    // 判断错误
    NSInteger errorCode = [(NSNumber *)[response valueForKeyPath:@"code"] integerValue];
    if (errorCode != 0) {
        error = [NSError errorWithDomain:kBaseUrl code:errorCode userInfo:response];
        if (errorCode == 1000) {
            //  TODO表明用户未登录
            
        }
    }
    return error;
}

- (void)saveResponseData:(id)response toPath:(NSString *)path {
    
}

@end
