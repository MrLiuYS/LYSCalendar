//
//  LYSCalendar.m
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/13.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "LYSCalendar.h"



@implementation LYSCalendar


/**
 是否要自动缩放行数
 */
- (BOOL)lysCalendarIsAutoRows{
    if (_delegate && [_delegate respondsToSelector:@selector(lysCalendarIsAutoRows:)]) {
        return [_delegate lysCalendarIsAutoRows:self];
    }
    return YES;
}

/**
 头部视图高度
 */
- (CGFloat)lysCalendarHeaderViewHeight{
    if (_delegate && [_delegate respondsToSelector:@selector(lysCalendarHeaderViewHeight:)]) {
        return ceil([_delegate lysCalendarHeaderViewHeight:self]);
    }
    return 10;
}

/**
 头部视图
 */
- (UIView *)lysCalendarHeaderView{
    if (_delegate && [_delegate respondsToSelector:@selector(lysCalendarHeaderView:)]) {
        return [_delegate lysCalendarHeaderView:self];
    }
    
    return [LYSCalendarHeaderView lys_CalendarHeaderView];
}


/**
 底部视图高度
 */
- (CGFloat)lysCalendarFooterViewHeight{
    
    if (_delegate && [_delegate respondsToSelector:@selector(lysCalendarFooterViewHeight:)]) {
        return ceil([_delegate lysCalendarFooterViewHeight:self]);
    }
    return 10;
}

/**
 底部视图
 */
- (UIView *)lysCalendarFooterView{
    if (_delegate && [_delegate respondsToSelector:@selector(lysCalendarFooterView:)]) {
        return [_delegate lysCalendarFooterView:self];
    }
    return [LYSCalendarFooterView lys_CalendarFooterView];
}

/**
 月/周视图 的高度
 */
- (CGFloat)lysCalendarPageStartViewHeight{
    if (_delegate && [_delegate respondsToSelector:@selector(lysCalendarPageStartViewHeight:)]) {
        return ceil([_delegate lysCalendarPageStartViewHeight:self]);
    }
    return 10;
}

/**
 月/周视图 的头部
 */
- (UIView *)lysCalendarPageStartView{
    if (_delegate && [_delegate respondsToSelector:@selector(lysCalendarPageStartView:)]) {
        return [_delegate lysCalendarPageStartView:self];
    }
    return [LYSCalendarPageStartView lys_CalendarPageStartView];
}

/**
 月/周视图 的高度
 */
- (CGFloat)lysCalendarPageEndViewHeight{
    if (_delegate && [_delegate respondsToSelector:@selector(lysCalendarPageEndViewHeight:)]) {
        return ceil([_delegate lysCalendarPageEndViewHeight:self]);
    }
    return 10;
}

/**
 月/周视图 的尾部
 */
- (UIView *)lysCalendarPageEndView{
    if (_delegate && [_delegate respondsToSelector:@selector(lysCalendarPageEndView:)]) {
        return [_delegate lysCalendarPageEndView:self];
    }
    return [LYSCalendarPageEndView lys_CalendarPageEndView];
}


/**
 天 视图的高度
 */
- (CGFloat)lysCalendarPageViewCellHeight{
    if (_delegate && [_delegate respondsToSelector:@selector(lysCalendarPageViewCellHeight:)]) {
        return ceil([_delegate lysCalendarPageViewCellHeight:self]);
    }
    return 10;
}


/**
 天 视图
 */
- (UIView *)lysCalendarPageViewCellForRowAtDate:(NSDate *)date{
    if (_delegate && [_delegate respondsToSelector:@selector(lysCalendar:pageViewCellForRowAtDate:)]) {
        return [_delegate lysCalendar:self pageViewCellForRowAtDate:date];
    }
    return [LYSCalendarDayView lys_CalendarDayView];
}


/**
 选中 天
 */
- (void)lysCalendarPageViewDidSelectRowAtDate:(NSDate *)date{
    if (_delegate && [_delegate respondsToSelector:@selector(lysCalendar:pageViewDidSelectRowAtDate:)]) {
        return [_delegate lysCalendar:self pageViewDidSelectRowAtDate:date];
    }
}


@end
