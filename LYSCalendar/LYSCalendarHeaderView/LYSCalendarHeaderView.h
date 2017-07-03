//
//  LYSCalendarHeaderView.h
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/4.
//  Copyright © 2017年 刘永生. All rights reserved.
//
//  标题

//  ----------------------------
//  |           年份           |
//  |日  一  二  三  四  五  六  |
//  ----------------------------


#import "LYSCalendarBase.h"

@class LYSCalendarHeaderYearView,LYSCalendarHeaderWeekView,LYSCalendar;

@interface LYSCalendarHeaderView : LYSCalendarBase

@property (nonatomic, strong) LYSCalendarHeaderYearView *yearView; /**< 年份 */
@property (nonatomic, strong) LYSCalendarHeaderWeekView *weekView; /**< 周标题 */

@property (nonatomic, strong) LYSCalendar * calendar;


- (instancetype)initCalendar:(LYSCalendar *)calendar;


- (void)lys_reloadHeaderView;



@end
