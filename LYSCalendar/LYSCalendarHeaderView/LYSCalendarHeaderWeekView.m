//
//  LYSCalendarHeaderWeekView.m
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/4.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "LYSCalendarHeader.h"

@implementation LYSCalendarHeaderWeekView

- (instancetype)initCalendar:(LYSCalendar *)calendar
{
    self = [super init];
    if (self) {
        
        [self initUICalendar:calendar];
    }
    return self;
}

- (void)initUICalendar:(LYSCalendar *)calendar {
    
    [calendar lys_CalendarHeaderWeekView:self];
    
}


- (void)updateWeekTitleArray:(NSArray *)weekTitles {
    
    for (UILabel * label in self.subviews) {
        if ([label isKindOfClass:[UILabel class]]) {
            [label removeFromSuperview];
        }
    }
    NSMutableArray * array = [NSMutableArray arrayWithCapacity:weekTitles.count];
    for (NSString * text in weekTitles) {
        [array addObject:[self labelText:text]];
    }
    
    [self lys_AddAndAliquotsViews:array
                        LRpadding:0
                      viewPadding:0
                        direction:LYSViewAliquots_Horizontal];
    
}

- (UILabel *)labelText:(NSString *)text {
    
    return [self labelText:text
                      font:[UIFont systemFontOfSize:13]
                     color:[UIColor lightGrayColor]];
    
}


- (UILabel *)labelText:(NSString *)text font:(UIFont *)font color:(UIColor *)color{
    
    UILabel * label = [[UILabel alloc]init];
    label.text = text;
    label.textColor = color;
    label.font = font;
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}


@end
