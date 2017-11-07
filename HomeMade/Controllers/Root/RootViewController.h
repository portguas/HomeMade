//
//  RootViewController.h
//  HomeMade
//
//  Created by He,Yulong on 2017/8/15.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import <LGSideMenuController/LGSideMenuController.h>
#import <LGSideMenuController/UIViewController+LGSideMenuController.h>
#import "DLCustomSlideView.h"

@interface RootViewController : BaseViewController<DLCustomSlideViewDelegate>

@property (strong, nonatomic)  DLCustomSlideView *slideView;

@end
