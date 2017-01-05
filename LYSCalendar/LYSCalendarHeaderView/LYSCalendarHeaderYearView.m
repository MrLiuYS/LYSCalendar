//
//  LYSCalendarHeaderYearView.m
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/4.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "LYSCalendarHeader.h"

@implementation LYSCalendarHeaderYearView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initUI];
        [self initData];
    }
    return self;
}

- (void)initUI {
    
    [self addSubview:self.yearLabel];
    [self makeConstraints];
    
}

- (void)makeConstraints {
    [self.yearLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.bottom.mas_equalTo(0);
        make.centerX.mas_equalTo(self.mas_centerX);
    }];
}

- (void)initData {
    
    //TODO<MrLYS>: 年份
    self.yearLabel.text = @"年份";
    
}


- (UILabel *)yearLabel {
    
    if(!_yearLabel) {
        _yearLabel = [[UILabel alloc] init];
        _yearLabel.font = [UIFont boldSystemFontOfSize:18];
        _yearLabel.textColor = [UIColor blackColor];
        
        
        
    }
    return _yearLabel;
}

@end
