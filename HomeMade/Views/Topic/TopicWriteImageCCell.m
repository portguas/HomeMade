//
//  TopicWriteImageCCell.m
//  HomeMade
//
//  Created by He,Yulong on 2017/9/25.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import "TopicWriteImageCCell.h"
#import "PureLayout.h"

@implementation TopicWriteImageCCell

- (instancetype)initWithFrame:(CGRect)frame {
    self =  [super initWithFrame:frame];
    if (self) {
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = YES;
        _imageView.image = [UIImage imageNamed:@"imageLeft"];
        [self.contentView addSubview:_imageView];
        _delButton = [[UIButton alloc] initWithFrame:CGRectMake(self.bounds.size.height - 20, 0, 20, 20)];
        [_delButton setImage:[UIImage imageNamed:@"btn_delete_topicimage"] forState:UIControlStateNormal];
        _delButton.layer.cornerRadius = CGRectGetHeight(_delButton.frame) / 2;
        _delButton.layer.masksToBounds = YES;
        [_delButton addTarget:self action:@selector(delImage:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_delButton];
        
        [_imageView autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.contentView];
        [_imageView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.contentView];
        [_imageView autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.contentView];
        [_imageView autoSetDimension:ALDimensionHeight toSize:115];
        [_imageView autoSetDimension:ALDimensionWidth toSize:115];
        [_imageView autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.contentView];
    }
    
    return self;
}

- (void)setCurTopicImage:(TopicImage *)curTopicImage {
    _curTopicImage = curTopicImage;
    if (_curTopicImage) {
        _imageView.image = curTopicImage;
    }else {
        
    }
}

#pragma Action
- (void)delImage:(id)sender {
    
}

- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    [super preferredLayoutAttributesFittingAttributes:layoutAttributes];
    [self setNeedsLayout];
    [self layoutIfNeeded];
    CGSize size = [self.contentView systemLayoutSizeFittingSize:layoutAttributes.size];
    CGRect cellFrame = layoutAttributes.frame;
    cellFrame.size.height = size.height;
    NSLog(@"%f高度", size.height);
    layoutAttributes.frame = cellFrame;
    return layoutAttributes;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)targetSize {
    UICollectionView * collectionView = [self getCollectionView];
    collectionView.frame = CGRectMake(0, 0, targetSize.width, CGFLOAT_MAX);
    [collectionView layoutIfNeeded];
    return collectionView.collectionViewLayout.collectionViewContentSize;
}

- (UICollectionView *)getCollectionView {
    UIView *view = self.superview;
    while (![view isKindOfClass:[UICollectionView class]] && view) {
        view = view.superview;
    }
    return (UICollectionView *)view;
}

@end
