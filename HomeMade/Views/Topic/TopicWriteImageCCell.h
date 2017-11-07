//
//  TopicWriteImageCCell.h
//  HomeMade
//
//  Created by He,Yulong on 2017/9/25.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopicModel.h"

@interface TopicWriteImageCCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UIButton *delButton;

@property (nonatomic, strong) TopicImage *curTopicImage;

@end
