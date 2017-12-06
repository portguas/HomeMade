//
//  TopicTitleCell.m
//  HomeMade
//
//  Created by He,Yulong on 2017/9/10.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import "TopicTitleCell.h"
#import "PureLayout.h"

@implementation TopicTitleCell

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
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _title = [[UILabel alloc] init];
        _title.font = [UIFont systemFontOfSize:17];
        _title.textAlignment = NSTextAlignmentLeft;
        _title.numberOfLines = 2;
        [self.contentView addSubview:_title];
        
        // 添加约束
        [self addConstraintForViews];
    }
    
    return self;
}

- (void)addConstraintForViews {
    // title
    [_title autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.contentView withOffset:5];
    [_title autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.contentView withOffset:5];
    [_title autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.contentView withOffset:-5];
    [_title autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.contentView withOffset:-5];
}
@end
