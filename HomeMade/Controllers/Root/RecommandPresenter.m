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
//    if (![Helper hasNetwork]) {
//        NSArray *arrList = [self getLocalData];
//        if (arrList == nil) {
//            if (self.delegate != nil) {
//                [self.delegate showError:@"没有网络" errorMsg:nil];
//            }
//        }else{
//             [self.delegate showResult:[arrList copy]];
//        }
//        return;
//    }
    
    NSArray *arrList = [self getLocalData];
    if (arrList != nil) {
        [self.delegate showResult:[arrList copy]];
    }
    
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
                
                [self saveList:array];
                
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (self.delegate != nil) {
            [self.delegate showError:[NSString stringWithFormat:@"%li",(long)error.code] errorMsg:[error localizedDescription]];
        }
        
    }];
}

- (void)saveList:(NSArray *)dataLists{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 将数据进行保存
        NSString *path = [Helper getFilePath:@"shuju" fileName:@"list.conf"];
        [NSKeyedArchiver archiveRootObject:dataLists toFile:path];
    });
}

- (NSArray *)getLocalData{
    NSString *path = [Helper getFilePath:@"shuju" fileName:@"list.conf"];
    @try{
        id data = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        return (NSArray *)data;
    }@catch (NSException *ex){
        return nil;
    }
    
}

@end
