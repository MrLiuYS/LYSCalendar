//
//  NSDate+LYS.h
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/6.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (LYS)

+ (NSCalendar *)lys_Calendar;

-(int)firstWeekDayInMonth;

-(int)numDaysInMonth;

-(NSDate *)offsetMonth:(int)numMonths;


/**
 日期:将天 改成制定的某一天

 @param dayInt <#dayInt description#>
 @return <#return value description#>
 */
- (NSDate *)lys_DateResetDayInt:(int)dayInt;


- (NSInteger)lys_year;
- (NSInteger)lys_month;
- (NSInteger)lys_day;
- (NSInteger)lys_minute;
- (NSInteger)lys_second;



@end
