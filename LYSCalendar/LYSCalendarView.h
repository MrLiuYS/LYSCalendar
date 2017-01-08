//
//  LYSCalendarView.h
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/4.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "LYSCalendarBase.h"


#import "LYSCalendarHeader.h"

@class LYSCalendarHeaderView,LYSCalendarBodyView,LYSCalendarLastView,LYSCalendarDeploy;

@interface LYSCalendarView : LYSCalendarBase <UIGestureRecognizerDelegate>

@property (nonatomic, strong) LYSCalendarHeaderView *headerView; /**< 头部显示年份 */

@property (nonatomic, strong) LYSCalendarBodyView *bodyView; /**< 日历的节点 */

@property (nonatomic, strong) LYSCalendarLastView *lastView; /**< 日历底部控件 */

@property (nonatomic, strong) LYSCalendarDeploy *calendarDeploy; /**< <#explain#> */


@property (nonatomic, strong) NSDate *currentMonth; /**< 设置当前月份 */




@end
