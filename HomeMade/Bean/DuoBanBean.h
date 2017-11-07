//
//  DuoBanBean.h
//  HomeMade
//
//  Created by He,Yulong on 2017/8/23.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DuoBanBean : NSObject

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *abstract;

@property (nonatomic, strong) NSString *storyId;

@property (nonatomic, strong) NSArray *thumbs;

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
