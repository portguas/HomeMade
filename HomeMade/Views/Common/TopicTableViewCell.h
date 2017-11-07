//
//  TopicTableViewCell.h
//  HomeMade
//
//  Created by He,Yulong on 2017/9/8.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopicTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *topicTitle;
@property (nonatomic, strong) UIImageView *userImageView;
@property (nonatomic, strong) UILabel *userName;
@property (nonatomic, strong) UIImageView *timeImageView;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIImageView *replyImageView;
@property (nonatomic, strong) UILabel *replyLabel;
@property (nonatomic, strong) UIView *lineView;

@end
