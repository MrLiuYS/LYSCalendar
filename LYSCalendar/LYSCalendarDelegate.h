//
//  LYSCalendarDelegate.h
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/13.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol LYSCalendarDelegate <NSObject>

@optional

/**
 是否要自动缩放行数
 */
- (BOOL)lysCalendarIsAutoRows:(LYSCalendar *)calendar;

/**
 头部视图高度
 */
- (CGFloat)lysCalendarHeaderViewHeight:(LYSCalendar *)calendar;

/**
 头部视图
 */
- (UIView *)lysCalendarHeaderView:(LYSCalendar *)calendar;

/**
 底部视图高度
 */
- (CGFloat)lysCalendarFooterViewHeight:(LYSCalendar *)calendar;

/**
 底部视图
 */
- (UIView *)lysCalendarFooterView:(LYSCalendar *)calendar;

/**
 月/周视图 的高度
 */
- (CGFloat)lysCalendarBodyStartViewHeight:(LYSCalendar *)calendar;

/**
 月/周视图 的头部
 */
- (UIView *)lysCalendarBodyStartView:(LYSCalendar *)calendar;

/**
 月/周视图 的高度
 */
- (CGFloat)lysCalendarBodyEndViewHeight:(LYSCalendar *)calendar;

/**
 月/周视图 的尾部
 */
- (UIView *)lysCalendarBodyEndView:(LYSCalendar *)calendar;


/**
 天 视图的高度
 */
- (CGFloat)lysCalendarBodyViewCellHeight:(LYSCalendar *)calendar;


/**
 天 视图
 */
- (UIView *)lysCalendar:(LYSCalendar *)calendar cellForRowAtDate:(NSDate *)date;


/**
 选中 天
 */
- (void)lysCalendar:(LYSCalendar *)calendar didSelectRowAtDate:(NSDate *)date;




@end

