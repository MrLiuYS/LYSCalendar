//
//  LYSCalendarDayView.m
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/6.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "LYSCalendarHeader.h"

@implementation LYSCalendarDayView

- (void)setCurrentDate:(NSDate *)currentDate {
    
    _currentDate = currentDate;
    
    _yearMonthDayTag = [currentDate lys_year_month_day];
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self addSubview:self.dayLabel];
        
        [self.dayLabel mas_makeConstraints:^(MASConstraintMaker *make){
            
            make.centerX.mas_equalTo(self.mas_centerX);
            make.centerY.mas_equalTo(self.mas_centerY);
            
        }];
        
    }
    return self;
}


- (UILabel *)dayLabel {
    
    if(!_dayLabel) {
        _dayLabel = [[UILabel alloc] init];
        _dayLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return _dayLabel;
}

@end
