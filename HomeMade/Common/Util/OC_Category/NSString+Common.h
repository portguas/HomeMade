//
//  NSString+Common.h
//  HomeMade
//
//  Created by He,Yulong on 2017/9/7.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Common)

// 加密
- (NSString *)md5Str;
- (NSString*) sha1Str;

// 字体大小
- (CGSize)getSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;
- (CGFloat)getHeightWithFont:(UIFont *)font constrainedToSize:(CGSize)size;
- (CGFloat)getWidthWithFont:(UIFont *)font constrainedToSize:(CGSize)size;
-(BOOL)containsEmoji;

// 移除空格
- (NSString *)stringByRemoveSpecailCharacters;
- (NSString *)trimWhitespace;
- (BOOL)isEmpty;

//判断是否为整形
- (BOOL)isPureInt;
//判断是否为浮点形
- (BOOL)isPureFloat;

//判断是否是手机号码或者邮箱
- (BOOL)isPhoneNo;
- (BOOL)isEmail;
- (BOOL)isGK;
- (BOOL)isFileName;
- (BOOL)isPwdOK;

//转换拼音
- (NSString *)transformToPinyin;

@end
