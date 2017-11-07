//
//  TopicWriteTextCell.h
//  HomeMade
//
//  Created by He,Yulong on 2017/9/15.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextViewWithPlaceHolder.h"

@interface TopicWriteTextCell : UITableViewCell<UITextViewDelegate>
@property (nonatomic, strong) UIView *footerToolBar;
@property (nonatomic, strong) TextViewWithPlaceHolder *textView;

@property (nonatomic,copy) void(^photoBtnBlock)();
@property (nonatomic,copy) void(^locationBtnBlock)();
@property (nonatomic,copy) void(^topicBtnBlock)();

- (BOOL)inputBecomeFirstResponder;
@end
