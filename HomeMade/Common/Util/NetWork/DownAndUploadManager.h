//
//  DownAndUploadManager.h
//  HomeMade
//
//  Created by He,Yulong on 1/8/18.
//  Copyright © 2018 He,Yulong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DownAndUploadManager : NSObject

@property (nonatomic, strong) NSURLSessionConfiguration *config;
/**
 文件下载上传管理实例  单例

 @return 单例
 */
+ (id)sharedInstance;

- (void)addDownloadTask;

@end


/**
 网络请求的任务的信息
 */
@interface RequestInfo : NSObject
@property(nonatomic, copy) NSString *requestURL;
@end
/**
 下载任务信息
 */
@interface DownloadInfo : RequestInfo
@property (nonatomic, strong) NSURLSessionDownloadTask *downloadTasK;
@end
