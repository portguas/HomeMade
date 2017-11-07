//
//  RecommandPresenter.h
//  HomeMade
//
//  Created by He,Yulong on 2017/8/18.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasePresenter.h"

@protocol RecomPresenterProtocol <NSObject>

- (void)showResult:(NSArray *_Nullable)resultArray;

- (void)showError:(NSString *_Nullable)errorCode errorMsg:(NSString *_Nullable)errMsg;

@end

@interface RecommandPresenter : BasePresenter

@property(nonatomic, weak, nullable) id<RecomPresenterProtocol> delegate;

- (void)loadData;

@end
