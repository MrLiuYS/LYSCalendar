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


/**
 通过时间找到行数
 */
- (LYSCalendarWeekView *)searchWeekViewFromDate:(NSDate *)date {
    
    if (!date) {
        return nil;
    }
    
    NSString * searchStr = [date lys_year_month_day];
    
    for (LYSCalendarWeekView * weekView in self.weekViews) {
        for (LYSCalendarDayView * dayView in weekView.dayViews) {
            if ([searchStr isEqualToString:dayView.yearMonthDayTag]) {
                return weekView;
            }
        }
    }
    return nil;
}

- (LYSCalendarDayView *)searchDayViewFromDate:(NSDate *)date {
    
    if (!date) {
        return nil;
    }
    
    NSString * searchStr = [date lys_year_month_day];
    
    for (LYSCalendarWeekView * weekView in self.weekViews) {
        for (LYSCalendarDayView * dayView in weekView.dayViews) {
            if ([searchStr isEqualToString:dayView.yearMonthDayTag]) {
                return dayView;
            }
        }
    }
    return nil;
}



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

    return 6;
    
}

- (void)updateMonth {
    
    int firstWeekDay = [self.monthDate firstWeekDayInMonth]-1;
    
    int currentMonthNumDays = [self.monthDate numDaysInMonth];
    
    int numRows = [self numRows];
    
    int numBlocks = numRows * 7;
    
    NSDate *preMonth = [self.monthDate offsetMonth:-1];
    
    NSDate *nextMonth = [self.monthDate offsetMonth:1];
    
    int prevMonthNumDays = [preMonth numDaysInMonth];
    
    LYSCalendarMonthStatu monthStatu;
    for (int i=0; i<numBlocks; i++) {
        
        LYSCalendarWeekView * weekView = (LYSCalendarWeekView*)self.weekViews[i/7];
        
        LYSCalendarDayView * dayView = (LYSCalendarDayView*)weekView.dayViews[i%7];
        
        int targetDate = i;
        
        if (i<firstWeekDay) {
            
            //上个月份
            targetDate = (prevMonthNumDays-firstWeekDay)+(i+1);
            
            dayView.currentDate = [preMonth lys_DateResetDayInt:targetDate];
            
            monthStatu = LYSCalendarMonthStatu_Before;
            
            
        } else if (i>=(firstWeekDay+currentMonthNumDays)) { //next month
            
            //下个月份
            targetDate = (i+1) - (firstWeekDay+currentMonthNumDays);
            
            dayView.currentDate = [nextMonth lys_DateResetDayInt:targetDate];
            
            monthStatu = LYSCalendarMonthStatu_Future;
            
        } else {
            
            //当前月份
            targetDate = (i-firstWeekDay)+1;
            
            dayView.currentDate = [self.monthDate lys_DateResetDayInt:targetDate];
            
            monthStatu = LYSCalendarMonthStatu_Now;
            
        }
        
        [self.calendar lys_CalendarMonthView:self
                                    weekView:weekView
                                     dayView:dayView
                                  monthStatu:monthStatu];
        
        
    }
    
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    
    for (LYSCalendarWeekView * weekView in self.weekViews) {
        
        for (LYSCalendarDayView * dayView in weekView.dayViews) {
            
            if (CGRectContainsPoint( [weekView convertRect:dayView.frame toView:self], touchPoint)) {
                
                [self.calendar lys_CalendarDidSelectMonthView:self
                                                     weekView:weekView
                                                      dayView:dayView];
                return;
                
            }
        }
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
            
            LYSCalendarDayView * rowView = [self.calendar lys_CalendarPreloadingDayView];
            
            
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
