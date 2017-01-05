//
//  LYSCalendarBodyView.m
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/4.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "LYSCalendarBodyView.h"

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


- (void)panGestureRecognizer:(UIPanGestureRecognizer *)gesture {
    
    CGFloat offset = [gesture translationInView:self].y;
    
    CGPoint velocity = [gesture velocityInView:self];
    
    NSLog(@"%f",offset);
    
    CGFloat tempHeight = self.currentHeight + offset;
    
    if (tempHeight > self.heightMax) {
        tempHeight = self.heightMax;
        
    }
    if (tempHeight < self.heightMin) {
        tempHeight = self.heightMin;
    }
    
    if (gesture.state == UIGestureRecognizerStateEnded) {
        
        if (velocity.y > 0) {
            
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
        
//        if (self.calendarStatu != LYSCalendarStatu_Month) {
//            self.calendarStatu = LYSCalendarStatu_Month;
//        }
        
        
        self.userInteractionEnabled = NO;
        
        [UIView animateWithDuration:kLYSCalendarAnimateWithDuration
                         animations:^{
                             
                             [self mas_updateConstraints:^(MASConstraintMaker *make){
                                 
                                 make.height.mas_equalTo(self.currentHeight);
                                 
                             }];
                             
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
