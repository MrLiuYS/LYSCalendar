//
//  LYSCalendarBodyView.m
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/4.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "LYSCalendarHeader.h"

#import <pop/POP.h>

@interface LYSCalendarBodyView ()

//@property (nonatomic, strong) UIScrollView *calendarScrollView; /**< <#explain#> */

@property (nonatomic, strong) UIView *headerView; /**< <#explain#> */
@property (nonatomic, strong) UIView *footerView; /**< <#explain#> */

@property (nonatomic, strong) LYSCalendarBase *containerView; /**< <#explain#> */

@property (nonatomic, strong) LYSCalendarMonthView *preView; /**< <#explain#> */
@property (nonatomic, strong) LYSCalendarMonthView *currentView; /**< <#explain#> */
@property (nonatomic, strong) LYSCalendarMonthView *nextView; /**< <#explain#> */

@property (nonatomic, assign) BOOL isPanVertical; /**< 竖直滚动 */

@property (nonatomic, assign) CGFloat currentLeftOffset; /**< 当前月份偏移距离 */

@property (nonatomic, assign) LYSCalendarWeekView * selectWeekView; /**< 选中的weekView */


@end


@implementation LYSCalendarBodyView

- (LYSCalendarDayView *)searchDayViewFromDate:(NSDate *)date {
    
    LYSCalendarDayView * dayView = [self.currentView searchDayViewFromDate:date];
    if (!dayView) {
        dayView = [self.preView searchDayViewFromDate:date];
    }
    if (!dayView) {
        dayView = [self.nextView searchDayViewFromDate:date];
    }
    return dayView;
    
}

- (void)updateMonth:(NSDate *)month {
    
    self.calendar.currentMonth = month;
    
    self.currentView.monthDate = month;
    
    self.preView.monthDate = [self.currentView.monthDate offsetMonth:-1];
    
    self.nextView.monthDate = [self.currentView.monthDate offsetMonth:1];
    
    
    if ([self.calendar lys_CalendarIsAutoRows]) {
        
        [self.currentView mas_updateConstraints:^(MASConstraintMaker *make){
            
            make.bottom.mas_lessThanOrEqualTo([self dayViewHeight] * (6-[self numRows])).priorityMedium();
        }];
        
    }else {
        [self.currentView mas_updateConstraints:^(MASConstraintMaker *make){
            
            make.bottom.mas_lessThanOrEqualTo(0).priorityMedium();
        }];
    }
    
    
    [self updateHeight:self.heightMax];
    
    
}


- (instancetype)initCalendar:(LYSCalendar *)calendar;
{
    self = [super init];
    if (self) {
        self.calendar = calendar;
        [self initData];
        [self initUI];
    }
    return self;
}

- (void)initData {
    
    self.currentLeftOffset  = 0;
    
    self.clipsToBounds = YES;
    
    self.calendarStatu = LYSCalendarStatu_Month;
    
    self.currentHeight = self.heightMax;
    
    
    
    
    
}

- (UIView *)headerView {
    
    if (!_headerView) {
        _headerView = [self.calendar lys_CalendarBodyHeaderView];
    }
    
    return _headerView;
    
}
- (UIView *)footerView {
    
    if (!_footerView) {
        _footerView = [self.calendar lys_CalendarBodyFooterView];
    }
    
    return _footerView;
    
}

- (void)initUI {
    
    
    [self addSubview:self.containerView];
    
    [self.containerView addSubview:self.preView];
    [self.containerView addSubview:self.nextView];
    
    [self.containerView addSubview:self.currentView];
    
    [self addSubview:self.headerView];
    [self addSubview:self.footerView];
    
    [self makeConstraints];
    
}

- (void)makeConstraints {
    
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(self).offset([self.calendar lys_CalendarBodyHeaderViewHeight]);
        make.bottom.mas_equalTo(self).offset(-[self.calendar lys_CalendarBodyFooterViewHeight]);
    }];
    
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make){
        
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo([self.calendar lys_CalendarBodyHeaderViewHeight]);
    }];
    
    [self.footerView mas_makeConstraints:^(MASConstraintMaker *make){
        
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo([self.calendar lys_CalendarBodyFooterViewHeight]);
    }];
    
    
    [self resetContainerView];
    
    
}




- (void)resetContainerView {
    
    [self.currentView mas_remakeConstraints:^(MASConstraintMaker *make){
        
        make.left.mas_equalTo(0);
        make.bottom.mas_lessThanOrEqualTo([self dayViewHeight] * ([self numRows]-6)).priorityMedium();
        make.height.mas_equalTo([self dayViewHeight] * 6).priorityHigh();
        make.width.mas_equalTo(self.containerView.mas_width);
    }];
    
    [self.preView mas_remakeConstraints:^(MASConstraintMaker *make){
        
        make.centerY.width.height.mas_equalTo(self.currentView);
        make.right.mas_equalTo(self.currentView.mas_left);
    }];
    
    [self.nextView mas_remakeConstraints:^(MASConstraintMaker *make){
        make.centerY.width.height.mas_equalTo(self.currentView);
        make.left.mas_equalTo(self.currentView.mas_right);
    }];
    
}


