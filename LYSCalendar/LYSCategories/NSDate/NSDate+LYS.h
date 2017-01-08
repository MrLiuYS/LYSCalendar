//
//  NSDate+LYS.h
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/6.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (LYS)

-(int)firstWeekDayInMonth;

-(int)numDaysInMonth;

-(NSDate *)offsetMonth:(int)numMonths;


@end
