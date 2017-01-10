//
//  LYSCalendarHeaderWeekView.h
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/4.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "LYSCalendarBase.h"

@interface LYSCalendarHeaderWeekView : LYSCalendarBase

- (instancetype)initCalendar:(LYSCalendar *)calendar;


- (void)updateWeekTitleArray:(NSArray *)weekTitles;


@end
