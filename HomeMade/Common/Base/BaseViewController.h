//
//  BaseViewController.h
//  HomeMade
//
//  Created by He,Yulong on 2017/8/15.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController<UIGestureRecognizerDelegate>

@property (assign, nonatomic) CGFloat scale;

- (void)showAlertVCWithMsg:(NSString *)msg;

- (void)showAlertViewWithTitle:(NSString *)title msg:(NSString *)msg style:(UIAlertControllerStyle)style;

- (void)showAlertViewWithTitle:(NSString *)title msg:(NSString *)msg;

- (void)showAlertViewWithTitle:(NSString *)title msg:(NSString *)msg btnCancel:(NSString*)cancel btnOk:(NSString *)btnOk;

@end
