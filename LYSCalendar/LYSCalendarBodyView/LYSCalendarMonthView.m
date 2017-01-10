//
//  LYSCalendarMonthView.m
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/6.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "LYSCalendarHeader.h"


@interface LYSCalendarMonthView ()




@end

@implementation LYSCalendarMonthView

- (void)lys_reloadCalendar {
    
    
    
}



- (void)adjustmentView {
    
    [self lys_AddAndAliquotsViews:self.weekViews
                        LRpadding:0
                      viewPadding:0
                        direction:LYSViewAliquots_Vertical];
    
}



- (void)setMonthDate:(NSDate *)monthDate {
    
    _monthDate = monthDate;
    
    [self updateMonth];
    
}

-(int)numRows {

    //TODO<MrLYS>: 自动调整行数
    return 6;
    
//    float lastBlock = [self.monthDate numDaysInMonth]+([self.monthDate firstWeekDayInMonth]);
//    
//    return ceilf(lastBlock/7);
    
}

- (void)updateMonth {
    
    int firstWeekDay = [self.monthDate firstWeekDayInMonth]-1;
    
    int currentMonthNumDays = [self.monthDate numDaysInMonth];
    
    int numRows = [self numRows];
    
    int numBlocks = numRows * 7;
    
    NSDate *preMonth = [self.monthDate offsetMonth:-1];
    
    NSDate *nextMonth = [self.monthDate offsetMonth:1];
    
    int prevMonthNumDays = [preMonth numDaysInMonth];
    
    
    for (int i=0; i<numBlocks; i++) {
        
        LYSCalendarWeekView * weekView = (LYSCalendarWeekView*)self.weekViews[i/7];
        
        LYSCalendarDayView * dayView = (LYSCalendarDayView*)weekView.dayViews[i%7];
        
        int targetDate = i;
        
        if (i<firstWeekDay) {
            
            //上个月份
            targetDate = (prevMonthNumDays-firstWeekDay)+(i+1);
            
            dayView.dayDate = [preMonth lys_DateResetDayInt:targetDate];
            
            
        } else if (i>=(firstWeekDay+currentMonthNumDays)) { //next month
            
            //下个月份
            targetDate = (i+1) - (firstWeekDay+currentMonthNumDays);
            
            dayView.dayDate = [nextMonth lys_DateResetDayInt:targetDate];
            
        } else {
            
            //当前月份
            targetDate = (i-firstWeekDay)+1;
            
            dayView.dayDate = [self.monthDate lys_DateResetDayInt:targetDate];
            
        }
        
        [self lysCalendarMonthView:self
                          weekView:weekView
                           dayView:dayView
                           dayDate:dayView.dayDate];
        
    }
    
    
}

- (void)lysCalendarMonthView:(LYSCalendarMonthView *)monthView
                    weekView:(LYSCalendarWeekView *)weekView
                     dayView:(LYSCalendarDayView *)dayView
                     dayDate:(NSDate *)dayDate {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(lysCalendarMonthView:weekView:dayView:dayDate:)]) {
        
        [self.delegate lysCalendarMonthView:self
                                   weekView:weekView
                                    dayView:dayView
                                    dayDate:dayDate];
    }else {
        
        dayView.dayLabel.text = [NSString stringWithFormat:@"%ld",(long)[dayDate lys_day]];
        
    }
    
    
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
    
    
    
    for (int section = 0; section < kLYSCalendarCellRows; section++) {
        
        LYSCalendarWeekView * weekView = [[LYSCalendarWeekView alloc]init];
        
        
        for (int row = 1; row <= 7; row++) {
            
            LYSCalendarDayView * rowView = [[LYSCalendarDayView alloc]init];
            
            [weekView.dayViews addObject:rowView];
            
        }
        
        [weekView adjustmentView];
        
        [self.weekViews addObject:weekView];
        
    }
    
    [self adjustmentView];

    [self makeConstraints];
    
}
- (void)makeConstraints {
    

    
}



- (NSMutableArray *)weekViews {
    
    if(!_weekViews) {
        _weekViews = [[NSMutableArray alloc] init];
    }
    return _weekViews;
}


@end
