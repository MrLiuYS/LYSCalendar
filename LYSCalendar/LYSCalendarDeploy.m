//
//  LYSCalendarDeploy.m
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/4.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "LYSCalendarDeploy.h"

@implementation LYSCalendarDeploy

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initData];
    }
    return self;
}

- (void)initData {
    
    self.headerYearViewHeight = 44;
    self.headerWeekViewHeight = 30;
    self.bodyCellHeight = 60;
    self.lastViewHeight = 800;
    
}



@end
