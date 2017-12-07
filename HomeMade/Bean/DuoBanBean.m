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

#pragma NSCoding
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.abstract = [aDecoder decodeObjectForKey:@"abstract"];
        self.storyId = [aDecoder decodeObjectForKey:@"storyId"];
        self.thumbs = [aDecoder decodeObjectForKey:@"thumbs"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_title forKey:@"title"];
    [aCoder encodeObject:_abstract forKey:@"abstract"];
    [aCoder encodeObject:_storyId forKey:@"storyId"];
    [aCoder encodeObject:_thumbs forKey:@"thumbs"];
}


@end
