//
//  RegisterViewController.m
//  HomeMade
//
//  Created by He,Yulong on 2017/9/6.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import "RegisterViewController.h"
#import "NSString+Common.h"
#import "UIView+Toast.h"
#import "UIView+ManageToast.h"
#import "NetWorkManager.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initViews{
    self.navigationItem.title = @"注册";
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"navigationBack"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
    self.navigationItem.leftBarButtonItem =leftItem;
    
    self.registerTFVPhone.borderStyle = UITextBorderStyleNone;
    self.registerTFVPhone.lineColor = [UIColor grayColor];
    self.registerTFVPhone.placeholder = @"请输入手机号码";
    self.registerTFVPhone.keyboardType = UIKeyboardTypeNumberPad;
    
    self.registerTFCode.borderStyle = UITextBorderStyleNone;
    self.registerTFCode.lineColor = [UIColor grayColor];
    self.registerTFCode.placeholder = @"输入验证码";
    
    self.btnGetCode.tintColor = [UIColor blackColor];
    self.btnGetCode.layer.borderColor = [UIColor blackColor].CGColor;
    self.btnGetCode.layer.borderWidth = 1;
    self.btnGetCode.layer.cornerRadius = 13;
    
    self.btnOk.tintColor = [UIColor grayColor];
    self.btnOk.layer.cornerRadius = 15;
    self.btnOk.layer.borderWidth = 1;
    self.btnOk.layer.borderColor = [UIColor blackColor].CGColor;
}

- (void)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)tapGetCode:(id)sender {
    if([self.registerTFVPhone.text isEmpty]){
        [self.view showCustToast:@"请填写手机号码"];
        return;
    }
    [[NetWorkManager sharedManager] request_login_withPath:@"" params:@"" andBlock:^(id data, NSError *error) {
        
    }];
}

- (IBAction)tapOk:(id)sender {
    if ([self.registerTFVPhone.text isEmpty]) {
        [self.view showCustToast:@"请填写手机号码"];
        return;
    }
    if ([self.registerTFCode.text isEmpty]) {
        [self.view showCustToast:@"请填写验证码"];
        return;
    }
    if (![self.registerTFCode.text isPwdOK]) {
         [self.view showCustToast:@"密码格式不正确"];
        return;
    }
}

#pragma helper


@end
