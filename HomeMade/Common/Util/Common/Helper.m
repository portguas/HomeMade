//
//  Helper.m
//  HomeMade
//
//  Created by He,Yulong on 10/11/17.
//  Copyright © 2017 He,Yulong. All rights reserved.
//

#import "Helper.h"
#import <Photos/Photos.h>
#import "AppDelegate.h"

@implementation Helper

+ (void)requestPhotoLibraryAuthorizationStatus:(void (^)(BOOL authoried))handle {
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        if (status != PHAuthorizationStatusAuthorized) {
//            [weakSelf showSheetTips:@"请在iPhone的“设置->隐私->照片”中打开本应用的访问权限"];
            handle(NO);
        }else {
            handle(YES);
        }
    }];
}

+ (BOOL)checkPhotoLibraryAuthorization {
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if (status != PHAuthorizationStatusAuthorized) {
        return NO;
    }else {
        return YES;
    }
}
- (void)showSheetTips:(NSString *)tips {
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"提示" message:tips preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"允许" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [ac addAction:okAction];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"不允许" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [ac addAction:cancelAction];
}

+ (BOOL)hasNetwork {
    return ((AppDelegate *)[[UIApplication sharedApplication] delegate]).hasNetwork;
}

+ (NSString *)getFilePath:(NSString *)dir fileName:(NSString *)fileName {
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *sysCachePath = [[path objectAtIndex:0] stringByAppendingPathComponent:@"Caches"];
    NSString *createDir = [sysCachePath stringByAppendingPathComponent:dir];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    BOOL isDir = YES;
    BOOL isSuccess = YES;
    NSString *filePath;
    if (![fileManager fileExistsAtPath:createDir isDirectory:&isDir]) {
        isSuccess = [fileManager createDirectoryAtPath:createDir withIntermediateDirectories:YES attributes:nil error:nil];
    }
    if (isSuccess) {
         filePath = [createDir stringByAppendingPathComponent:fileName];
        return filePath;
    }else {
        return nil;
    }
}

+ (void)DDLog:(NSString *)string {
    DDLogInfo(@"%@: %@", HMIdentifier, string);
}
@end
