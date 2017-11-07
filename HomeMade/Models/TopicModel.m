//
//  TopicModel.m
//  HomeMade
//
//  Created by He,Yulong on 2017/9/10.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import "TopicModel.h"
#import "NSDictionary+NotNullKey.h"

@implementation TopicModel

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super initWithDictionary:dict];
    if (self) {
        self.topicId = [dict objectForSafeKey:@"id"];
        self.topicTitle = [dict objectForSafeKey:@"title"];
        self.topicReplyCount = [NSString stringWithFormat:@"%@", [dict objectForSafeKey:@"replies"]];
        self.topicURL = [dict objectForSafeKey:@"url"];
        self.topicContent = [dict objectForSafeKey:@"content"];
        self.topicContentRendered = [dict objectForSafeKey:@"content_rendered"];
        self.topicCreated         = [dict objectForSafeKey:@"created"];
        self.topicModified        = [dict objectForSafeKey:@"last_modified"];
        self.topicTouched         = [dict objectForSafeKey:@"last_touched"];
        self.topicImages = [dict objectForSafeKey:@"images"];
    }
    
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.topicImages = [NSMutableArray array];
    }
    
    return self;
}

- (void)setImageURLs:(NSArray *)imageURLs {
    
}
@end


// 获取主题的列表,每一个列表的项目就是一个文章的所有信息
@implementation TopicList

- (instancetype)initWithArray:(NSArray *)array {
    self = [super init];
    if (self) {
        NSMutableArray *list = [[NSMutableArray alloc] init];
        for (NSDictionary *dic in array) {
            TopicModel *model = [[TopicModel alloc] initWithDictionary:dic];
            [list addObject:model];
        }
        
        self.list = list;
    }
    
    return self;
}

+ (TopicList *)getListFromResponseObject:(id)response {
    // TODO重写
    TopicList * list = nil;
    return list;
}

- (void)dealloc {
    _list = nil;
}

@end

@implementation ContentBaseModel

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

@end

@implementation ContentStringModel

- (instancetype)init {
    if (self = [super init]) {
        self.contentType = ContentTypeString;
    }
    return self;
}

@end

@implementation ContentImageModel

- (instancetype)init {
    
    if (self = [super init]) {
        self.contentType = ContentTypeImage;
    }
    
    return self;
    
}

@end
