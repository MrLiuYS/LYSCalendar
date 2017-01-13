//
//  LYSCalendarHeaderView.m
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/4.
//  Copyright © 2017年 刘永生. All rights reserved.
//


#import "LYSCalendarHeader.h"

@implementation LYSCalendarHeaderView

- (void)lys_reloadHeaderView {
    
    [self.yearView mas_updateConstraints:^(MASConstraintMaker *make){
        make.height.mas_equalTo([self.calendar lys_CalendarHeaderYearViewHeight]);
    }];
    
    [self.calendar lys_CalendarHeaderView:self];
    [self.calendar lys_CalendarHeaderYearView:self.yearView];
    [self.calendar lys_CalendarHeaderWeekView:self.weekView];
    
}



- (instancetype)initCalendar:(LYSCalendar *)calendar
{
    self = [super init];
    if (self) {
        self.calendar = calendar;
        [self initData];
        [self initUI];
    }
    return self;
}

- (void)initData {
    
}

- (void)initUI {
    
    
    [self addSubview:self.yearView];
    [self addSubview:self.weekView];
    
    [self makeConstraints];
    
}

- (void)makeConstraints {
    
    [self.yearView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo([self.calendar lys_CalendarHeaderYearViewHeight]);
    }];
    
    [self.weekView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(self.yearView.mas_bottom);
        make.left.right.bottom.mas_equalTo(0);
    }];
    
}

- (LYSCalendarHeaderYearView *)yearView {
    
    if(!_yearView) {
        _yearView = [[LYSCalendarHeaderYearView alloc] initCalendar:self.calendar];
        
    }
    return _yearView;
}
- (LYSCalendarHeaderWeekView *)weekView {
    
    if(!_weekView) {
        _weekView = [[LYSCalendarHeaderWeekView alloc] initCalendar:self.calendar];

    }
    return _weekView;
}

@end
