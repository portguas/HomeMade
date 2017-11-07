//
//  RegisterViewController.h
//  HomeMade
//
//  Created by He,Yulong on 2017/9/6.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "MyUITextField.h"

@interface RegisterViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UILabel *registerAccountLable;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *regLabelTopCons;

@property (weak, nonatomic) IBOutlet MyUITextField *registerTFVPhone;

@property (weak, nonatomic) IBOutlet UILabel *registerCodeLabel;
@property (weak, nonatomic) IBOutlet MyUITextField *registerTFCode;
@property (weak, nonatomic) IBOutlet UIButton *btnGetCode;
@property (weak, nonatomic) IBOutlet UIButton *btnOk;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btnOkTopCons;

@end
