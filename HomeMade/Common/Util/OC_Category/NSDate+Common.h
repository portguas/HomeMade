//
//  NSDate+Common.h
//  HomeMade
//
//  Created by He,Yulong on 2017/9/8.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Common)

- (NSString *)dateToNString;

- (NSString *)dateToNStringWithFormat:(NSDateFormatter *)format;

@end
