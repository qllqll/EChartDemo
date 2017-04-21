//
//  TimeTools.h
//  Golf
//
//  Created by wyhaiapple on 16/9/12.
//  Copyright © 2016年 wyhaiapple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeTools : NSObject
+(NSString *)timeWithTimeIntervalString:(UInt64)timeString;
+(NSString *)getTomorrowTime;
+ (NSString *)timeWithDateAndTimeString:(UInt64)timeString;
+ (NSString *)Todaydate;
+ (NSString *)timeWithDayAndMonthString:(UInt64)timeString;
+ (NSString *)timeWithDateAndTimeAndSecondString:(UInt64)timeString;
+ (NSString *)timeWithLineTimeIntervalString:(UInt64)timeString;
+(NSString *)getTodayPaid;
+ (NSString *)timeWithDateAndHourAndMIn:(UInt64)timeString;
+ (NSString *)timeWithDateAndMonth:(UInt64)timeString;
@end
