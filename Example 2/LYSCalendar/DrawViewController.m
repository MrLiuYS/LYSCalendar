//
//  DrawViewController.m
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/13.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "DrawViewController.h"

#import "LYSCalendarHeader.h"

@interface DrawViewController ()

@end

@implementation DrawViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



- (BOOL)lysCalendarIsAutoRows:(LYSCalendar *)calendar{
    return YES;
}

/**
 头部视图高度
 */
- (CGFloat)lysCalendarHeaderViewHeight:(LYSCalendar *)calendar{

    return 100;
}

/**
 头部视图
 */
- (UIView *)lysCalendarHeaderView:(LYSCalendar *)calendar{
    
    UIView * view = [[UIView alloc]init];
    
    return view;
}

/**
 底部视图高度
 */
- (CGFloat)lysCalendarFooterViewHeight:(LYSCalendar *)calendar{
    
    return 100;
}

/**
 底部视图
 */
- (UIView *)lysCalendarFooterView:(LYSCalendar *)calendar{
    
    UIView * view = [[UIView alloc]init];
    
    return view;
}

/**
 月/周视图 的高度
 */
- (CGFloat)lysCalendarBodyStartViewHeight:(LYSCalendar *)calendar{
    
    return 100;
}

/**
 月/周视图 的头部
 */
- (UIView *)lysCalendarBodyStartView:(LYSCalendar *)calendar{
    
    UIView * view = [[UIView alloc]init];
    
    return view;
}

/**
 月/周视图 的高度
 */
- (CGFloat)lysCalendarBodyEndViewHeight:(LYSCalendar *)calendar{
    
    return 100;
}

/**
 月/周视图 的尾部
 */
- (UIView *)lysCalendarBodyEndView:(LYSCalendar *)calendar{
    
    UIView * view = [[UIView alloc]init];
    
    return view;
}


- (CGFloat)lysCalendarBodyViewCellHeight:(LYSCalendar *)calendar{
    
    return 100;
}

- (UIView *)lysCalendar:(LYSCalendar *)calendar cellForRowAtDate:(NSDate *)date{
    
    UIView * view = [[UIView alloc]init];
    
    return view;
}

- (void)lysCalendar:(LYSCalendar *)calendar didSelectRowAtDate:(NSDate *)date{
    
    
    
}






@end
