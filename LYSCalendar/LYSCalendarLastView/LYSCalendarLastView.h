//
//  LYSCalendarLastView.h
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/4.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYSCalendarLastView : UIView

@property (nonatomic, assign) CGFloat topOffset; /**< 顶部偏移量 */

@property (nonatomic, strong) LYSCalendarView * calendar;

@property (nonatomic, assign) CGFloat topOffsetMax; /**< <#explain#> */
@property (nonatomic, assign) CGFloat topOffsetMin; /**< <#explain#> */



- (void)panGestureRecognizer:(UIPanGestureRecognizer *)gesture;


- (void)resetLastView;

@end
