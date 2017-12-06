//
//  TopicWriteImageCell.m
//  HomeMade
//
//  Created by He,Yulong on 2017/9/25.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import "TopicWriteImageCell.h"
#import "TopicWriteImageCCell.h"
#import "UICollectionViewLeftAlignedLayout.h"
#import "PureLayout.h"

static NSString *const kImageCellIndentify = @"kImageCellIndentify";

@interface TopicWriteImageCell()
@property (strong, nonatomic) NSLayoutConstraint *heightCons;
@end
@implementation TopicWriteImageCell

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
        _images = [NSArray array];
        [self configViews];
        [self configConstraints];
    }
    return self;
}

- (void)configViews {
    UICollectionViewLeftAlignedLayout *layout = [[UICollectionViewLeftAlignedLayout alloc] init];
    layout.minimumLineSpacing = 5;
    layout.minimumInteritemSpacing = 5;

    CGFloat widthOfScreen = [UIScreen mainScreen].bounds.size.width;
    CGFloat cellWidth =(widthOfScreen - 20 - 5 * 2) / 3;
    layout.itemSize =  CGSizeMake(cellWidth, cellWidth);

    _imageCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, widthOfScreen, cellWidth*2 + 10) collectionViewLayout:layout];
    _imageCollectionView.delegate = self;
    _imageCollectionView.dataSource = self;
    _imageCollectionView.scrollEnabled = NO;
    _imageCollectionView.backgroundColor = [UIColor colorWithRed:0.6 green:1 blue:0.6 alpha:0.5];

    [_imageCollectionView registerClass:[TopicWriteImageCCell class] forCellWithReuseIdentifier:kImageCellIndentify];
    [self.contentView addSubview:_imageCollectionView];
}

- (void)configConstraints {
    [_imageCollectionView autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.contentView];
    [_imageCollectionView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.contentView withOffset:10];
    [_imageCollectionView autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.contentView withOffset:-10];
    [_imageCollectionView autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.contentView];
    
    self.heightCons = [_imageCollectionView autoSetDimension:ALDimensionHeight toSize:0];
}

#pragma setArgument
- (void)setImages:(NSArray *)images {
    if (images.count > 0 && images.count <= 3) {
        self.heightCons.constant = 100;
    }else if(images.count >3 && images.count <= 6){
        self.heightCons.constant = 200;
    }
    _images = images;
    
    [_imageCollectionView reloadData];
}

#pragma UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _images.count;
}

//#pragma UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat widthOfScreen = [UIScreen mainScreen].bounds.size.width;
    CGFloat cellWidth =(widthOfScreen - 20 - 5 * 2) / 3;
    return CGSizeMake(cellWidth, cellWidth);
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TopicWriteImageCCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kImageCellIndentify forIndexPath:indexPath];

    return cell;
}

@end
