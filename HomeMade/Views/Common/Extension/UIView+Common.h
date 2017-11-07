//
//  UIView+Common.h
//  HomeMade
//
//  Created by He,Yulong on 2017/9/22.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Common)

#pragma 动画相关
+ (UIViewAnimationOptions)animationOptionsForCurve:(UIViewAnimationCurve)curve;

#pragma 位置相关
- (void)setY:(CGFloat)y;

- (void)setHeight:(CGFloat)height;
@end