- (void)setCalendarStatu:(LYSCalendarStatu)calendarStatu {
    
    if (_calendarStatu != calendarStatu) {
        
        _calendarStatu = calendarStatu;
        
    }
    
}



#pragma mark - Private method

-(int)numRows {
    
    if ([self.calendar lys_CalendarIsAutoRows]) {
        float lastBlock = [self.calendar.currentMonth numDaysInMonth]+([self.calendar.currentMonth firstWeekDayInMonth] -1);
        return ceilf(lastBlock/7);
    }
    return 6;
    
}

- (CGFloat)heightMax {
    return [self dayViewHeight] * [self numRows] +
    [self.calendar lys_CalendarBodyFooterViewHeight]+
    [self.calendar lys_CalendarBodyHeaderViewHeight];
}
- (CGFloat)heightMin {
    return [self dayViewHeight] +
    [self.calendar lys_CalendarBodyFooterViewHeight]+
    [self.calendar lys_CalendarBodyHeaderViewHeight];
}

- (CGFloat)dayViewHeight {
    return [self.calendar lys_CalendarBodyDayViewHeight];
}

- (CGFloat)selectTopMin {
    
    return -100;
    
}


- (void)panGestureRecognizer:(UIPanGestureRecognizer *)gesture {
    
    CGPoint translation = [gesture translationInView:self];
    
    CGFloat absX = fabs(translation.x);
    CGFloat absY = fabs(translation.y);
    
    if (gesture.state == UIGestureRecognizerStateBegan) {
        
        [self.calendar.lastView pop_removeAnimationForKey:@"calendar.lastView.decelerate"];
        
        UIView *piece = gesture.view;
        CGPoint locationInView = [gesture locationInView:piece];
        
        
        DLog(@"locationInView:%@",NSStringFromCGPoint(locationInView));
        DLog(@"frame:%@",NSStringFromCGRect(self.frame));
        
        if (CGRectContainsPoint([self.currentView convertRect:self.currentView.frame toView:self],
                                locationInView)) {
        
            if (absX < absY ) {
                self.isPanVertical = YES;
            }else {
                self.isPanVertical = NO;
            }
            
        }else {
            self.isPanVertical = YES;
        }
        
    }
    
    if (self.isPanVertical) {
        
        if ([self.calendar lys_CalendarPanVertical]) {
            
            [self slideVertical:gesture];
        }
        
    }else {
        
        if ([self.calendar lys_CalendarPanHorizont]) {
            
            [self slideHorizont:gesture];
        }
        
    }
    
}


/**
 水平滑动
 
 @param gesture <#gesture description#>
 */
- (void)slideHorizont:(UIPanGestureRecognizer *)gesture{
    
    
    CGFloat offset = [gesture translationInView:self].x;
    
    self.currentLeftOffset += offset;
    
    if (gesture.state == UIGestureRecognizerStateEnded) {
        
        CGFloat velocityX = [gesture velocityInView:self].x;
        
        if (velocityX > 0) {
            [self slidePreMonth];
        }else{
            [self slideNextMonth];
        }
        
    }else {
        [self.currentView mas_updateConstraints:^(MASConstraintMaker *make){
            
            make.left.mas_equalTo(self.containerView.mas_left).offset(self.currentLeftOffset);
            
        }];
    }
    
}

- (void)slidePreMonth {
    
    [UIView animateWithDuration:kLYSCalendarAnimateWithDuration
                     animations:^{
                         
                         
                         [self.currentView mas_updateConstraints:^(MASConstraintMaker *make){
                             
                             make.left.mas_equalTo(self.containerView.mas_left).offset(self.containerView.frame.size.width);
                             
                         }];
                         
                         [self.currentView.superview layoutIfNeeded];
                         
                         
                     } completion:^(BOOL finished) {
                         
                         if (finished) {
                             
                             self.currentLeftOffset = 0;
                             
                             LYSCalendarMonthView * tempCurrent = self.currentView;
                             
                             self.currentView = self.preView;
                             
                             self.preView = self.nextView;
                             
                             self.nextView = tempCurrent;
                             
                             [self resetContainerView];
                             
                             [self updateMonth:self.currentView.monthDate];
                             
                             [self.calendar lys_CalendarCurrentPageDidChange];
                         }
                         
                     }];
    
    
    
    
}


