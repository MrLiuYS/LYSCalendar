//
//  PanViewController.m
//  LYSCalendar
//
//  Created by 刘永生 on 2017/1/8.
//  Copyright © 2017年 刘永生. All rights reserved.
//

#import "PanViewController.h"

#import "LYSCalendarHeader.h"

@interface PanViewController ()<LYSCalendarDelegate>

@property (nonatomic, strong) UILabel *yearTitleLabel; /**< <#explain#> */

@end

@implementation PanViewController

+ (PanViewController *)pushInViewController:(UIViewController *)viewController {
    
    PanViewController * ctrl  = [[PanViewController alloc]init];
    ctrl.view.backgroundColor = [UIColor whiteColor];
//    dispatch_async(dispatch_get_main_queue(), ^{    
        [viewController.navigationController pushViewController:ctrl animated:YES];
//    });
    
    
    return ctrl;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    LYSCalendar * calendar = [[LYSCalendar alloc]init];
    
    calendar.delegate = self;
    
    calendar.currentMonth = [NSDate date];
    
    calendar.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:calendar];
    
    [calendar mas_makeConstraints:^(MASConstraintMaker *make){
        
        make.left.top.mas_equalTo(10);
        make.right.bottom.mas_equalTo(-10);
    }];
    
}



- (UILabel *)yearTitleLabel {
    
    if(!_yearTitleLabel) {
        _yearTitleLabel = [[UILabel alloc] init];
    }
    return _yearTitleLabel;
}

@end
