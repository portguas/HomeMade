//
//  TopicViewController.h
//  HomeMade
//
//  Created by He,Yulong on 2017/9/8.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopicModel.h"

@interface TopicViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSNumber *categoryId;
@property (nonatomic, strong) UITableView *tableViewOfTopic;
@property (nonatomic, strong) TopicList *topicList;
@property (nonatomic, copy) NSString *cateInfo;

@end
