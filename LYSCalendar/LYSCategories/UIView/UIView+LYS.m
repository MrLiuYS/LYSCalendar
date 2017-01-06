//
//  UIView+LYS.m
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/6.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "UIView+LYS.h"

@implementation UIView (LYS)

+ (UIView *)lys_View{
    
    UIView * view = [[UIView alloc]init];
    
    return view;
}

+ (UIView *)lys_ViewRandomBackgroundColor {
    
    UIView * view = [self lys_View];
    
    CGFloat red = (CGFloat)arc4random() / 0x100000000;
    CGFloat green = (CGFloat)arc4random() / 0x100000000;
    CGFloat blue = (CGFloat)arc4random() / 0x100000000;
    
    view.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:0.5f];

    return view;
}


@end
