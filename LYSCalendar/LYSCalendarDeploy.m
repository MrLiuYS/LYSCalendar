//
//  LYSCalendarDeploy.m
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/4.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "LYSCalendarDeploy.h"

@implementation LYSCalendarDeploy

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initData];
    }
    return self;
}

- (void)initData {
 
    
    self.calendarType = LYSCalendarTypeFixedSixRows;
}



//- (void)setCalendarType:(LYSCalendarType)calendarType {
//    
//    _calendarType = calendarType;
//    
//    switch (calendarType) {
//        case LYSCalendarTypeFixedSixRows:
//        {
//            self.bodyCellRowInt = 6;
//            break;
//        }
//        default:
//            //TODO<MrLYS>:
//            
//            break;
//    }
//    
//}



@end
