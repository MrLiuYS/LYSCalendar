//
//  LYSCalendarLastView.m
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/4.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "LYSCalendarHeader.h"

@implementation LYSCalendarLastView


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
    
    
    self.topOffset = 0;
}
- (void)initUI {
    
    
    [self makeConstraints];
    
}

- (void)makeConstraints {
    
}

- (CGFloat)topOffsetMin {
    return 0;
}
- (CGFloat)topOffsetMax{
    
    CGFloat calHeight = self.calendar.frame.size.height;
    
    CGFloat bodyHeight = CGRectGetMaxY(self.calendar.bodyView.frame);
    
    CGFloat height = [self.calendar lys_CalendarLastViewHeight];
    
    CGFloat offset = (calHeight - bodyHeight) - height ;

    if (offset>0) {
        return 0;
    }
    
    return offset;
}

- (void)panGestureRecognizer:(UIPanGestureRecognizer *)gesture {
    
    CGFloat offset = [gesture translationInView:self].y;
    
    CGFloat tempTopOffset = self.topOffset + offset;
    
    if (tempTopOffset > self.topOffsetMin) {
        tempTopOffset = self.topOffsetMin;
    }
    else if (tempTopOffset < self.topOffsetMax) {
        
        tempTopOffset = self.topOffsetMax;
    }
    
    [self updateTopOffset:tempTopOffset];
    
}

- (void)updateTopOffset:(CGFloat)topOffset{
    
    self.topOffset = topOffset;
    
    [self mas_updateConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(self.calendar.bodyView.mas_bottom).offset(self.topOffset);
    }];
    
}


@end
