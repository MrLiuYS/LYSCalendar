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

@property (nonatomic, strong) NSMutableArray *weekViews; /**< <#explain#> */


//TODO<MrLYS>: 时间
@property (nonatomic, strong) UILabel *simuLabel; /**< <#explain#> */


- (void)adjustmentView;


- (void)updateMonth;

@end
