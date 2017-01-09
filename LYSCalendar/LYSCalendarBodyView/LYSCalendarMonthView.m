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

- (void)adjustmentView {
    
    [self lys_AddAndAliquotsViews:self.weekViews
                        LRpadding:0
                      viewPadding:0
                        direction:LYSViewAliquots_Vertical];
    
}



- (void)setMonthDate:(NSDate *)monthDate {
    
    _monthDate = monthDate;
    
    [self updateMonth];
    
    
    self.simuLabel.text = [NSString stringWithFormat:@"%@",monthDate];
    
}

-(int)numRows {
    
    float lastBlock = [self.monthDate numDaysInMonth]+([self.monthDate firstWeekDayInMonth]);
    
    return ceilf(lastBlock/7);
    
}

- (void)updateMonth {
    
    int firstWeekDay = [self.monthDate firstWeekDayInMonth]-1;
    
    int currentMonthNumDays = [self.monthDate numDaysInMonth];
    
    int numRows = [self numRows];
    
    int numBlocks = numRows * 7;
    
    NSDate *previousMonth = [self.monthDate offsetMonth:-1];
    
    int prevMonthNumDays = [previousMonth numDaysInMonth];
    
    
    for (int i=0; i<numBlocks; i++) {
        
        int targetDate = i;
        
        // BOOL isCurrentMonth = NO;
        if (i<firstWeekDay) {
            
            //上个月份
            targetDate = (prevMonthNumDays-firstWeekDay)+(i+1);
            
            
        } else if (i>=(firstWeekDay+currentMonthNumDays)) { //next month
            
            //下个月份
            targetDate = (i+1) - (firstWeekDay+currentMonthNumDays);
            
        } else { //current month
            
            //当前月份
            // isCurrentMonth = YES;
            targetDate = (i-firstWeekDay)+1;
            
        }
        
        NSString *date = [NSString stringWithFormat:@"%i",targetDate];
        
        LYSCalendarWeekView * weekView = (LYSCalendarWeekView*)self.weekViews[i/7];
        
        LYSCalendarDayView * dayView = (LYSCalendarDayView*)weekView.dayViews[i%7];
        
        
        dayView.dayLabel.text = date;
        
        
        
    }
    
    
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
    
    
    [self addSubview:self.simuLabel];
    
    [self makeConstraints];
    
}
- (void)makeConstraints {
    
    [self.simuLabel mas_makeConstraints:^(MASConstraintMaker *make){
        
        make.centerX.mas_equalTo(self.mas_centerX);
        make.centerY.mas_equalTo(self.mas_centerY);
        
    }];
    
}



- (NSMutableArray *)weekViews {
    
    if(!_weekViews) {
        _weekViews = [[NSMutableArray alloc] init];
    }
    return _weekViews;
}


- (UILabel *)simuLabel {
    
    if(!_simuLabel) {
        _simuLabel = [[UILabel alloc] init];
    }
    return _simuLabel;
}


@end
