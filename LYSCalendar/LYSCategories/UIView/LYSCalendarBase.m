//
//  LYSCalendarBase.m
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/7.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "LYSCalendarHeader.h"

@implementation LYSCalendarBase

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self lys_RandomBackgroundColor];
        
    }
    return self;
}

//- (void)dealloc {
//    
//    DLog(@"释放:%@",[self class]);
//}


@end
