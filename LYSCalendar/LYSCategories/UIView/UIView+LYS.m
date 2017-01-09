//
//  UIView+LYS.m
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/6.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "UIView+LYS.h"

@implementation UIView (LYS)


- (void)lys_RandomBackgroundColor {
    
    self.backgroundColor = [self lys_RandomColor];
    
}


- (UIColor *)lys_RandomColor{

    
    CGFloat red = (CGFloat)arc4random() / 0x100000000;
    CGFloat green = (CGFloat)arc4random() / 0x100000000;
    CGFloat blue = (CGFloat)arc4random() / 0x100000000;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:.5f];
}


@end
