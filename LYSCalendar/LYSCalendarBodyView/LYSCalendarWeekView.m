//
//  LYSCalendarWeekView.m
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/7.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "LYSCalendarHeader.h"

@implementation LYSCalendarWeekView


- (void)adjustmentView {
    
    [self lys_AddAndAliquotsViews:self.dayViews
                        LRpadding:0
                      viewPadding:0
                        direction:LYSViewAliquots_Horizontal];
    
}



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
    
    
    [self makeConstraints];
    
}
- (void)makeConstraints {
    
}





- (NSMutableArray *)dayViews {
    
    if(!_dayViews) {
        _dayViews = [[NSMutableArray alloc] init];
    }
    return _dayViews;
}


@end
