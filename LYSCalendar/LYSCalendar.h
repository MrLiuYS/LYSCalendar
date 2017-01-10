//
//  LYSCalendarView.h
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/4.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "LYSCalendarBase.h"


#import "LYSCalendarHeader.h"

@class LYSCalendar;
@class LYSCalendarHeaderView,LYSCalendarHeaderYearView,LYSCalendarHeaderWeekView;
@class LYSCalendarBodyView,LYSCalendarLastView,LYSCalendarDeploy;
@class LYSCalendarMonthView,LYSCalendarWeekView,LYSCalendarDayView;

@protocol LYSCalendarDelegate <NSObject>

@optional


/**
 当前月份是否可以滑动切换

 @param calendar 日期控件
 */
- (BOOL)lys_CalendarPanGesture:(LYSCalendar *)calendar;


/**
 是否开启动态行数.默认:NO
 */
- (BOOL)lys_CalendarIsAutoRows:(LYSCalendar *)calendar;


#pragma mark - headerView
/**
 自定义修改头部视图
 */
- (void)lys_Calendar:(LYSCalendar *)calendar headerView:(LYSCalendarHeaderView *)headerView;
/**
 获取header的年份的高度:默认40
 */
- (CGFloat)lys_CalendarHeaderYearViewHeight:(LYSCalendar *)calendar;

/**
 自定义头部年份数据
 */
- (void)lys_Calendar:(LYSCalendar *)calendar
      headerYearView:(LYSCalendarHeaderYearView *)yearView
                date:(NSDate *)date;

/**
 获取header的周标题的高度:默认:20;
 */
- (CGFloat)lys_CalendarHeaderWeekViewHeight:(LYSCalendar *)calendar;

/**
 自定义头部周的视图
 */
- (void)lys_Calendar:(LYSCalendar *)calendar
      headerWeekView:(LYSCalendarHeaderWeekView *)weekView
                date:(NSDate *)date;


#pragma mark - bodyView

/**
 "天" 高度:默认:50
 */
- (CGFloat)lys_CalendarBodyDayViewHeight:(LYSCalendar *)calendar;

/**
 遍历日历控件的 月 , 周, 天
 */
- (void)lys_Calendar:(LYSCalendar *)calendar
          monthView:(LYSCalendarMonthView *)monthView
           weekView:(LYSCalendarWeekView *)weekView
            dayView:(LYSCalendarDayView *)dayView
            dayDate:(LYSCalendarDayView *)dayDate;


#pragma mark - lastView


/**
 底部视图的高度:没有配置.默认0;
 */
- (CGFloat)lys_CalendarLastViewHeight:(LYSCalendar *)calendar;


/**
 自定义底部视图
 */
- (void)lys_Calendar:(LYSCalendar *)calendar lastView:(LYSCalendarLastView *)lastView;




@end


@interface LYSCalendar : LYSCalendarBase <UIGestureRecognizerDelegate>

@property (nonatomic, unsafe_unretained) id<LYSCalendarDelegate> delegate;

@property (nonatomic, strong) LYSCalendarHeaderView *headerView; /**< 头部显示年份 */

@property (nonatomic, strong) LYSCalendarBodyView *bodyView; /**< 日历的节点 */

@property (nonatomic, strong) LYSCalendarLastView *lastView; /**< 日历底部控件 */

@property (nonatomic, strong) LYSCalendarDeploy *calendarDeploy; /**< <#explain#> */


@property (nonatomic, strong) NSDate *currentMonth; /**< 设置当前月份 */

@property (nonatomic, strong) NSDate *selectDayDate; /**< 选中的日期 */


- (instancetype)initDelegate:(id)delegate;



- (BOOL)lys_CalendarIsAutoRows;

- (BOOL)lys_CalendarPanGesture;

- (void)lys_CalendarHeaderView:(LYSCalendarHeaderView *)headerView;

- (CGFloat)lys_CalendarHeaderYearViewHeight;

- (void)lys_CalendarHeaderYearView:(LYSCalendarHeaderYearView *)yearView;

- (CGFloat)lys_CalendarHeaderWeekViewHeight;

- (void)lys_CalendarHeaderWeekView:(LYSCalendarHeaderWeekView *)weekView;

- (CGFloat)lys_CalendarBodyDayViewHeight;

- (void)lys_Calendar:(LYSCalendar *)calendar
          monthView:(LYSCalendarMonthView *)monthView
           weekView:(LYSCalendarWeekView *)weekView
            dayView:(LYSCalendarDayView *)dayView
            dayDate:(LYSCalendarDayView *)dayDate;

- (CGFloat)lys_CalendarLastViewHeight;

- (void)lys_CalendarLastView:(LYSCalendarLastView *)lastView;



- (void)lys_reloadCalendar;


@end
