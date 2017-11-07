//
//  NSDate+Common.m
//  HomeMade
//
//  Created by He,Yulong on 2017/9/8.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import "NSDate+Common.h"

@implementation NSDate (Common)

- (NSString *)dateToNString {
    NSString *str = nil;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    str = [formatter stringFromDate:self];
    return str;
}


- (NSString *)dateToNStringWithFormat:(NSDateFormatter *)format {
    NSString *str = nil;
    str = [format stringFromDate:self];
    return str;
}
@end
