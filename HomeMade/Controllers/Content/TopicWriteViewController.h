//
//  TopicWriteViewController.h
//  HomeMade
//
//  Created by He,Yulong on 2017/9/15.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import "BaseViewController.h"

@class TopicModel;

@interface TopicWriteViewController : BaseViewController<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) TopicModel *topic;
@property (nonatomic, strong) UINavigationItem * navItem;
@property (nonatomic, strong) UINavigationBar *navBar;
@end
