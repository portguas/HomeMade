//
//  BasePresenter.m
//  HomeMade
//
//  Created by He,Yulong on 2017/8/18.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import "BasePresenter.h"

@implementation BasePresenter


- (instancetype)initWithView:(id)view{
    
    if (self = [super init]) {
        _view = view;
    }
    return self;
}

@end
