//
//  LeftViewController.m
//  HomeMade
//
//  Created by He,Yulong on 2017/8/15.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import "LeftViewController.h"
#import "LeftCellView.h"

@interface LeftViewController ()

@property(strong, nonatomic)NSArray *menuArray;

@end

@implementation LeftViewController


- (id)init{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        self.menuArray = @[NSLocalizedString(@"QQ", nil),
                           @"",
                           NSLocalizedString(@"Weixin", nil),
                           @"test",
                           @"",
                           @"test1"];
        self.view.backgroundColor = [UIColor clearColor];
        [self.tableView registerClass:[LeftCellView class] forCellReuseIdentifier:@"Cell"];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.contentInset = UIEdgeInsetsMake(44.0, 0.0, 44.0, 0.0);
        self.tableView.showsVerticalScrollIndicator = NO;
        self.tableView.backgroundColor = [UIColor clearColor];
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

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
    return UIStatusBarAnimationFade;
}


#pragma mark UITableViewDataSource 

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.menuArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    LeftCellView *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.textLabel.text = self.menuArray[indexPath.row];
    
    cell.separatorView.hidden = (indexPath.row <= 3 || indexPath.row == self.menuArray.count-1);
    cell.userInteractionEnabled = (indexPath.row != 1 && indexPath.row != 3);
    return cell;
}


#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return (indexPath.row == 1 || indexPath.row == 3) ? 22.0 : 44.0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
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
