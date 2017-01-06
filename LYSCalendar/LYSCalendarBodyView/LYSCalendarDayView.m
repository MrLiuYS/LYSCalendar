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
        
        
        CGFloat red = (CGFloat)arc4random() / 0x100000000;
        CGFloat green = (CGFloat)arc4random() / 0x100000000;
        CGFloat blue = (CGFloat)arc4random() / 0x100000000;
        
        self.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:0.5f];
        
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
    
    [self.dayLabel mas_makeConstraints:^(MASConstraintMaker *make){
        
        make.left.top.right.bottom.mas_equalTo(0);
        
    }];
    
}



- (UILabel *)dayLabel {
    
    if(!_dayLabel) {
        _dayLabel = [[UILabel alloc] init];
    }
    return _dayLabel;
}

@end
