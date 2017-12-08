//
//  TopicViewController.m
//  HomeMade
//
//  Created by He,Yulong on 2017/9/8.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import "TopicViewController.h"
#import "PureLayout.h"
#import "TopicTableViewCell.h"
#import "TopicDetailViewController.h"
#import "NetWorkManager.h"
#import "TopicWriteViewController.h"

static NSString *const kTopicCell = @"kTopicCell";

@interface TopicViewController ()

@end

@implementation TopicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initViews];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initViews {
    // 隐藏tabbar
//    self.tabBarController.tabBar.hidden = YES;
    self.navigationItem.title = @"体育";
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"navigationBack"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
    self.navigationItem.leftBarButtonItem =leftItem;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"tweetBtn_Nav"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(writeTopic:)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    self.tableViewOfTopic = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableViewOfTopic.dataSource = self;
    self.tableViewOfTopic.delegate = self;
    [self.tableViewOfTopic registerClass:[TopicTableViewCell class] forCellReuseIdentifier:kTopicCell];
    self.tableViewOfTopic.estimatedRowHeight = 60;
    self.tableViewOfTopic.rowHeight = UITableViewAutomaticDimension;
    self.tableViewOfTopic.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:self.tableViewOfTopic];

    [self.tableViewOfTopic autoPinToTopLayoutGuideOfViewController:self withInset:0];
    [self.tableViewOfTopic autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.view];
    [self.tableViewOfTopic autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.view];
    [self.tableViewOfTopic autoPinToBottomLayoutGuideOfViewController:self withInset:0];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [[NetWorkManager sharedManager] requet_category_toplist_withPath:@"/api/stream/date/2016-08-11" andBlock:^(id data, NSError *error) {
        if (error) {
            // 显示错误界面
        }else {
            // 成功刷新界面
        }
    }];
}

- (void)updateViewConstraints {
    [super updateViewConstraints];
}

// TODO先放着里面测试用 等后面进行分离
#pragma UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TopicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTopicCell forIndexPath:indexPath];
    cell.topicTitle.text = @"今天10层低保租了一个dkt,打到后面才发现是一个俗称的信号";
    cell.userImageView.image = [UIImage imageNamed:@"tabbar_me_selected"];
    cell.userName.text = @"portguas";
    cell.timeImageView.image = [UIImage imageNamed:@"tabbar_me"];
    cell.timeLabel.text = @"刚刚";
    cell.replyImageView.image = [UIImage imageNamed:@"tabbar_me"];
    cell.replyLabel.text = @"100";
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TopicDetailViewController *vc = [[TopicDetailViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}


#pragma params
- (void)setCategoryId:(NSNumber *)categoryId {
    
}

- (void)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)writeTopic:(id)sender {
    TopicWriteViewController *vc = [[TopicWriteViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}
@end
