//
//  LYSCalendarDayView.h
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/6.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "LYSCalendarBase.h"

@interface LYSCalendarDayView : LYSCalendarBase

@property (nonatomic, strong) UILabel *dayLabel; /**< <#explain#> */



@property (nonatomic, strong) NSDate *currentDate; /**< 当前日期 */

@property (nonatomic, copy) NSString * yearMonthDayTag; /**< 标签 */


@end
