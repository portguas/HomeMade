//
//  BaseViewController.m
//  HomeMade
//
//  Created by He,Yulong on 2017/8/15.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initCommon];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initCommon {
    // 以iphone6为设计标准
    self.scale = [UIScreen mainScreen].bounds.size.width / 667;
    
    __weak typeof(self) weakSelf = self;
    self.navigationController.interactivePopGestureRecognizer.delegate = weakSelf;
}

#pragma UIGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if (self.navigationController && [self.navigationController.viewControllers count] == 1) {
        return NO;
    }
    return YES;
}

- (void)showAlertVCWithMsg:(NSString *)msg {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:msg message:msg preferredStyle:UIAlertControllerStyleAlert];
    alertVC.view.alpha = 0.3;
    
    [self presentViewController:alertVC animated:YES completion:^(){
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [alertVC dismissViewControllerAnimated:YES completion:nil];
        });
    }];
}

- (void)showAlertViewWithTitle:(NSString *)title msg:(NSString *)msg {
    [self showAlertViewWithTitle:title msg:msg style:UIAlertControllerStyleAlert];
}

- (void)showAlertViewWithTitle:(NSString *)title msg:(NSString *)msg style:(UIAlertControllerStyle)style {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:style];
    
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
