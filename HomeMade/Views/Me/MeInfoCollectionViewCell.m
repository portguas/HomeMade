//
//  MeInfoCollectionViewCell.m
//  HomeMade
//
//  Created by He,Yulong on 2017/9/5.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import "MeInfoCollectionViewCell.h"
#import <PureLayout.h>
#import "Constants.h"

BOOL isHeightCalculated = NO;

@implementation MeInfoCollectionViewCell

- (instancetype)initWithIdentifier:(NSString *)identifier {
    self = [super init];
    if (self) {
        _identifier = identifier;
        
        [self initViews];
    }
    
    return self;
}

- (instancetype)init{
    self = [super init];
    
    if (self) {
//        _identifier = identifier;
        
        [self initViews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self){
        [self initViews];
    }
    return self;
}

- (void)initViews {
    _cellImage = [[UIImageView alloc] init];
    [self.contentView addSubview:_cellImage];
    
    _cellName = [[UILabel alloc] init];
    _cellName.font = [UIFont systemFontOfSize:12];
    _cellName.textAlignment = NSTextAlignmentCenter;
    _cellName.numberOfLines = 1;
    _cellName.textColor = [UIColor blackColor];
    _cellName.backgroundColor = [UIColor redColor];;
    [self.contentView addSubview:_cellName];
    
    [_cellImage autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.contentView withOffset:5];
    [_cellImage autoSetDimension:ALDimensionHeight toSize:30];
    [_cellImage autoAlignAxisToSuperviewAxis:ALAxisVertical];
    //        [_cellImage autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.contentView];
    //        [_cellImage autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.contentView];
    [_cellImage autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_cellName withOffset:-5];
    
    [_cellName autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [_cellName autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.contentView withOffset:-5];
}

- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    [self setNeedsLayout];
    [self layoutIfNeeded];
    CGSize size = [self.contentView systemLayoutSizeFittingSize:layoutAttributes.size];
    CGRect cellFrame = layoutAttributes.frame;
    cellFrame.size.height = size.height;
    layoutAttributes.frame = cellFrame;
    return layoutAttributes;
}
@end
