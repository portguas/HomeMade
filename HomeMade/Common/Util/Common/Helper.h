//
//  Helper.h
//  HomeMade
//
//  Created by He,Yulong on 10/11/17.
//  Copyright © 2017 He,Yulong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Helper : NSObject

/**
 * 检查系统"照片"授权状态, 如果权限被关闭, 提示用户去隐私设置中打开.
 */
+ (void)requestPhotoLibraryAuthorizationStatus:(void (^)(BOOL authoried))handle;

/**
 坚持状态

 @return YES 就是开启了 
 */
+ (BOOL)checkPhotoLibraryAuthorization;

/**
 * 检查系统"相机"授权状态, 如果权限被关闭, 提示用户去隐私设置中打开.
 */
+ (BOOL)checkCameraAuthorizationStatus;

@end
