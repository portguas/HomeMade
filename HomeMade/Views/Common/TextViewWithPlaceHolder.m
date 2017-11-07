//
//  TextViewWithPlaceHolder.m
//  HomeMade
//
//  Created by He,Yulong on 2017/9/15.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import "TextViewWithPlaceHolder.h"

@interface TextViewWithPlaceHolder()

@property (nonatomic, strong) UILabel *placeHolderLabel;

@end

@implementation TextViewWithPlaceHolder


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _placeholder = @"";
        _placeholderColor = [UIColor lightGrayColor];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextViewTextDidChangeNotification object:nil];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    if (!self.placeholder) {
        _placeholder = @"";
    }
    
    if (!self.placeholderColor) {
        _placeholderColor = [UIColor lightGrayColor];
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextViewTextDidChangeNotification object:nil];
}

- (void)textChanged:(NSNotification *)notify {
    if (_placeholder.length == 0) {
        return;
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        if(self.text.length == 0)
        {
            [[self viewWithTag:999] setAlpha:1];
        }
        else
        {
            [[self viewWithTag:999] setAlpha:0];
        }
    }];
}

- (void)setText:(NSString *)text {
    [super setText:text];
    [self textChanged:nil];
}

- (void)setPlaceholder:(NSString *)placeholder {
    if (_placeholder != placeholder) {
        _placeholder = placeholder;
        [self setNeedsDisplay];
    }
}

- (void)drawRect:(CGRect)rect {
    if (_placeholder.length > 0) {
        UIEdgeInsets insets = self.textContainerInset;
        if (_placeHolderLabel == nil) {
            _placeHolderLabel = [[UILabel alloc] initWithFrame:CGRectMake(insets.left+5,insets.top,self.bounds.size.width - (insets.left +insets.right+10),1.0)];
            _placeHolderLabel.lineBreakMode = NSLineBreakByWordWrapping;
            _placeHolderLabel.font = self.font;
            _placeHolderLabel.backgroundColor = [UIColor clearColor];
            _placeHolderLabel.textColor = self.placeholderColor;
            _placeHolderLabel.alpha = 0;
            _placeHolderLabel.tag = 999;
            [self addSubview:_placeHolderLabel];
        }
        
        _placeHolderLabel.text = _placeholder;
        [_placeHolderLabel sizeToFit];
        [_placeHolderLabel setFrame:CGRectMake(insets.left+5,insets.top,self.bounds.size.width - (insets.left +insets.right+10),CGRectGetHeight(_placeHolderLabel.frame))];
        [self sendSubviewToBack:_placeHolderLabel];
    }
    
    if (self.text.length == 0 && self.placeholder.length >0) {
        [self viewWithTag:999].alpha = 1;
        
    }
    
    [super drawRect:rect];
}
@end
