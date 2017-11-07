//
//  TopicReplyCell.m
//  HomeMade
//
//  Created by He,Yulong on 2017/9/10.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import "TopicReplyCell.h"
#import <PureLayout.h>

@implementation TopicReplyCell

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
        _replyLabel = [[UILabel alloc] init];
        _replyLabel.font = [UIFont systemFontOfSize:14];
        _replyLabel.textAlignment = NSTextAlignmentLeft;
        _replyLabel.numberOfLines = 0;
        [self.contentView addSubview:_replyLabel];
        
        [self addConstraintForSubViews];
    }
    return self;
}

- (void)addConstraintForSubViews {
    [_replyLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.contentView withOffset:5];
    [_replyLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.contentView withOffset:5];
    [_replyLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.contentView withOffset:-5];
    [_replyLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.contentView withOffset:-5];
}

@end
