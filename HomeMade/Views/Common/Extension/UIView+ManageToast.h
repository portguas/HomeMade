//
//  UIView+ManageToast.h
//  HomeMade
//
//  Created by He,Yulong on 2017/9/7.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ManageToast)

- (void)showCustToast:(NSString *)msg;

- (void)showCusToast:(NSString *)msg duration:(NSTimeInterval)duration;

- (void)hideCusToast;

@end
