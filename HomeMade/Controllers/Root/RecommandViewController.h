//
//  RecommandViewController.h
//  HomeMade
//
//  Created by He,Yulong on 2017/8/17.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import "BaseViewController.h"
#import "RecommandPresenter.h"

@interface RecommandViewController : UIViewController<RecomPresenterProtocol>

@property (strong, nonatomic) RecommandPresenter *presenter;
@property (strong, nonatomic) UITableView *tableView;

@end
