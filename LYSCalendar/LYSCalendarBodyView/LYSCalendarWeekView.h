//
//  LYSCalendarWeekView.h
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/7.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "LYSCalendarBase.h"

@interface LYSCalendarWeekView : LYSCalendarBase


@property (nonatomic, strong) NSMutableArray *dayViews; /**< <#explain#> */



- (void)adjustmentView;

@end
