//
//  LaunchAdConfiguration.h
//  HomeMade
//
//  Created by He,Yulong on 1/5/18.
//  Copyright © 2018 He,Yulong. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, BtnDirection) {
    TopRight = 1,
    TopBottom = 2,
    TopCenter = 3,
};

@interface LaunchAdConfiguration : NSObject
// 广告时间
@property (nonatomic, assign) NSInteger duration;
// 跳过按钮的位置
@property (nonatomic, assign) BtnDirection direction;

@end

#pragma Mark - 图片类型的ad 包括gif
@interface LaunchImageAdConfiguration : LaunchAdConfiguration
// 图片缩放模式 默认是 UIViewContentModeScaleToFill
@property (nonatomic, assign) UIViewContentMode contentMode;
// 图片
@property (nonatomic, copy) NSString *imageNameOrUrl;
// 如果是gif是否重复
@property (nonatomic, assign) BOOL ifGifCycle;

+ (LaunchImageAdConfiguration *)defaultConfiguration;
@end
