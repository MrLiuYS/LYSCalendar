//
//  LYSCalendar.h
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/13.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LYSCalendarDelegate.h"

#import "LYSCalendarHeaderView.h"

#import "LYSCalendarFooterView.h"


#import "LYSCalendarPageView.h"
#import "LYSCalendarPageStartView.h"
#import "LYSCalendarPageEndView.h"
#import "LYSCalendarDayView.h"


@interface LYSCalendar : UIView

@property (nonatomic, unsafe_unretained) id<LYSCalendarDelegate> delegate;

//TODO<MrLYS>: today . selectDate
//
@property (nonatomic, strong) NSDate *todayDate; /**< <#explain#> */
@property (nonatomic, strong) NSDate *selectDate; /**< <#explain#> */


- (instancetype)initDelegate:(id)delegate;



/**
 是否要自动缩放行数
 */
- (BOOL)lysCalendarIsAutoRows;

/**
 头部视图高度
 */
- (CGFloat)lysCalendarHeaderViewHeight;

/**
 头部视图
 */
- (LYSCalendarHeaderView *)lysCalendarHeaderView;

/**
 底部视图高度
 */
- (CGFloat)lysCalendarFooterViewHeight;

/**
 底部视图
 */
- (UIView *)lysCalendarFooterView;

/**
 月/周视图 的高度
 */
- (CGFloat)lysCalendarPageStartViewHeight;

/**
 月/周视图 的头部
 */
- (UIView *)lysCalendarPageStartView;

/**
 月/周视图 的高度
 */
- (CGFloat)lysCalendarPageEndViewHeight;

/**
 月/周视图 的尾部
 */
- (UIView *)lysCalendarPageEndView;


/**
 天 视图的高度
 */
- (CGFloat)lysCalendarPageViewCellHeight;


/**
 天 视图
 */
- (UIView *)lysCalendarPageViewCellForRowAtDate:(NSDate *)date;


/**
 选中 天
 */
- (void)lysCalendarPageViewDidSelectRowAtDate:(NSDate *)date;




@end
