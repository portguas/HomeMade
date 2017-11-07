//
//  TopicModel.h
//  HomeMade
//
//  Created by He,Yulong on 2017/9/10.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import "BaseTopicModel.h"
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TopicState) {
    TopicStateUnreadWithReply      = 1 << 0,
    TopicStateUnreadWithoutReoly   = 1 << 1,
    TopicStateReadWithoutReply     = 1 << 2,
    TopicStateReadWithReply        = 1 << 3,
    TopicStateReadWithNewReply     = 1 << 4,
    TopicStateRepliedWithNewReply  = 1 << 5,
};

typedef NS_ENUM(NSInteger, ContentType) {
    ContentTypeString  = 0,
    ContentTypeImage,
};

@interface TopicModel : BaseTopicModel

@property (nonatomic, copy) NSString *topicId;     //文章id
@property (nonatomic, copy) NSString *topicTitle;   //文章标题
@property (nonatomic, copy) NSString *topicReplyCount;  //文章回复数
@property (nonatomic, copy) NSString *topicURL;     // 文章的url
@property (nonatomic, copy) NSString *topicContent;   // 文章的内容
@property (nonatomic, copy) NSString *topicContentRendered;
@property (nonatomic, copy) NSString *topicCreated;
@property (nonatomic, copy) NSString *topicCreatedDescription;
@property (nonatomic, copy) NSString *topicModified;
@property (nonatomic, copy) NSString *topicTouched;

@property (nonatomic, strong) NSArray *qutoArray;
@property (nonatomic, copy) NSAttributedString * attributedString;
@property (nonatomic, strong) NSArray *contentArray;
@property (nonatomic, strong) NSArray *imageURLs;

@property (nonatomic, assign) TopicState state;
@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, assign) CGFloat titleHeight;

@property (nonatomic, strong) NSMutableArray *topicImages;

@end

@interface TopicList : NSObject

@property (nonatomic, strong)NSArray *list;

- (instancetype)initWithArray:(NSArray *)array;

+ (TopicList *)getListFromResponseObject:(id)response;

@end

@interface ContentBaseModel : NSObject

@property (nonatomic, assign) ContentType contentType;

@end

@interface ContentStringModel : ContentBaseModel

@property (nonatomic, copy) NSAttributedString *arrtibuteString;
@property (nonatomic, strong) NSArray *quoteArray;

@end

@interface ContentImageModel : ContentBaseModel

@property (nonatomic, strong) NSArray *imageArray;

@end

// 文章的图片的属性
@interface TopicImage : NSObject
@property (readwrite, strong, nonatomic) UIImage *image;
@property (readwrite, strong, nonatomic) UIImage *thumbnailImage;
@property (strong, nonatomic) NSURL *assetUrl;
@property (strong, nonatomic) NSString *imageStr;
@end
