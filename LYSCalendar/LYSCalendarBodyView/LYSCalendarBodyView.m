//
//  LYSCalendarBodyView.m
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/4.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "LYSCalendarHeader.h"

@interface LYSCalendarBodyView ()

//@property (nonatomic, strong) UIScrollView *calendarScrollView; /**< <#explain#> */

@property (nonatomic, strong) LYSCalendarBase *containerView; /**< <#explain#> */

@property (nonatomic, strong) LYSCalendarMonthView *preView; /**< <#explain#> */
@property (nonatomic, strong) LYSCalendarMonthView *currentView; /**< <#explain#> */
@property (nonatomic, strong) LYSCalendarMonthView *nextView; /**< <#explain#> */

@property (nonatomic, assign) BOOL isPanVertical; /**< 竖直滚动 */

@property (nonatomic, assign) CGFloat currentLeftOffset; /**< 当前月份偏移距离 */




@end


@implementation LYSCalendarBodyView


- (void)updateMonth:(NSDate *)month {
    
    
    self.currentView.monthDate = month;
    
//    [self.currentView updateMonth];
    
    self.preView.monthDate = [self.currentView.monthDate offsetMonth:-1];
    
    self.nextView.monthDate = [self.currentView.monthDate offsetMonth:1];
    
}

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
    
    
//    [self addObserver:self
//           forKeyPath:@"currentLeftOffset"
//              options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld)
//              context:@"currentLeftOffset"];
    
    
    self.currentLeftOffset  = 0;

    self.clipsToBounds = YES;
    
    self.calendarStatu = LYSCalendarStatu_Month;
    
    self.currentHeight = self.heightMax;

}

- (void)initUI {
    
//    [self addSubview:self.calendarScrollView];
//    
//    [self.calendarScrollView addSubview:self.containerView];
//    
//    [self.containerView addSubview:self.preView];
//    [self.containerView addSubview:self.nextView];
//    [self.containerView addSubview:self.currentView];

    [self addSubview:self.containerView];
    
    [self.containerView addSubview:self.preView];
    [self.containerView addSubview:self.nextView];
    
    [self.containerView addSubview:self.currentView];
    
    [self makeConstraints];
    
}



- (void)clickPreMonthBtn:(UIButton *)sender {
    
    self.calendar.currentMonth = [self.calendar.currentMonth offsetMonth:-1];
    
    [self updateMonth:self.calendar.currentMonth];
    
}
- (void)clickNextMonthBtn:(UIButton *)sender {
    
    self.calendar.currentMonth = [self.calendar.currentMonth offsetMonth:1];
    
    [self updateMonth:self.calendar.currentMonth];
    
}

- (void)makeConstraints {
    
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.top.right.bottom.mas_equalTo(0);
    }];
    
    [self resetContainerView];
    

}
- (void)resetContainerView {
    
    [self.currentView mas_remakeConstraints:^(MASConstraintMaker *make){
        
        make.left.top.mas_equalTo(0);
        make.height.mas_equalTo(self.heightMax);
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
        
        [self updateBodyView];
    }
    
}

- (void)updateBodyView {
    
    if (self.calendarStatu == LYSCalendarStatu_Month) {
        
        //TODO<MrLYS>: 月份
        
    }else {
        
        //TODO<MrLYS>: 周
        
    }
    
}



#pragma mark - Private method

- (CGFloat)heightMax {
    return kLYSCalendarBodyCellHeight * kLYSCalendarCellRows;
}
- (CGFloat)heightMin {
    return kLYSCalendarBodyCellHeight;
}
- (void)panGestureRecognizer:(UIPanGestureRecognizer *)gesture {
    
    CGPoint translation = [gesture translationInView:self];
    
    CGFloat absX = fabs(translation.x);
    CGFloat absY = fabs(translation.y);
    
    if (gesture.state == UIGestureRecognizerStateBegan) {
        
        if (absX > absY ) {
            self.isPanVertical = NO;
        }else {
            self.isPanVertical = YES;
        }
        
    }
    
    if (self.isPanVertical) {
        
        [self slideVertical:gesture];
        
    }else {
        [self slideHorizont:gesture];
        
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
    
    
    //TODO<MrLYS>: 即将滑动到上一个月份

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
                             
                             
                             self.preView.monthDate = [self.currentView.monthDate offsetMonth:-1];
                             
                             self.nextView.monthDate = [self.currentView.monthDate offsetMonth:1];
                             
                             //TODO<MrLYS>: 已经滑动到上一个月份
                         }
                         
                     }];
    
    
    
    
}


- (void)slideNextMonth {
    
    //TODO<MrLYS>: 即将滑动到下一个月份
    
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
                             
                             
                             self.preView.monthDate = [self.currentView.monthDate offsetMonth:-1];
                             
                             self.nextView.monthDate = [self.currentView.monthDate offsetMonth:1];
                             
                             //TODO<MrLYS>: 已经滑动到下一个月份
                         }
                         
                     }];
    
    

    
}


/**
 竖直滑动

 @param gesture <#gesture description#>
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

//- (UIScrollView *)calendarScrollView {
//    
//    if(!_calendarScrollView) {
//        _calendarScrollView = [[UIScrollView alloc] init];
//        
////        _calendarScrollView.pagingEnabled = YES;
//    }
//    return _calendarScrollView;
//}
- (LYSCalendarBase *)containerView {
    
    if(!_containerView) {
        _containerView = [[LYSCalendarBase alloc] init];
        
    }
    return _containerView;
}

- (LYSCalendarMonthView *)preView {
    
    if(!_preView) {
        _preView = [[LYSCalendarMonthView alloc] init];
        _preView.backgroundColor = [UIColor greenColor];
    }
    return _preView;
}
- (LYSCalendarMonthView *)currentView {
    
    if(!_currentView) {
        _currentView = [[LYSCalendarMonthView alloc] init];
        _currentView.backgroundColor = [UIColor yellowColor];
    }
    return _currentView;
}
- (LYSCalendarMonthView *)nextView {
    
    if(!_nextView) {
        _nextView = [[LYSCalendarMonthView alloc] init];
        _nextView.backgroundColor = [UIColor redColor];
    }
    return _nextView;
}



@end
