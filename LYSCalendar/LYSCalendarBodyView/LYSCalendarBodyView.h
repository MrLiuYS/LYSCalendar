//
//  LYSCalendarBodyView.h
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/4.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "LYSCalendarBase.h"

@class LYSCalendar;

typedef enum
{
    LYSCalendarStatu_Month = 0,
    LYSCalendarStatu_Week,
    LYSCalendarStatu_Apply,/**< 滑动中 */
}
LYSCalendarStatu;


@interface LYSCalendarBodyView : LYSCalendarBase

@property (nonatomic, strong) LYSCalendar * calendar;

@property (nonatomic, assign) CGFloat currentHeight; /**< 当前高度 */

@property (nonatomic, assign) CGFloat heightMax; /**< 最大值 */
@property (nonatomic, assign) CGFloat heightMin; /**< 最小值 */

@property (nonatomic, assign) LYSCalendarStatu calendarStatu; /**< <#explain#> */


- (instancetype)initCalendar:(LYSCalendar *)calendar;



- (void)clickPreMonthBtn:(UIButton *)sender;
- (void)clickNextMonthBtn:(UIButton *)sender;

- (void)updateMonth:(NSDate *)month;

- (void)panGestureRecognizer:(UIPanGestureRecognizer *)gesture;


@end
