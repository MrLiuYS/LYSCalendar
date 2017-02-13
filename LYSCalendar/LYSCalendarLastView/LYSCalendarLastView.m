//
//  LYSCalendarLastView.m
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/4.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "LYSCalendarHeader.h"
#import <pop/POP.h>


@interface LYSCalendarLastView ()

@property (nonatomic, assign) CGFloat oldAnimateWrite; /**< 动画 */

@end


@implementation LYSCalendarLastView

- (void)lys_reloadLastView {
    
    
    [self resetLastView];
    
    [self.calendar lys_CalendarLastView:self];
    
}


- (instancetype)initCalendar:(LYSCalendar *)calendar
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
    
    
    self.topOffset = 0;
}
- (void)initUI {
    
    
    [self makeConstraints];
    
}

- (void)makeConstraints {
    
}

- (CGFloat)topOffsetMin {
    return 0;
}
- (CGFloat)topOffsetMax{
    
    CGFloat calHeight = self.calendar.frame.size.height;
    
    CGFloat bodyHeight = CGRectGetMaxY(self.calendar.bodyView.frame);
    
    CGFloat height = [self.calendar lys_CalendarLastViewHeight];
    
    CGFloat offset = (calHeight - bodyHeight) - height ;

    if (offset>0) {
        return 0;
    }
    
    return offset;
}

- (void)updateLastOffset:(CGFloat )ofset {
    
    CGFloat offset = ofset;
    
    CGFloat tempTopOffset = self.topOffset + offset;
    
    [self updateTopOffset:tempTopOffset];
}


- (void)panGestureRecognizer:(UIPanGestureRecognizer *)gesture {
    
    
    if (gesture.state == UIGestureRecognizerStateEnded) {
        
        self.oldAnimateWrite = 0;
        
        CGPoint velocity = [gesture velocityInView:self];
        
        velocity.x = 0;
        velocity.y = -velocity.y;
        
        POPDecayAnimation *decayAnimation = [POPDecayAnimation animation];
        
        POPAnimatableProperty *prop = [POPAnimatableProperty propertyWithName:@"calendar.lastView.bounds.origin" initializer:^(POPMutableAnimatableProperty *prop) {
    
            prop.readBlock = ^(id obj, CGFloat values[]) {
                
                values[0] = [obj bounds].origin.x;
                values[1] = [obj bounds].origin.y;
            };
            
            prop.writeBlock = ^(id obj, const CGFloat values[]) {
                CGRect tempBounds = [obj bounds];
                
                tempBounds.origin.x = values[0];
                tempBounds.origin.y = values[1];

                [self updateTopOffset:-tempBounds.origin.y + self.topOffset + self.oldAnimateWrite];

                self.oldAnimateWrite = tempBounds.origin.y;

            };
            
            prop.threshold = 10;
        }];
        decayAnimation.property = prop;
        decayAnimation.velocity = [NSValue valueWithCGPoint:velocity];
        [self pop_addAnimation:decayAnimation forKey:@"calendar.lastView.decelerate"];
    }else {
        
        
        CGFloat offset = [gesture translationInView:self].y;
        
        [self updateLastOffset:offset];
    }
    
}

- (void)updateTopOffset:(CGFloat)topOffset{
    
    self.topOffset = topOffset;
    
    if (self.topOffset > self.topOffsetMin) {
        self.topOffset = self.topOffsetMin;
    }
    else if (self.topOffset < self.topOffsetMax) {
        
        self.topOffset = self.topOffsetMax;
    }

    
    [self mas_updateConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(self.calendar.bodyView.mas_bottom).offset(self.topOffset);
    }];
    
}
#pragma mar - 重置
- (void)resetLastView {
    [self updateTopOffset:0];
    
    [self mas_updateConstraints:^(MASConstraintMaker *make){
        
        make.height.mas_equalTo([self.calendar lys_CalendarLastViewHeight]);
        
    }];
    
}


@end
