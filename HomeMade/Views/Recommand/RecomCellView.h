//
//  RecomCellViewTableViewCell.h
//  HomeMade
//
//  Created by He,Yulong on 2017/8/27.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecomCellView : UITableViewCell

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *abstractLabel;
@property (strong, nonatomic) UIImageView  *topImage;
@property (weak, nonatomic) IBOutlet UIImageView *topImageNib;
@property (weak, nonatomic) IBOutlet UILabel *titleLableNib;
@property (weak, nonatomic) IBOutlet UILabel *abstractLabelNib;

@end
