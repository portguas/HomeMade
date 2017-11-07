//
//  MeInfoCollectionViewCell.h
//  HomeMade
//
//  Created by He,Yulong on 2017/9/5.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeInfoCollectionViewCell : UICollectionViewCell

@property(nonatomic, strong) NSString *identifier;

@property (nonatomic, strong) UIImageView *cellImage;
@property (nonatomic, strong) UILabel *cellName;
@end
