//
//  RecommandDataSource.h
//  HomeMade
//
//  Created by He,Yulong on 2017/8/27.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface RecommandDataSource : NSObject<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong, readonly) NSArray *dataSource;

- (instancetype)initWithData:(NSArray *)data;

@end
