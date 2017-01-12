//
//  LYSCalendarMonthView.h
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/6.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "LYSCalendarBase.h"


@class LYSCalendarDayView,LYSCalendarMonthView,LYSCalendarWeekView;


@protocol LYSCalendarMonthViewDelegate <NSObject>

- (void)lysCalendarMonthView:(LYSCalendarMonthView *)monthView
                    weekView:(LYSCalendarWeekView *)weekView
                     dayView:(LYSCalendarDayView *)dayView
                     dayDate:(NSDate *)dayDate;

@end


@interface LYSCalendarMonthView : LYSCalendarBase

@property (nonatomic, unsafe_unretained) id<LYSCalendarMonthViewDelegate> delegate; /**< <#explain#> */

@property (nonatomic, strong) NSDate *monthDate; /**< <#explain#> */

@property (nonatomic, strong) NSMutableArray<LYSCalendarWeekView *> *weekViews; /**< <#explain#> */

@property (nonatomic, unsafe_unretained) LYSCalendar *calendar; /**< <#explain#> */


- (instancetype)initCalendar:(LYSCalendar *)calendar;


- (void)adjustmentView;


- (void)updateMonth;


- (void)lys_reloadCalendar;


- (LYSCalendarWeekView *)searchWeekViewFromDate:(NSDate *)date;


@end
