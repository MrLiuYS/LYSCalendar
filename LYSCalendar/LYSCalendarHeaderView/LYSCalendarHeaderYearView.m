//
//  LYSCalendarHeaderYearView.m
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/4.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "LYSCalendarHeader.h"

@implementation LYSCalendarHeaderYearView

- (void)lys_CalendarHeaderYearView:(LYSCalendarHeaderYearView *)yearView date:(NSDate *)date{
 
    [self yearLabel].text = [NSString stringWithFormat:@"%@",date];
    
    
}

- (UILabel *)yearLabel {
    
    UILabel * yearLabel = [self viewWithTag:200];
    if (!yearLabel) {
        yearLabel = [[UILabel alloc]init];
        yearLabel.tag = 200;
        
        [self addSubview:yearLabel];
        
        [yearLabel mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.bottom.mas_equalTo(0);
            make.centerX.mas_equalTo(self.mas_centerX);
        }];
    }
    return yearLabel;
}

- (instancetype)initCalendar:(LYSCalendar *)calendar
{
    self = [super init];
    if (self) {
        [self initUICalendar:calendar];
    }
    return self;
}

- (void)initUICalendar:(LYSCalendar *)calendar {
    
    [calendar lys_CalendarHeaderYearView:self];
    
}


- (void)initUI {
    
    
    
    [self makeConstraints];
    
}

- (void)makeConstraints {

    
}

- (void)initData {
    
    self.yearLabel.text = @"年份";
    
}


@end
