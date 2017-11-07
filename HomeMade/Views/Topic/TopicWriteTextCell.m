//
//  TopicWriteTextCell.m
//  HomeMade
//
//  Created by He,Yulong on 2017/9/15.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import "TopicWriteTextCell.h"
#import "UIView+Common.h"
#import <PureLayout.h>

@interface TopicWriteTextCell() {
    CGFloat keyBoardHeight;
    CGFloat textViewHeight;
    BOOL isFirtOver200;
}

@property (strong, nonatomic) UIButton *locationButton;
@property (strong, nonatomic) NSLayoutConstraint *textViewHeightCons;
@end

@implementation TopicWriteTextCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self configViews];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configViews];
    }
    return self;
}

- (void)configViews {
    if (_textView == nil) {
        _textView = [[TextViewWithPlaceHolder alloc] initWithFrame:CGRectMake(10, 0, [UIScreen mainScreen].bounds.size.width - 20, 70)];
        _textView.delegate = self;
        _textView.placeholder =@"测试占位符";
        _textView.font = [UIFont systemFontOfSize:16];
        _textView.returnKeyType = UIReturnKeyDefault;
        _textView.backgroundColor = [UIColor yellowColor];
        _textView.scrollEnabled = NO;  //必需设置为NO 否则加了约束后还不高度不能自动变
        [self.contentView addSubview:_textView];
        
        [self addConstraintForView];
        
        isFirtOver200 = YES;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

// 键盘即将显示或者隐藏, frame即将变化的时候
- (void)keyboardChange:(NSNotification *)notify {
    NSDictionary *dic = [notify userInfo];
    NSTimeInterval animationDuration = [[dic objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    UIViewAnimationCurve animeCurve = [[dic objectForKey:UIKeyboardAnimationCurveUserInfoKey] intValue];
    CGRect keyboardEndRect = [[dic objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    [UIView animateWithDuration:animationDuration delay:0.0f options:[UIView animationOptionsForCurve:animeCurve] animations:^{
        CGFloat keyboardY =  keyboardEndRect.origin.y;
        if ([UIScreen mainScreen].bounds.size.height - keyboardY > 0) {
            textViewHeight = [UIScreen mainScreen].bounds.size.height - keyboardEndRect.size.height - 80 - 64;
        }
        
        [self.footerToolBar setY:keyboardY- CGRectGetHeight(self.footerToolBar.frame)];
    } completion:^(BOOL finished) {
    }];

}

#pragma UITableViewDelegate
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    // 键盘上面添加toolbar  toolbar是放在keyWindows上的 不是放到cell上的
    [[UIApplication sharedApplication].keyWindow addSubview:self.keyBoardToolBar];
    return YES;
}

- (UIView *)keyBoardToolBar {
    if (!_footerToolBar) {
        _footerToolBar = [[UIView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 80)];
        
        if (!_locationButton) {
            _locationButton = [self locationButtonWithStr:nil];
        }
        [_footerToolBar addSubview:_locationButton];
        UIView *keyboardToolBar = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(_footerToolBar.frame) - 40, _footerToolBar.bounds.size.width, 40)];
        keyboardToolBar.backgroundColor = [UIColor blueColor];
        
        // keyboardToolBar subbutton
        UIButton *photoBtn = [self toolBtnWithFrame:keyboardToolBar.frame index:0 image:@"keyboard_photo" andSelector:@selector(phptoTapped:)];
        [keyboardToolBar addSubview:photoBtn];
        
        UIButton *emotionBtn = [self toolBtnWithFrame:keyboardToolBar.frame index:1 image:@"keyboard_emotion" andSelector:@selector(emotionTapped:)];
        [keyboardToolBar addSubview:emotionBtn];
        
        UIButton *topicButton = [self toolBtnWithFrame:keyboardToolBar.frame index:2 image:@"keyboard_topic" andSelector:@selector(topicTapped:)];
        [keyboardToolBar addSubview:topicButton];
        
        UIButton *atButton = [self toolBtnWithFrame:keyboardToolBar.frame index:3 image:@"keyboard_at" andSelector:@selector(atTapped:)];
        [keyboardToolBar addSubview:atButton];
        
        [_footerToolBar addSubview:keyboardToolBar];
    }
    
    return _footerToolBar;
}

- (UIButton *)toolBtnWithFrame:(CGRect)frame index:(NSUInteger)index image:(NSString *)imageName andSelector:(SEL)sel {
    CGFloat toolbarHeight = CGRectGetHeight(frame);
    CGFloat padding = 15;
    CGFloat btnWidth = (CGRectGetWidth(frame) - padding * 2) / 4;
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(padding + btnWidth * index, 0, btnWidth, toolbarHeight)];
    btn.contentHorizontalAlignment = UIControlContentVerticalAlignmentCenter;
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

- (UIButton *)locationButtonWithStr:(NSString *)str {
    if (!_locationButton) {
        _locationButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_locationButton setImage:[UIImage imageNamed:@"tabbar_me_selected"] forState:UIControlStateNormal];
        [_locationButton setTitle:@"所在的位置" forState:UIControlStateNormal];
        [_locationButton addTarget:self action:@selector(getLocation:) forControlEvents:UIControlEventTouchUpInside];
        _locationButton.backgroundColor = [UIColor yellowColor];
        _locationButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _locationButton.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40);
    }
    return _locationButton;
}

#pragma Action

/**
 获取地理位置
 @param sender 按钮
 */
- (void)getLocation:(id)sender {
    if(self.locationBtnBlock) {
        self.locationBtnBlock();
    }
}

- (void)phptoTapped:(id)sender {
    if(self.photoBtnBlock){
        self.photoBtnBlock();
    }
}

- (void)emotionTapped:(id)sender {
    
}

- (void)topicTapped:(id)sender {
    
}

- (void)atTapped:(id)sender {
    
}

// TODO 先坐车coding china这样 后面优化为微博
#pragma UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView {
    CGFloat width = CGRectGetWidth(textView.frame);
    CGSize newSize = [textView sizeThatFits:CGSizeMake(width,MAXFLOAT)];
    BOOL isHeighBigerThan200 = NO;
    
    if (newSize.height >= textViewHeight) {
        isHeighBigerThan200 = YES;

    }

    if (isHeighBigerThan200) {
        self.textView.scrollEnabled = YES;
        if (isFirtOver200) {
            textViewHeight = newSize.height;
            isFirtOver200 = NO;
        }
        self.textViewHeightCons.constant = textViewHeight;
        return;
    }else {
        self.textViewHeightCons.constant = newSize.height;
        self.textView.scrollEnabled = NO;
        UITableView *table = [self getTableView];
        [table beginUpdates];
        [table endUpdates];
    }
    
}

#pragma pravite method

/**
 textview获取焦点

 @return YES or NO
 */
- (BOOL)inputBecomeFirstResponder {
    [super becomeFirstResponder];
    [self.textView becomeFirstResponder];
    return YES;
}


/**
 添加约束
 */
- (void)addConstraintForView {
    [_textView autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.contentView];
    [_textView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.contentView withOffset:10];
    [_textView autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.contentView withOffset:-10];
    self.textViewHeightCons = [_textView autoSetDimension:ALDimensionHeight toSize:40];
    [_textView autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.contentView];
}


/**
 获取cell所在的tableview

 @return 返回tableview
 */
- (UITableView *)getTableView {
    UIView *view = self.superview;
    while (![view isKindOfClass:[UITableView class]] && view) {
        view = view.superview;
    }
    return (UITableView *)view;
}
@end
