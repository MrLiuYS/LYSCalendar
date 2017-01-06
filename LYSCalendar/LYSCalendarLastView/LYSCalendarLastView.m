//
//  LYSCalendarLastView.m
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/4.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "LYSCalendarHeader.h"

@implementation LYSCalendarLastView


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
    self.topOffset = 0;
}
- (void)initUI {
    
    
    [self makeConstraints];
    
}

- (void)makeConstraints {
    
}

- (void)panGestureRecognizer:(UIPanGestureRecognizer *)gesture {
    
    
    if (self.calendar.bodyView.calendarStatu == LYSCalendarStatu_Apply) {
        
        NSLog(@"lastView重置");
        
        
        
        return;
    }
    
    
    CGFloat offset = [gesture translationInView:self].y;
    
    CGFloat velocityY = [gesture velocityInView:self].y;
    
    if (velocityY > 0) {
//        向下
        if (self.topOffset <= 0) {
            
            self.topOffset = 0;
            [self mas_updateConstraints:^(MASConstraintMaker *make){
                make.top.mas_equalTo(self.calendar.bodyView.mas_bottom);
            }];

            
            return;
        }
        
    }else {
//        向上
        
        //TODO<MrLYS>: 如果超出现实屏幕.
        
//        获取lastView 的
        CGPoint lastViewMaxPoint = [self convertPoint:CGPointMake(self.frame.size.width,
                                                                  self.frame.size.height)
                                               toView:self.calendar];
        
        NSLog(@"lastViewMaxPoint:%@",NSStringFromCGPoint(lastViewMaxPoint));
        
        if (CGRectContainsPoint(self.calendar.frame, lastViewMaxPoint)) {
            
            
            
            
            return;
        }
    }
    
    
    
    self.topOffset += offset;
    
    
    [self mas_updateConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(self.calendar.bodyView.mas_bottom).offset(self.topOffset);
    }];
    
    
    
    
}


- (void)resetLastView {
    
    self.topOffset = 0;
    [self mas_updateConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(self.calendar.bodyView.mas_bottom).offset(self.topOffset);
    }];
    
}

@end
