//
//  LYSCalendarMonthView.m
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/6.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "LYSCalendarHeader.h"

@implementation LYSCalendarMonthView


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
    
    NSMutableArray * sectionViews = [NSMutableArray arrayWithCapacity:kLYSCalendarCellRows];
    
    for (int section = 0; section < kLYSCalendarCellRows; section++) {
        
        LYSCalendarDayView * sectionView = [[LYSCalendarDayView alloc]init];
        
        [sectionViews addObject:sectionView];
        
        NSMutableArray *rowViews = [NSMutableArray arrayWithCapacity:7];
        for (int row = 0; row < 7; row++) {
            
            LYSCalendarDayView * rowView = [[LYSCalendarDayView alloc]init];
            
            //TODO<MrLYS>: 显示日期
            rowView.dayLabel.text = [NSString stringWithFormat:@"%d-%d",section,row];
            
            
            [rowViews addObject:rowView];
        }
        
        [sectionView lys_AddAndAliquotsViews:rowViews
                                   LRpadding:0
                                 viewPadding:0
                                   direction:LYSViewAliquots_Horizontal];
    }
    
    
    [self lys_AddAndAliquotsViews:sectionViews
                        LRpadding:0
                      viewPadding:0 direction:LYSViewAliquots_Vertical];
    
    
    [self makeConstraints];
    
}
- (void)makeConstraints {
    
}




@end
