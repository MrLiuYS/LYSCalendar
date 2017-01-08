//
//  LYSCalendarDayView.m
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/6.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "LYSCalendarHeader.h"

@implementation LYSCalendarDayView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initData];
        [self initUI];
        
    }
    return self;
}

- (void)initData {
    
}
- (void)initUI {
    
    [self addSubview:self.dayLabel];
    
    [self makeConstraints];
    
}
- (void)makeConstraints {
    
//    self.dayLabel.frame = CGRectMake(0, 0, 50, 50);
    
    [self.dayLabel mas_makeConstraints:^(MASConstraintMaker *make){
        
//        make.left.top.right.bottom.mas_equalTo(0);
        make.centerX.mas_equalTo(self.mas_centerX);
        make.centerY.mas_equalTo(self.mas_centerY);
        
    }];
    
}

- (UILabel *)dayLabel {
    
    if(!_dayLabel) {
        _dayLabel = [[UILabel alloc] init];
        _dayLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return _dayLabel;
}

@end
