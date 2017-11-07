//
//  MyAlertView.m
//  HomeMade
//
//  Created by He,Yulong on 2017/9/7.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import "MyAlertView.h"

static MyAlertView *alertView = nil;
@implementation MyAlertView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (instancetype)shareAlertView {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        alertView = [[self alloc] init];
    });
    
    return alertView;
}

@end
