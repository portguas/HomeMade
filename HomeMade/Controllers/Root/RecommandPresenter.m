//
//  RecommandPresenter.m
//  HomeMade
//
//  Created by He,Yulong on 2017/8/18.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import "RecommandPresenter.h"
#import "AFNetworking.h"
#import "Api.h"
#import "DuoBanBean.h"
#import "NetWorkManager.h"

@implementation RecommandPresenter

- (void)loadData {
    NSLog(@"loadData");
    
//    [[NetWorkManager sharedManager] request_recommnad_withPath:nil date:nil andBlock:^(id data, NSError *error) {
//        if (error) {
//            [self.delegate showError:@"" errorMsg:@""];
//        }
//        NSArray *array = (NSArray *)data;
//        if (self.delegate != nil) {
//            [self.delegate showResult:[array copy]];
//        }
//    }];
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:10];
    // 获取数据
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:kDouBanUrl parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // AFN默认解析json
        if (responseObject != nil) {
            NSDictionary *resObj = responseObject;
            NSArray *posts = [resObj objectForKey:@"posts"];
            if (posts != nil && posts.count != 0) {
                for (NSDictionary *dic in posts) {
                    DuoBanBean *data = [[DuoBanBean alloc] initWithDic:dic];
                    if (data.thumbs.count != 0) {
                        [array addObject: data];
                    }
                    
                }
                
                if (self.delegate != nil) {
                    [self.delegate showResult:[array copy]];
                }
            }
        }
        NSLog(@"Success");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error: %@",error);
        if (self.delegate != nil) {
            [self.delegate showError:[NSString stringWithFormat:@"%li",(long)error.code] errorMsg:[error localizedDescription]];
        }
        
    }];
    
    
    
}

@end
