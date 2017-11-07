//
//  BaseTabBarViewController.m
//  HomeMade
//
//  Created by He,Yulong on 2017/8/16.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import "BaseTabBarViewController.h"
#import "RootNavController.h"
#import "ForumNavController.h"
#import "MeNavController.h"

@interface BaseTabBarViewController ()

@end

@implementation BaseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.translucent = NO;
    // Do any additional setup after loading the view.
    for(UIViewController *vc in self.viewControllers) {
        if ([vc isKindOfClass:[RootNavController class]]) {
            vc.tabBarItem.title = NSLocalizedString(@"tab_recommend", nil);
            vc.tabBarItem.image = [[UIImage imageNamed:@"tabbar_recommend"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            vc.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_recommend_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        }else if([vc isKindOfClass:[ForumNavController class]]) {
            vc.tabBarItem.title = NSLocalizedString(@"tab_forum", nil);
            vc.tabBarItem.image = [[UIImage imageNamed:@"tabbar_forum"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            vc.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_forum_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        }else if([vc isKindOfClass:[MeNavController class]]) {
            vc.tabBarItem.title = NSLocalizedString(@"tab_me", nil);
            vc.tabBarItem.image = [[UIImage imageNamed:@"tabbar_me"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            vc.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_me_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
