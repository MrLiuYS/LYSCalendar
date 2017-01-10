//
//  LYSCalendarHeaderYearView.h
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/4.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "LYSCalendarBase.h"

@interface LYSCalendarHeaderYearView : LYSCalendarBase

@property (nonatomic, strong) UILabel *yearLabel; /**< 年份 */

@property (nonatomic, strong) UIButton *preMonthBtn; /**< <#explain#> */
@property (nonatomic, strong) UIButton *nextMonthBtn; /**< <#explain#> */

- (instancetype)initCalendar:(LYSCalendar *)calendar;

@end
