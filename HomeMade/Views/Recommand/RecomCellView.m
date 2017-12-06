//
//  RecomCellViewTableViewCell.m
//  HomeMade
//
//  Created by He,Yulong on 2017/8/27.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import "RecomCellView.h"
#import "Constants.h"
#import "PureLayout.h"

@implementation RecomCellView

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
        _topImage = [[UIImageView alloc] init];
        [self.contentView addSubview:_topImage];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont boldSystemFontOfSize:16];
        _titleLabel.numberOfLines = 0;
        [self.contentView addSubview:_titleLabel];
        
        _abstractLabel = [[UILabel alloc] init];
        _abstractLabel.textAlignment = NSTextAlignmentLeft;
        _abstractLabel.font = [UIFont systemFontOfSize:14];
        _abstractLabel.numberOfLines = 0;
        [self.contentView addSubview:_abstractLabel];
        
        
        // 约束只能放在这里 不能放到layoutSubviews 否则无效
        [_topImage autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.contentView withOffset:0];
        [_topImage autoSetDimension:ALDimensionHeight toSize:kImageHeight];
        
        [_topImage autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.contentView];
        [_topImage autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.contentView];
        [_topImage autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_titleLabel withOffset:-10];
        
        [_titleLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.contentView withOffset:10];
        // 注意右边的距离 - 10
        [_titleLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.contentView withOffset:-15];
        [_titleLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_abstractLabel withOffset:-15];
        
        [_abstractLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.contentView withOffset:15];
        // 注意右边的距离 - 10
        [_abstractLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.contentView withOffset:-15];
        [_abstractLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.contentView withOffset:-10];
        
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
}


@end
