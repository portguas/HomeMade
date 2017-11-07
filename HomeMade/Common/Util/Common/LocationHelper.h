//
//  LocationHelper.h
//  HomeMade
//
//  Created by He,Yulong on 10/31/17.
//  Copyright © 2017 He,Yulong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface LocationHelper : NSObject

//百度转火星坐标
+ (CLLocationCoordinate2D )bdToGGEncrypt:(CLLocationCoordinate2D)coord;
//火星转百度坐标
+ (CLLocationCoordinate2D )ggToBDEncrypt:(CLLocationCoordinate2D)coord;

@end
