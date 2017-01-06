//
//  LYSCalendarBodyView.m
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/4.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "LYSCalendarHeader.h"

@interface LYSCalendarBodyView ()

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
    
    self.calendarStatu = LYSCalendarStatu_Month;
    
}

- (void)initUI {
    
    self.currentHeight = self.heightMax;
    
    
    [self makeConstraints];
    
}

- (void)makeConstraints {
    

    
}

- (CGFloat)heightMax {
    return kLYSCalendarBodyCellHeight * kLYSCalendarCellRows;
}
- (CGFloat)heightMin {
    return kLYSCalendarBodyCellHeight;
}

- (BOOL)isCanPanGesture {
    
    
    
    return YES;
}


- (void)panGestureRecognizer:(UIPanGestureRecognizer *)gesture {
    
    CGFloat offset = [gesture translationInView:self].y;
    
    CGFloat velocityY = [gesture velocityInView:self].y;
    
    CGFloat tempHeight = self.currentHeight + offset;
    
//    if (velocityY > 0) {
//        //        向下
//        if (tempHeight > self.heightMax) {
//            return;
//        }
//        
//    }else {
//        //        向上
//        if (tempHeight < self.heightMin) {
//            return;
//        }
//    }
    
    if (tempHeight > self.heightMax) {
        
        tempHeight = self.heightMax;
        
        self.calendarStatu = LYSCalendarStatu_Month;
    }
    else if (tempHeight < self.heightMin) {
        
        tempHeight = self.heightMin;
        self.calendarStatu = LYSCalendarStatu_Week;
        
    }else {
        
        self.calendarStatu = LYSCalendarStatu_Apply;
    }
    
    if (gesture.state == UIGestureRecognizerStateEnded) {
        
        if (velocityY > 0) {
            
            [self updateHeight:self.heightMax animated:YES];
            
        }else {
            
            [self updateHeight:self.heightMin animated:YES];
            
        }
        
    }else {
        
        [self updateHeight:tempHeight animated:NO];
        
    }
    
}

- (void)updateHeight:(CGFloat)height animated:(BOOL)animated {
    
    self.currentHeight = height;
    
    if (animated) {
        
        self.userInteractionEnabled = NO;
        
        [UIView animateWithDuration:kLYSCalendarAnimateWithDuration
                         animations:^{
                             
                             [self mas_updateConstraints:^(MASConstraintMaker *make){
                                 
                                 make.height.mas_equalTo(self.currentHeight);
                                 
                             }];
                             
                             [self.calendar.lastView resetLastView];
                             
                             
                             [self layoutIfNeeded];
                             
                         } completion:^(BOOL finished) {
                             
                             self.userInteractionEnabled = YES;
                             
                         }];
        
    }else {
        
        [self mas_updateConstraints:^(MASConstraintMaker *make){
            
            make.height.mas_equalTo(self.currentHeight);
            
        }];
        
    }
    

    
}


@end
