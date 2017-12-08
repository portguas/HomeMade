//
//  TopicTableViewCell.m
//  HomeMade
//
//  Created by He,Yulong on 2017/9/8.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import "TopicTableViewCell.h"
#import "PureLayout.h"

@implementation TopicTableViewCell

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
        UIImage *image = [UIImage imageNamed:@"tabbar_me_selected"];
        self.topicTitle = [[UILabel alloc] init];
        self.topicTitle.font = [UIFont systemFontOfSize:15];
        self.topicTitle.textAlignment = NSTextAlignmentLeft;
        self.topicTitle.numberOfLines = 2;
        [self.contentView addSubview:_topicTitle];
        
        self.userImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tabbar_me_selected"]];
        [self.contentView addSubview:_userImageView];
        
        self.userName = [[UILabel alloc] init];
        self.userName.font = [UIFont systemFontOfSize:12];
        self.userName.textAlignment = NSTextAlignmentLeft;
        self.userName.numberOfLines = 1;
        [self.contentView addSubview:_userName];
        
        self.timeImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tabbar_me_selected"]];
        [self.contentView addSubview:_timeImageView];
        
        self.timeLabel = [[UILabel alloc] init];
        self.timeLabel.font = [UIFont systemFontOfSize:12];
        self.timeLabel.textAlignment = NSTextAlignmentLeft;
        self.timeLabel.numberOfLines = 1;
        [self.contentView addSubview:_timeLabel];
        
        self.replyImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tabbar_me_selected"]];
        [self.contentView addSubview:_replyImageView];
        
        self.replyLabel = [[UILabel alloc] init];
        self.replyLabel.font = [UIFont systemFontOfSize:12];
        self.replyLabel.textAlignment = NSTextAlignmentLeft;
        self.replyLabel.numberOfLines = 1;
        [self.contentView addSubview:_replyLabel];
        
        self.lineView = [[UIView alloc] init];;
        self.lineView.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:_lineView];
        
        UIColor *color = [[UIColor alloc] initWithRed:176/255 green:196/255 blue:222/255 alpha:0.1];
        self.selectedBackgroundView.backgroundColor = color;
        
        // 添加约束
        [_topicTitle autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.contentView withOffset:5];
        [_topicTitle autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.contentView withOffset:10];
        [_topicTitle autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.contentView withOffset: -10];
        [_topicTitle autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_userImageView withOffset:-3];
        
        [_userImageView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:_topicTitle];
        [_userImageView autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.contentView withOffset:-3];
        [_userImageView autoSetDimension:ALDimensionWidth toSize:image.size.width];
        [_userImageView autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_userName withOffset:-3];
        
        [_userName autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_userImageView withOffset:0];
        
        [_replyLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.contentView withOffset: -10];
        [_replyLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_replyImageView withOffset:5];
        [_replyLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_userImageView withOffset:0];

        [_replyImageView autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_userImageView];
        [_replyImageView autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:_userImageView];
        [_replyImageView autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_timeLabel withOffset:8];
        
        [_timeLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_userImageView withOffset:0];
        [_timeLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_timeImageView withOffset:3];
        
        [_timeImageView autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_userImageView];
        [_timeImageView autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:_userImageView];
        
        [_lineView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.contentView];
        [_lineView autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.contentView];
        [_lineView autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.contentView withOffset:-1];
        [_lineView autoSetDimension:ALDimensionHeight toSize:1];
        
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    
//    self.selectedBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height - 10)];
    
}
@end
