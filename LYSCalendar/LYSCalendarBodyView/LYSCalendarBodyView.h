//
//  LYSCalendarBodyView.h
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/4.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "LYSCalendarHeader.h"

@class LYSCalendarView;

typedef enum
{
    LYSCalendarStatu_Month = 0,
    LYSCalendarStatu_Week,
    LYSCalendarStatu_Apply,/**< 滑动中 */
}
LYSCalendarStatu;


@interface LYSCalendarBodyView : UIView





@property (nonatomic, strong) LYSCalendarView * calendar;

@property (nonatomic, assign) CGFloat currentHeight; /**< 当前高度 */

@property (nonatomic, assign) CGFloat heightMax; /**< 最大值 */
@property (nonatomic, assign) CGFloat heightMin; /**< 最小值 */

@property (nonatomic, assign) LYSCalendarStatu calendarStatu; /**< <#explain#> */


- (void)panGestureRecognizer:(UIPanGestureRecognizer *)gesture;

- (BOOL)isCanPanGesture;


@end
