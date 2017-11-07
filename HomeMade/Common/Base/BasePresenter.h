//
//  BasePresenter.h
//  HomeMade
//
//  Created by He,Yulong on 2017/8/18.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BasePresenter<E> : NSObject {
     __weak E _view;
}

- (instancetype)initWithView: (E)view;

@end