- (void)slideNextMonth {
    
    [UIView animateWithDuration:kLYSCalendarAnimateWithDuration
                     animations:^{
                         
                         [self.currentView mas_updateConstraints:^(MASConstraintMaker *make){
                             
                             make.left.mas_equalTo(self.containerView.mas_left).offset(-self.containerView.frame.size.width);
                             
                         }];
                         
                         [self.currentView.superview layoutIfNeeded];
                         
                         
                     } completion:^(BOOL finished) {
                         
                         if (finished) {
                             
                             self.currentLeftOffset = 0;
                             
                             LYSCalendarMonthView * tempCurrent = self.currentView;
                             
                             self.currentView = self.nextView;
                             
                             self.nextView = self.preView;
                             
                             self.preView = tempCurrent;
                             
                             [self resetContainerView];
                             
                             [self updateMonth:self.currentView.monthDate];
                             
                             [self.calendar lys_CalendarCurrentPageDidChange];
                         }
                         
                     }];
    
    
    
    
}


/**
 竖直滑动
 */
- (void)slideVertical:(UIPanGestureRecognizer *)gesture {
    
    CGFloat offset = [gesture translationInView:self].y;
    
    
    CGFloat tempHeight = self.currentHeight + offset;
    
    if (tempHeight > self.heightMax) {
        
        tempHeight = self.heightMax;
        [self updateHeight:tempHeight];
        [self.calendar.lastView panGestureRecognizer:gesture];
        
    }
    else if (tempHeight < self.heightMin) {
        
        tempHeight = self.heightMin;
        [self updateHeight:tempHeight];
        
        [self.calendar.lastView panGestureRecognizer:gesture];
        
    }else {
        
        if (self.calendar.lastView.topOffset == 0) {
            
            if (gesture.state == UIGestureRecognizerStateEnded) {
                
                if (self.calendar.lastView.topOffset == 0) {
                    
                    CGFloat velocityY = [gesture velocityInView:self].y;
                    
                    if (velocityY < 0) {
                        [self updateHeight:self.heightMin animated:YES];
                    }else{
                        [self updateHeight:self.heightMax animated:YES];
                    }
                    
                }
                
            }else {
                
                if (gesture.state == UIGestureRecognizerStateBegan) {
                    
                    
                    self.selectWeekView = [self.currentView searchWeekViewFromDate:self.calendar.selectDate];
                    
                    
                    if (self.selectWeekView) {
                        
                        [self.currentView mas_updateConstraints:^(MASConstraintMaker *make){
                            
                            make.top.mas_greaterThanOrEqualTo(-self.selectWeekView.frame.origin.y);
                            
                        }];
                        
                    }else {
                        [self.currentView mas_updateConstraints:^(MASConstraintMaker *make){
                            
                            make.top.mas_greaterThanOrEqualTo(0);
                            
                        }];
                    }
                    
                    
                }
                
                [self updateHeight:tempHeight];
            }
            
        }else {
            
            [self.calendar.lastView panGestureRecognizer:gesture];
        }
        
    }
    
    
}


- (void)updateHeight:(CGFloat)height animated:(BOOL)animated {
    
    if (animated) {
        
        if (height == self.heightMax) {
            
            self.calendarStatu = LYSCalendarStatu_Month;
            
        }else {
            
            self.calendarStatu = LYSCalendarStatu_Week;
        }
        
        
        self.userInteractionEnabled = NO;
        
        [UIView animateWithDuration:kLYSCalendarAnimateWithDuration
                         animations:^{
                             
                             [self updateHeight:height];
                             
                             [self.superview layoutIfNeeded];
                             
                         } completion:^(BOOL finished) {
                             
                             self.userInteractionEnabled = YES;
                             
                         }];
        
    }else {
        
        [self updateHeight:height];
        
    }
    
}

- (void)updateHeight:(CGFloat)height {
    
    self.currentHeight = height;
    
    [self mas_updateConstraints:^(MASConstraintMaker *make){
        
        make.height.mas_equalTo(self.currentHeight);
        
    }];
}


#pragma mark - proprety

- (LYSCalendarBase *)containerView {
    
    if(!_containerView) {
        _containerView = [[LYSCalendarBase alloc] init];
        
    }
    return _containerView;
}

- (LYSCalendarMonthView *)preView {
    
    if(!_preView) {
        _preView = [[LYSCalendarMonthView alloc] initCalendar:self.calendar];
    }
    return _preView;
}
- (LYSCalendarMonthView *)currentView {
    
    if(!_currentView) {
        _currentView = [[LYSCalendarMonthView alloc] initCalendar:self.calendar];
    }
    return _currentView;
}
- (LYSCalendarMonthView *)nextView {
    
    if(!_nextView) {
        _nextView = [[LYSCalendarMonthView alloc] initCalendar:self.calendar];
    }
    return _nextView;
}



@end
