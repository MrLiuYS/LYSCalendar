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



- (void)panGestureRecognizer:(UIPanGestureRecognizer *)gesture {
    
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

@end
