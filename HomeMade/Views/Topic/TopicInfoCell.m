//
//  TopicInfoCell.m
//  HomeMade
//
//  Created by He,Yulong on 2017/9/10.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import "TopicInfoCell.h"
//#import <PureLayout.h>
#import "PureLayout.h"

@implementation TopicInfoCell

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
        
        _avatarImage = [[UIImageView alloc] init];
        [self.contentView addSubview:_avatarImage];
        
        _userNickName = [[UILabel alloc] init];
        _userNickName.font = [UIFont systemFontOfSize:12];
        _userNickName.numberOfLines = 1;
        _userNickName.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_userNickName];
        
        // 添加约束
        [self addConstraintForSubViews];
    }
    
    return self;
}

- (void)addConstraintForSubViews {
    [_avatarImage autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.contentView withOffset:5];
    [_avatarImage autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [_avatarImage autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_userNickName withOffset:-5];
    
    [_userNickName autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
}
@end
