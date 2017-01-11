//
//  LYSCalendarLastView.h
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/4.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "LYSCalendarBase.h"

@interface LYSCalendarLastView : LYSCalendarBase

@property (nonatomic, assign) CGFloat topOffset; /**< 顶部偏移量 */

@property (nonatomic, unsafe_unretained) LYSCalendar * calendar;

@property (nonatomic, assign) CGFloat topOffsetMax; /**< <#explain#> */
@property (nonatomic, assign) CGFloat topOffsetMin; /**< <#explain#> */


- (instancetype)initCalendar:(LYSCalendar *)calendar;


- (void)panGestureRecognizer:(UIPanGestureRecognizer *)gesture;


- (void)lys_reloadLastView;

- (void)resetLastView;


@end
