//
//  NSDate+LYS.m
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/6.
//  Copyright © 2017年 刘永生. All rights reserved.
//
/*
 <MrLYS>
 ------
 参考https://github.com/shaojiankui/JKCategories
 */

#import "NSDate+LYS.h"

@implementation NSDate (LYS)

+ (NSCalendar *)lys_Calendar
{
    static NSCalendar *sharedCalendar = nil;
    if (!sharedCalendar)
        sharedCalendar = [NSCalendar autoupdatingCurrentCalendar];
    return sharedCalendar;
}


- (NSDate *)lys_DateResetDayInt:(int)dayInt {
    
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setYear:[self lys_year]];
    [dateComponents setMonth:[self lys_month]];
    [dateComponents setDay:dayInt];

    return  [[NSDate lys_Calendar] dateFromComponents:dateComponents];
    
}



-(int)firstWeekDayInMonth {
    
//    NSCalendar *gregorian = [[NSCalendar alloc]
//                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSCalendar *gregorian = [NSDate lys_Calendar];
    
    [gregorian setFirstWeekday:1];//周天为周的第一天
    
    //Set date to first of month
    NSDateComponents *comps = [gregorian components:NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay fromDate:self];
    [comps setDay:1];
    NSDate *newDate = [gregorian dateFromComponents:comps];
    
    return (int)[gregorian ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:newDate];
}

-(int)numDaysInMonth {
    
    NSCalendar *cal = [NSDate lys_Calendar];//[NSCalendar currentCalendar];
    NSRange rng = [cal rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self];
    NSUInteger numberOfDaysInMonth = rng.length;
    
    return (int)numberOfDaysInMonth;
}

-(NSDate *)offsetMonth:(int)numMonths {
    NSCalendar *gregorian = [NSDate lys_Calendar];//[[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [gregorian setFirstWeekday:2]; //monday is first day
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setMonth:numMonths];
    //[offsetComponents setHour:1];
    //[offsetComponents setMinute:30];
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:self options:0];
}

- (NSDateComponents *)lys_components
{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal) fromDate:self];
    
    return components;
}

- (NSString *)lys_year_month_day{
    
    NSDateComponents * com = [self lys_components];
    return [NSString stringWithFormat:@"%ld_%ld_%ld",(long)com.year,(long)com.month,(long)com.day];
    
}

- (NSInteger)lys_year {
    
    return [self lys_components].year;
}

- (NSInteger)lys_month {
    
    return [self lys_components].month;
}
- (NSInteger)lys_day {
    
    return [self lys_components].day;
}
- (NSInteger)lys_minute {
    
    return [self lys_components].minute;
}
- (NSInteger)lys_second {
    
    return [self lys_components].second;
}


- (NSDateComponents *)intervalToDate:(NSDate *)date
{
    // 日历对象
    NSCalendar *calendar = [NSDate lys_Calendar];
    
    // 想比较哪些元素
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    
    // 比较
    return [calendar components:unit fromDate:self toDate:date options:0];
}

- (NSDateComponents *)intervalToNow
{
    return [self intervalToDate:[NSDate date]];
}

- (BOOL)lys_CompartYear_Month_Day:(NSDate *)date {
    
    NSDateComponents * compon = [self intervalToDate:date];
    
    if (compon.year == 0 && compon.month == 0 && compon.day == 0) {
        return YES;
    }
    return NO;
}



@end
