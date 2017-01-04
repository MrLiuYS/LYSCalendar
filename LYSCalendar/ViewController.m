//
//  ViewController.m
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/4.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "ViewController.h"

#import "LYSCalendar.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    LYSCalendar * calendar = [[LYSCalendar alloc]initWithFrame:CGRectMake(0, 0, 300, 500)];
    
    calendar.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:calendar];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
