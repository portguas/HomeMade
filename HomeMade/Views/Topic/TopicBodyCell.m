//
//  TopicBodyCell.m
//  HomeMade
//
//  Created by He,Yulong on 2017/9/10.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import "TopicBodyCell.h"
#import "PureLayout.h"

@implementation TopicBodyCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _yyBodyLable = [[YYLabel alloc] init];
        _yyBodyLable.numberOfLines = 0;
        // 当对yylabel添加约束的时候, 必须设置这个参数多行才会有效
        _yyBodyLable.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 10;
        _yyBodyLable.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_yyBodyLable];
        
        [self addConstraintForSubViews];
    }
    return self;
}

- (void)addConstraintForSubViews {
    
    [_yyBodyLable autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.contentView withOffset:5];
    [_yyBodyLable autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.contentView withOffset:5];
    [_yyBodyLable autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.contentView withOffset:-5];
    [_yyBodyLable autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.contentView withOffset:-5];
}

@end
