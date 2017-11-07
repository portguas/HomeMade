//
//  DuoBanBean.m
//  HomeMade
//
//  Created by He,Yulong on 2017/8/23.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import "DuoBanBean.h"

static NSString * const kTitle = @"title";
static NSString * const kAbstract = @"abstract";
static NSString * const kID = @"id";
static NSString * const kThumbs = @"thumbs";

@implementation DuoBanBean

- (instancetype)initWithDic:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        self.title = dic[kTitle];
        self.abstract = dic[kAbstract];
        self.storyId = dic[kID];
        self.thumbs  = dic[kThumbs];
    }
    
    return self;
}

@end
