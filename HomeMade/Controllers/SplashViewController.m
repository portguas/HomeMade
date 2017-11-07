//
//  SplashViewController.m
//  HomeMade
//
//  Created by He,Yulong on 2017/8/16.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import "SplashViewController.h"
#import "MainViewController.h"
@interface SplashViewController ()

@property (strong , nonatomic) UIPageControl *pageCtl;
@end

@implementation SplashViewController

- (id)init {
    self = [super init];
    if (self) {
        CGFloat width = self.view.bounds.size.width;
        CGFloat height = self.view.bounds.size.height;
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
        for(int i = 0; i <3; i++) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.png", i+1]];
            
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(width*i, 0, width, height)];
            if(i == 2){
                imageView.userInteractionEnabled = YES;
                UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                closeBtn.frame = CGRectMake(width/3, height * 7 /8, width/3, height/16);
                closeBtn.layer.borderWidth = 2;
                closeBtn.layer.cornerRadius = 10;
                closeBtn.layer.borderColor = [UIColor whiteColor].CGColor;
                [closeBtn setTitle:@"Enter" forState:UIControlStateNormal];
                [closeBtn setTintColor:[UIColor whiteColor]];
                [closeBtn addTarget:self action:@selector(goEnter:) forControlEvents:UIControlEventTouchUpInside];
                
                [imageView addSubview:closeBtn];
            }
            imageView.image = image;
            [scrollView addSubview:imageView];
        }
        
        scrollView.bounces = NO;
        scrollView.pagingEnabled = YES;
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.contentSize = CGSizeMake(width* 3, height);
        scrollView.delegate = self;
        [self.view addSubview:scrollView];
        
        self.pageCtl = [[UIPageControl alloc] initWithFrame:CGRectMake(width / 3, height * 15 /16, width /3, height / 16)];
        self.pageCtl.numberOfPages = 3;
        self.pageCtl.pageIndicatorTintColor = [UIColor yellowColor];
        self.pageCtl.currentPageIndicatorTintColor = [UIColor redColor];
        [self.view addSubview:self.pageCtl];
    
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.pageCtl.currentPage = (NSInteger)(scrollView.contentOffset.x / [UIScreen mainScreen].bounds.size.width);
}

- (void)goEnter:(UIButton *)sender {
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setBool:YES forKey:@"notFirst"];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    self.view.window.rootViewController = [storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
}




@end
