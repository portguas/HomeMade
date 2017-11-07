//
//  RootViewController.m
//  HomeMade
//
//  Created by He,Yulong on 2017/8/15.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import "RootViewController.h"
#import "LeftViewController.h"
#import "BaseNavigationController.h"
#import "DLScrollTabbarView.h"
#import "DLLRUCache.h"
#import "RecommandViewController.h"

@interface RootViewController ()

//@property (strong , nonatomic) LGSideMenuController *sideMenuController;
@property (strong, nonatomic) NSMutableArray *itemArray_;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 这个
    self.view.backgroundColor = [UIColor whiteColor];
    [self configNavigationBar];
    
    [self configTopTabView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma init navigationbar
// 导航栏初始化
- (void)configNavigationBar {
    [self.navigationController setNavigationBarHidden:NO];
    self.navigationItem.title = NSLocalizedString(@"RootTitle", nil);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Menu"] style:UIBarButtonItemStylePlain target:self action:@selector(tapMenu:)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor blackColor];
}

- (void)configTopTabView {
    self.automaticallyAdjustsScrollViewInsets = NO; // 如果你使用了UITabBarController, 系统会自动调整scrollView的inset。加上这个如果出错的话。
    
    // Do any additional setup after loading the view from its nib.
    DLLRUCache *cache = [[DLLRUCache alloc] initWithCount:6];
    DLScrollTabbarView *tabbar = [[DLScrollTabbarView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 34)];
    tabbar.tabItemNormalColor = [UIColor blackColor];
    tabbar.tabItemSelectedColor = [UIColor redColor];
    tabbar.tabItemNormalFontSize = 14.0f;
    tabbar.trackColor = [UIColor redColor];
    self.itemArray_ = [NSMutableArray array];
    DLScrollTabbarItem *item = [DLScrollTabbarItem itemWithTitle:@"推荐" width:80];
    [self.itemArray_ addObject:item];
    for (int i=0; i<10; i++) {
        item = [DLScrollTabbarItem itemWithTitle:[NSString stringWithFormat:@"页面%d", i+1] width:50];
        [self.itemArray_ addObject:item];
    }
    tabbar.tabbarItems = self.itemArray_;
    
    self.slideView.tabbar = tabbar;
    self.slideView.cache = cache;
    self.slideView.tabbarBottomSpacing = 5;
    self.slideView.baseViewController = self;
    self.slideView.delegate = self;
    [self.slideView setup];
    self.slideView.selectedIndex = 0;
}

#pragma selector 
- (void)tapMenu:(UITapGestureRecognizer *)recognize{

     [self.sideMenuController showLeftViewAnimated:YES completionHandler:nil];
}


- (DLCustomSlideView *)slideView {
    if (_slideView == nil) {
        _slideView = [[DLCustomSlideView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height)];
        [self.view addSubview:_slideView];
    }
    return _slideView;
}

#pragma DLCustomSlideViewDelegate
- (NSInteger)numberOfTabsInDLCustomSlideView:(DLCustomSlideView *)sender {
    return self.itemArray_.count;
}

- (UIViewController *)DLCustomSlideView:(DLCustomSlideView *)sender controllerAt:(NSInteger)index {
    RecommandViewController *rvc = [[RecommandViewController alloc] init];
    int32_t rgbValue = rand();
//    rvc.view.backgroundColor = [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
    return rvc;
}
@end
