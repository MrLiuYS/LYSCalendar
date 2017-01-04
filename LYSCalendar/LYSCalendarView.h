//
//  LYSCalendarView.h
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/4.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LYSCalendarHeaderView.h"

#import "LYSCalendarBodyView.h"

#import "LYSCalendarLastView.h"


#import "LYSCalendarDeploy.h"


@interface LYSCalendarView : UIView

@property (nonatomic, strong) LYSCalendarHeaderView *headerView; /**< 头部显示年份 */

@property (nonatomic, strong) LYSCalendarBodyView *bodyView; /**< 日历的节点 */

@property (nonatomic, strong) LYSCalendarLastView *lastView; /**< 日历底部控件 */

@property (nonatomic, strong) LYSCalendarDeploy *calendarDeploy; /**< <#explain#> */

//更新配置表信息
- (void)updateCalendarDeploy;


@end
