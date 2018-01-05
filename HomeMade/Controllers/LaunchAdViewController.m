//
//  LaunchAdViewController.m
//  HomeMade
//
//  Created by He,Yulong on 1/5/18.
//  Copyright © 2018 He,Yulong. All rights reserved.
//

#import "LaunchAdViewController.h"

@interface LaunchAdViewController ()

@property (nonatomic, strong) UIImageView *adImage;

@end

@implementation LaunchAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initDatas];
    [self initViews];
}

// 加载广告数据
- (void)initDatas {
    
}

- (void)initViews {
    // 图片
    self.adImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"3"]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
