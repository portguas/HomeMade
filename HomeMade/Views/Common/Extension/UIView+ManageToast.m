//
//  UIView+ManageToast.m
//  HomeMade
//
//  Created by He,Yulong on 2017/9/7.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import "UIView+ManageToast.h"
#import "UIView+Toast.h"
#import <PureLayout.h>
#import "NSString+Common.h"

@implementation UIView (ManageToast)

- (void)showCustToast:(NSString *)msg {
    
    
    [CSToastManager setQueueEnabled:NO];
    UIView *alertView = [self createView:msg];;
    [self showToast:alertView duration:2 position:[NSValue valueWithCGPoint:CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2)] completion:^(BOOL finish){
        
    }];
}

- (void)showCusToast:(NSString *)msg duration:(NSTimeInterval)duration {
    UIView *alertView = [self createView:msg];;
    [self showToast:alertView duration:duration position:[NSValue valueWithCGPoint:CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2)] completion:nil];
}

- (void)hideCusToast {
    [self hideToasts];
}

- (UIView *)createView:(NSString *)msg {
    [self hideToasts];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    view.alpha = 0.7;
    view.layer.cornerRadius = 5;
    view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    UIImage *image = [UIImage imageNamed:@"tabbar_me"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [view addSubview:imageView];
    
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor whiteColor];
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentLeft;
    label.text = msg;
    [view addSubview:label];
    
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGSize size = [msg getSizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(width * 0.6, 200)];
    
    view.frame = CGRectMake(0, 0, size.width + 20, (10 + image.size.height + 10 + size.height + 10));
    
    [imageView autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:view withOffset:10];
    [imageView autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [imageView autoSetDimension:ALDimensionHeight toSize:image.size.height];
    [imageView autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:label withOffset:-10];
    
    [label autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:view  withOffset:10];
    [label autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [label autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:view withOffset:-10];
    
    return view;
}

@end
