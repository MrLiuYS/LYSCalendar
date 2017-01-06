//
//  LYSCalendarBodyView.m
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/4.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "LYSCalendarHeader.h"

@interface LYSCalendarBodyView ()

@property (nonatomic, strong) UIScrollView *calendarScrollView; /**< <#explain#> */
@property (nonatomic, strong) UIView *containerView; /**< <#explain#> */

@property (nonatomic, strong) LYSCalendarMonthView *preView; /**< <#explain#> */
@property (nonatomic, strong) LYSCalendarMonthView *currentView; /**< <#explain#> */
@property (nonatomic, strong) LYSCalendarMonthView *nextView; /**< <#explain#> */

@end


@implementation LYSCalendarBodyView

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

    self.clipsToBounds = YES;
    
    self.calendarStatu = LYSCalendarStatu_Month;
    
    self.currentHeight = self.heightMax;
    
    
    
    
}

- (void)initUI {
    
    [self addSubview:self.calendarScrollView];
    
    [self.calendarScrollView addSubview:self.containerView];
    
    [self.containerView addSubview:self.preView];
    [self.containerView addSubview:self.nextView];
    [self.containerView addSubview:self.currentView];
    
    
    [self makeConstraints];
    
    
//    NSLog(@"calendarScrollView:%@",NSStringFromCGRect(self.calendarScrollView.frame));
//    
//    self.calendarScrollView.contentOffset = CGPointMake(self.calendarScrollView.frame.size.width,
//                                                        self.calendarScrollView.contentOffset.y);
    
}

- (void)makeConstraints {
    
    [self.calendarScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo(self.heightMax);
    }];
    
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.calendarScrollView);
        make.height.equalTo(self.calendarScrollView);
    }];
    
    [self.preView mas_makeConstraints:^(MASConstraintMaker *make){
        
        make.left.top.bottom.mas_equalTo(0);
        
        make.width.mas_equalTo(self.calendarScrollView.mas_width);
    }];
    
    [self.currentView mas_makeConstraints:^(MASConstraintMaker *make){
        
        make.top.bottom.mas_equalTo(0);
        make.left.mas_equalTo(self.preView.mas_right);
        make.width.mas_equalTo(self.preView.mas_width);
    }];
    
    [self.nextView mas_makeConstraints:^(MASConstraintMaker *make){
        
        make.top.bottom.mas_equalTo(0);
        make.left.mas_equalTo(self.currentView.mas_right);
        make.width.mas_equalTo(self.preView.mas_width);
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
    
//    CGPoint translation = [gesture translationInView:self];
//    
//    CGFloat absX = fabs(translation.x);
//    CGFloat absY = fabs(translation.y);
//
//    if (absX > absY ) {
//        
//        [self slideHorizont:gesture];
//        
//    } else if (absY > absX) {
    
        [self slideVertical:gesture];
//    }
    
    
}


/**
 水平滑动

 @param gesture <#gesture description#>
 */
- (void)slideHorizont:(UIPanGestureRecognizer *)gesture{
    
    
//    CGFloat offset = [gesture translationInView:self].x;
//    
//    [self.calendarScrollView setContentOffset:CGPointMake(self.calendarScrollView.contentOffset.x - offset,
//                                                          self.calendarScrollView.contentOffset.y)];
    
    
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

- (UIScrollView *)calendarScrollView {
    
    if(!_calendarScrollView) {
        _calendarScrollView = [[UIScrollView alloc] init];
        
//        _calendarScrollView.pagingEnabled = YES;
    }
    return _calendarScrollView;
}
- (UIView *)containerView {
    
    if(!_containerView) {
        _containerView = [[UIView alloc] init];
        
        _containerView.backgroundColor = [UIColor colorWithRed:.1 green:.2 blue:.3 alpha:.4];
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
