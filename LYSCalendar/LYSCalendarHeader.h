//
//  LYSCalendarHeader.h
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/5.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#ifndef LYSCalendarHeader_h
#define LYSCalendarHeader_h


#import <UIKit/UIKit.h>

#import <Masonry/Masonry.h>

#import "LYSCalendar.h"

#import "LYSCalendarHeaderView.h"
#import "LYSCalendarHeaderYearView.h"
#import "LYSCalendarHeaderWeekView.h"

#import "LYSCalendarBodyView.h"
#import "LYSCalendarMonthView.h"
#import "LYSCalendarWeekView.h"
#import "LYSCalendarDayView.h"


#import "LYSCalendarLastView.h"


#import "UIView+LYS.h"
#import "UIView+LYSAliquots.h"


#import "NSDate+LYS.h"

#import "LYSCalendarBase.h"


#define kLYSCalendarCellRows 6


#define kLYSCalendarAnimateWithDuration 0.1


#ifdef DEBUG
#   define DLog(fmt, ...) {NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);}
#   define ELog(err) {if(err) DLog(@"%@", err)}
#else
#   define DLog(...)
#   define ELog(err)
#endif



#endif /* LYSCalendarHeader_h */
