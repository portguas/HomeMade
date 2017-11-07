//
//  MyUITextField.m
//  HomeMade
//
//  Created by He,Yulong on 2017/9/6.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import "MyUITextField.h"

@implementation MyUITextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib {
    [super awakeFromNib];
    [self addLineView];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self addLineView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addLineView];
    }
    return self;
}

- (instancetype)initWithColor:(UIColor *)color {
    if (self = [super init]) {
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height, self.bounds.size.width, 1)];
        lineView.backgroundColor = color;
        [self addSubview:lineView];
    }
    return self;
}

- (void)addLineView {
    _lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height - 1, self.bounds.size.width, 1)];
    _lineView.backgroundColor = [UIColor yellowColor];
    [self addSubview:_lineView];
}

- (void)setLineColor:(UIColor *)lineColor{
    _lineColor = lineColor;
    _lineView.backgroundColor = lineColor;
}
@end
