//
//  TopicWriteImageCell.h
//  HomeMade
//
//  Created by He,Yulong on 2017/9/25.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopicWriteImageCell : UITableViewCell<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong)UICollectionView *imageCollectionView;
@property (nonatomic, strong) UIImageView *myImageView;

@property (nonatomic, strong) NSArray *images;

@end
