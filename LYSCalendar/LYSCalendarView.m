//
//  LYSCalendarView.m
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/4.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "LYSCalendarView.h"

#import <Masonry/Masonry.h>

@implementation LYSCalendarView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    
    [self addSubview:self.headerView];
    [self addSubview:self.bodyView];
    [self addSubview:self.lastView];
    
    [self makeConstraints];
}

- (void)makeConstraints {
        //TODO<MrLYS>: 布局
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make){
        
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo(self.calendarDeploy.headerWeekViewHeight+self.calendarDeploy.headerYearViewHeight);
    }];
    
    
    
}



- (void)updateCalendarDeploy {
    
    
    
    
}


#pragma mark - proprety

- (LYSCalendarHeaderView *)headerView {
    
    if(!_headerView) {
        _headerView = [[LYSCalendarHeaderView alloc] init];
    }
    return _headerView;
}
- (LYSCalendarBodyView *)bodyView {
    
    if(!_bodyView) {
        _bodyView = [[LYSCalendarBodyView alloc] init];
    }
    return _bodyView;
}
- (LYSCalendarLastView *)lastView {
    
    if(!_lastView) {
        _lastView = [[LYSCalendarLastView alloc] init];
    }
    return _lastView;
}
- (LYSCalendarDeploy *)calendarDeploy {
    
    if(!_calendarDeploy) {
        _calendarDeploy = [[LYSCalendarDeploy alloc] init];
    }
    return _calendarDeploy;
}


@end
