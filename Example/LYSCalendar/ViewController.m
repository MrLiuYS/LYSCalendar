//
//  ViewController.m
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/4.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "ViewController.h"

#import "LYSCalendarView.h"

#import <Masonry/Masonry.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    LYSCalendarView * calendar = [[LYSCalendarView alloc]init];
    
    calendar.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:calendar];
    
    [calendar mas_makeConstraints:^(MASConstraintMaker *make){
        
        make.left.top.right.bottom.mas_equalTo(0);
        
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
