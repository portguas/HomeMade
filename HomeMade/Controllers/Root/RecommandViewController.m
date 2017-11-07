//
//  RecommandViewController.m
//  HomeMade
//
//  Created by He,Yulong on 2017/8/17.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import "RecommandViewController.h"
#import <PureLayout.h>
#import "RecommandDataSource.h"
#import "RecomCellView.h"
#import <UITableView+FDTemplateLayoutCell.h>
#import <MJRefresh.h>

@interface RecommandViewController (){
    CGFloat tabBarHeight;
    CGFloat screenWidth;
    CGFloat screenheight;
}

@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) RecommandDataSource *dataSource;
@property (nonatomic, strong) UIView *headView;

@end

@implementation RecommandViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configParams];
    
    [self initUI];
    
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
   
}
- (void)viewDidAppear:(BOOL)animated{
    
}
- (void)viewWillDisappear:(BOOL)animated{
    
}
- (void)viewDidDisappear:(BOOL)animated{
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    // 高度是viewcontroller的高度- navigationbar的高度 - sideViewController的高度 - tabbar的高度
//    self.tableView.frame = CGRectMake(0, 0, screenWidth, screenheight - 64 -34 - tabBarHeight);
}

// 初始化所有数据
- (void)configParams {
    self.presenter = [[RecommandPresenter alloc] init];
    self.presenter.delegate = self;
    
    screenWidth = [UIScreen mainScreen].bounds.size.width;
    screenheight = [UIScreen mainScreen].bounds.size.height;
    
    tabBarHeight = self.tabBarController.tabBar.bounds.size.height;
}

// 初始化界面
- (void)initUI {
    // tableview
    // 34是顶部的滑动分类的高度
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenheight - 64  -tabBarHeight) style:UITableViewStylePlain];
    self.tableView.estimatedRowHeight = 130;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.tableView registerClass:[RecomCellView class] forCellReuseIdentifier:@"cell"];
//    [self.tableView registerNib:[UINib nibWithNibName:@"RecomCellView" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        //
        NSLog(@"");
    }];
    
    [self.tableView.mj_header beginRefreshing];
}

- (void)loadData {
    if (self.presenter != nil) {
        [self.presenter loadData];
    }
}

#pragma RecomPresenterProtocol

- (void)showResult:(NSArray *)resultArray {
    
    [self.tableView.mj_header endRefreshing];
    
    self.dataSource = [[RecommandDataSource alloc] initWithData:resultArray];
    self.tableView.dataSource = self.dataSource;
    [self.tableView reloadData];
    NSLog(@"show");
}

- (void)showError:(NSString *)errorCode errorMsg:(NSString *)errMsg {
    
}

#pragma UITableViewDelegate

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 150;
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"");
}

@end
