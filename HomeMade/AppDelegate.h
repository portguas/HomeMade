//
//  AppDelegate.h
//  HomeMade
//
//  Created by He,Yulong on 2017/8/15.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (assign, nonatomic) CGFloat scale;

@property (assign, nonatomic) CGFloat screenHeight;

@property (assign, nonatomic) CGFloat screenWidth;

@property (assign, nonatomic) BOOL hasNetwork;
@end

