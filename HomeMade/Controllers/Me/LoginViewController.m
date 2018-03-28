//
//  LoginViewController.m
//  HomeMade
//
//  Created by He,Yulong on 2017/9/6.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "YYText.h"

@interface LoginViewController ()

@property (nonatomic, strong) YYLabel *yyLabel;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initViews];
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"Some Text, blabla,Some Text, blabla,Some Text, blabla,Some Text, blabla,Some Text, blablaSome Text, blabla..."];
    text.yy_font = [UIFont boldSystemFontOfSize:30];
    text.yy_color = [UIColor blueColor];
    [text yy_setColor:[UIColor redColor] range:NSMakeRange(0, 4)];
    text.yy_lineSpacing = 10;
    _yyLabel = [YYLabel new];
    //    _yyLabel.frame = CGRectMake(0, 0, 300, 200);
    _yyLabel.numberOfLines = 0;
    _yyLabel.textAlignment = NSTextAlignmentLeft;
    _yyLabel.attributedText = text;
    _yyLabel.backgroundColor = [UIColor redColor];
    [self.view addSubview:_yyLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initViews {
    //    __weak typeof(self) weakSelf = self;
    //    self.navigationController.interactivePopGestureRecognizer.delegate =  weakSelf;
    
    self.navigationItem.title = @"登录";
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"close"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
    self.navigationItem.leftBarButtonItem =leftItem;
    
    self.accountLabel.font = [UIFont systemFontOfSize:14];
    self.accountTextField.borderStyle = UITextBorderStyleNone;
    self.accountTextField.tag = 0;
    self.accountTextField.placeholder = @"用户名";
    self.accountTextField.delegate = self;
    [self.accountTextField addTarget:self action:@selector(accountChange:) forControlEvents:UIControlEventEditingChanged];
    
    self.pwdLabel.font = [UIFont systemFontOfSize:14];
    self.pwdTextField.borderStyle = UITextBorderStyleNone;
    self.pwdTextField.tag = 1;
    self.pwdTextField.placeholder = @"密码";
    self.pwdTextField.delegate = self;
    [self.pwdTextField addTarget:self action:@selector(pwdChange:) forControlEvents:UIControlEventEditingChanged];
    
    self.loginBtn.layer.borderColor = [UIColor grayColor].CGColor;
    self.loginBtn.layer.borderWidth = 1;
    self.loginBtn.layer.cornerRadius = 20;
    [self.loginBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_me"] forState:UIControlStateNormal];
    [self.loginBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_me_selected"] forState:UIControlStateHighlighted];
}

- (void)backAction:(id)sender {
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)accountChange:(UITextField *)textfield{
    
}

- (void)pwdChange:(UITextField *)textfield {
    
}

// 按钮点击
- (IBAction)tapRegister:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    [self.navigationController pushViewController:[storyboard instantiateViewControllerWithIdentifier:@"RegisterViewController"] animated:YES];
}
- (IBAction)tapFindPwd:(id)sender {
}

- (IBAction)tapLogin:(id)sender {
    // 这里注意ip地址写的是电脑端的ip，因为是手机连到电脑的！
    NSString *testLoginAddress = @"http://172.18.182.35:8080/symphony/api/article/1521687285127";
    [[NetWorkManager sharedManager] request_ad_withPath:testLoginAddress andBlock:^(id data, NSError *erroe) {
        NSDictionary *dic = (NSDictionary *)data;
        if ([dic objectForKey:@"key"]) {
            NSString *keyValue = [data objectForKey:@"key"];
            NSLog(@"%@", keyValue);
        }
    }];
}
#pragma UITextFieldDelegate


@end
