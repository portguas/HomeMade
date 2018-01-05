//
//  LaunchAdConfiguration.m
//  HomeMade
//
//  Created by He,Yulong on 1/5/18.
//  Copyright © 2018 He,Yulong. All rights reserved.
//

#import "LaunchAdConfiguration.h"

@implementation LaunchAdConfiguration

@end

@implementation LaunchImageAdConfiguration

+ (LaunchImageAdConfiguration *)defaultConfiguration {
    LaunchImageAdConfiguration * config = [[LaunchImageAdConfiguration alloc] init];
    config.duration = 5;
    config.direction = TopRight;
    config.ifGifCycle = NO;
    config.contentMode = UIViewContentModeScaleToFill;
    return config;
}

@end
