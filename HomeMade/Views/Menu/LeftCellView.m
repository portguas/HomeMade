//
//  LeftCellView.m
//  HomeMade
//
//  Created by He,Yulong on 2017/8/16.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import "LeftCellView.h"

@implementation LeftCellView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        self.textLabel.font = [UIFont boldSystemFontOfSize:16];
        self.textLabel.textColor = [UIColor whiteColor];
        
        self.separatorView = [[UIView alloc] init];
        self.separatorView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.4f];
        
        [self addSubview:self.separatorView];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect textLabelFrame = self.textLabel.frame;
    textLabelFrame.origin.x = 8.0;
    textLabelFrame.size.width = CGRectGetWidth(self.frame) - 16;
    self.textLabel.frame = textLabelFrame;
    
    CGFloat height = UIScreen.mainScreen.scale == 1.0 ? 1.0 : 0.5;
    
    self.separatorView.frame = CGRectMake(0, CGRectGetHeight(self.frame) - height, CGRectGetWidth(self.frame)*0.9, height);
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    self.textLabel.alpha = highlighted ? 0.5: 1.0;
}

@end
