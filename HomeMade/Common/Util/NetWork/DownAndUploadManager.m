//
//  DownAndUploadManager.m
//  HomeMade
//
//  Created by He,Yulong on 1/8/18.
//  Copyright © 2018 He,Yulong. All rights reserved.
//

#import "DownAndUploadManager.h"

@interface DownAndUploadManager()<NSURLSessionDownloadDelegate>
@property (nonatomic, strong) NSURLSession *session;
@end

@implementation DownAndUploadManager

+ (id)sharedInstance {
    static DownAndUploadManager * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[DownAndUploadManager alloc] init];
    });
    
    return self;
}

- (NSURLSession *)session {
    if (!_session) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    }
    
    return _session;
}

- (void)addDownloadTask:(NSString *)urlStr {
    DownloadInfo *download = [[DownloadInfo alloc] init];
    download.requestURL = urlStr;
    download.downloadTasK = [_session downloadTaskWithURL:[NSURL URLWithString:urlStr] completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //
    }];
}

#pragma mark NSURLSessionDownloadDelegate

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location{
    
}
@end

@implementation RequestInfo
- (instancetype)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    return self;
}
@end

@implementation DownloadInfo
- (instancetype)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    return self;
}
@end
