//
//  MyUITextField.h
//  HomeMade
//
//  Created by He,Yulong on 2017/9/6.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyUITextField : UITextField

@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIColor *lineColor;

- (instancetype)initWithColor:(UIColor* )color;

@end
