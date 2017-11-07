//
//  LoginViewController.h
//  HomeMade
//
//  Created by He,Yulong on 2017/9/6.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyUITextField.h"
#import "BaseViewController.h"

@interface LoginViewController : BaseViewController<UITextFieldDelegate>

// navibar
@property (weak, nonatomic) IBOutlet UINavigationBar *loginNavBar;

// aacount
@property (weak, nonatomic) IBOutlet UILabel *accountLabel;
@property (weak, nonatomic) IBOutlet MyUITextField *accountTextField;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *accountLabelTopCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *accountTFTopCons;
// pwd
@property (weak, nonatomic) IBOutlet UILabel *pwdLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pwdLabelTopCons;
@property (weak, nonatomic) IBOutlet MyUITextField *pwdTextField;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pwdTFTopCons;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginBtnTopCons;
// other
@property (weak, nonatomic) IBOutlet UIImageView *seprateImage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *serateImageHeightCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *registerLeftCons;

@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (weak, nonatomic) IBOutlet UIButton *findPwdBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *findRightCons;
// 第三方登录
@property (weak, nonatomic) IBOutlet UIImageView *qqLogin;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *qqRightCons;
@property (weak, nonatomic) IBOutlet UIImageView *wechatLogin;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *wechatTopCons;
@property (weak, nonatomic) IBOutlet UIImageView *weiboLogin;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *weiboLeftCons;

@end
