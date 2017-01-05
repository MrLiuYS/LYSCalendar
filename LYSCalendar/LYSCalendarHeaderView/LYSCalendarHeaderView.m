//
//  LYSCalendarHeaderView.m
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/4.
//  Copyright © 2017年 刘永生. All rights reserved.
//


#import "LYSCalendarHeader.h"

@implementation LYSCalendarHeaderView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self initUI];
    }
    return self;
}




- (void)initUI {
    
    
    [self addSubview:self.yearView];
    [self addSubview:self.weekView];
    
    [self makeConstraints];
    
}

- (void)makeConstraints {
    
    [self.yearView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(kLYSCalendarHeaderYearHeight);
    }];
    
    [self.weekView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(self.yearView.mas_bottom);
        make.left.right.bottom.mas_equalTo(0);
    }];
    
}




- (LYSCalendarHeaderYearView *)yearView {
    
    if(!_yearView) {
        _yearView = [[LYSCalendarHeaderYearView alloc] init];
        _yearView.backgroundColor = [UIColor orangeColor];
    }
    return _yearView;
}
- (LYSCalendarHeaderWeekView *)weekView {
    
    if(!_weekView) {
        _weekView = [[LYSCalendarHeaderWeekView alloc] init];
        _weekView.backgroundColor = [UIColor purpleColor];
    }
    return _weekView;
}

@end
